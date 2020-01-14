USE [AlviandaMessageBroker]
GO

/****** Object:  StoredProcedure [dbo].[SaveConsumer]    Script Date: 1/14/2020 11:10:57 AM ******/
DROP PROCEDURE [dbo].[SaveConsumer]
GO

/****** Object:  StoredProcedure [dbo].[SaveConsumer]    Script Date: 1/14/2020 11:10:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================
-- Author:		Anton Georgescu
-- Create date: January 14, 2020
-- Description:	Create/update consumer (subscriber) Service Broker profile
--              This profile includes consumer info (name, description),
--              Service Broker queue and Processor (worker) name
-- ==========================================================================
CREATE PROCEDURE [dbo].[SaveConsumer]
	-- Add the parameters for the stored procedure here
	@QueueConsumer NVARCHAR(50), 
	@ConsumerName NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@WorkerName NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS(SELECT QueueConsumer
				FROM dbo.BrokerConsumers
				WHERE QueueConsumer = @QueueConsumer)
		BEGIN			
			-- It is a new customer
			-- Create consumer queue
			DECLARE @SQLString NVARCHAR(MAX)
			SET @SQLString =  
					 N'CREATE QUEUE ' + @QueueConsumer + ' WITH STATUS = ON;'  
			EXECUTE sp_executesql @SQLString; 

			-- Insert statements for procedure here
			INSERT INTO dbo.BrokerConsumers 
				(QueueConsumer,[Name],[Description], WorkerName)
			VALUES
				(@QueueConsumer,@ConsumerName,@Description,@WorkerName) 
		END
	ELSE
		BEGIN
			-- Update existing customer
			UPDATE dbo.BrokerConsumers 
				SET [Name] = @ConsumerName,
					WorkerName = @WorkerName, 
					[Description] = @Description
				WHERE QueueConsumer = @QueueConsumer
		END
END
GO


