USE [LoanStarMessageBusBroker]
GO
/****** Object:  StoredProcedure [dbo].[UpdateConsumerContracts]    Script Date: 1/13/2020 1:48:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateConsumerContracts]
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
