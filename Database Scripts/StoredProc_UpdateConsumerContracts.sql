USE [AlviandaMessageBroker]
GO

/****** Object:  StoredProcedure [dbo].[UpdateConsumerContracts]    Script Date: 1/14/2020 11:15:36 AM ******/
DROP PROCEDURE [dbo].[UpdateConsumerContracts]
GO

/****** Object:  StoredProcedure [dbo].[UpdateConsumerContracts]    Script Date: 1/14/2020 11:15:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ==================================================================
-- Author:		Anton Georgescu
-- Create date: January 14, 2020
-- Description:	Manage Service Broker services for existing queue
-- ==================================================================
CREATE PROCEDURE [dbo].[UpdateConsumerContracts]
	-- Add the parameters for the stored procedure here
	@QueueConsumer NVARCHAR(50), 
	@Contract NVARCHAR(50),
	@Action NVARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @ServiceConsumer NVARCHAR(MAX)
	DECLARE @SQLString NVARCHAR(MAX)
	
	IF (@Action = 'ADD')
		BEGIN
			IF EXISTS(SELECT QueueConsumer,[Contract],[ServiceConsumer]
				FROM dbo.BrokerServicesMatrix
				WHERE QueueConsumer = @QueueConsumer AND [Contract] = @Contract)
				-- To be added service for existing queue & contract already exists, force exit
				RETURN;

			DECLARE @temp varchar(255)
			SELECT @temp = 'Svc' + @QueueConsumer + @Contract;
			SELECT @temp = REPLACE(@temp,'.','');
			SELECT @temp = REPLACE(@temp,' ','');
			SET @ServiceConsumer = @temp;
						
			-- create Service Consumer
			SET @SQLString =  
				N'CREATE SERVICE ' + @ServiceConsumer + ' ON QUEUE ' +  @QueueConsumer + ' (['+ @Contract + '])'
			EXECUTE sp_executesql @SQLString; 
			
			-- Insert statements for procedure here
			BEGIN TRY
				INSERT INTO dbo.BrokerServicesMatrix
					(QueueConsumer,[Contract],[ServiceConsumer])
				VALUES
					(@QueueConsumer,@Contract,@ServiceConsumer)
			END TRY
			BEGIN CATCH
				PRINT 'Continue...'
			END CATCH

		END 
	ELSE IF (@Action = 'REMOVE')
		BEGIN
			IF NOT EXISTS(SELECT QueueConsumer,[Contract],[ServiceConsumer]
				FROM dbo.BrokerServicesMatrix
				WHERE QueueConsumer = @QueueConsumer AND [Contract] = @Contract)
				-- To be removed service for existing queue & contract does not exist, force exit
				RETURN;

			-- Retrieve service name
			SELECT @ServiceConsumer = [ServiceConsumer]
				FROM dbo.BrokerServicesMatrix
				WHERE QueueConsumer = @QueueConsumer AND [Contract] = @Contract
			
			-- delete Service Consumer
			SET @SQLString =  
						N'DROP SERVICE ' + @ServiceConsumer + ';'  
			EXECUTE sp_executesql @SQLString; 

			BEGIN TRY
				-- Remove row from BrokerServicesMatrix
				DELETE dbo.BrokerServicesMatrix
					WHERE QueueConsumer = @QueueConsumer 
							AND [Contract] = @Contract
							AND [ServiceConsumer] = @ServiceConsumer
			END TRY
			BEGIN CATCH
				PRINT 'Continue...'
			END CATCH
		END 
END
GO


