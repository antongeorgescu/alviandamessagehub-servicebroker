USE [LoanStarMessageBusBroker]
GO
/****** Object:  StoredProcedure [dbo].[SaveConsumer]    Script Date: 1/13/2020 7:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SaveConsumer]
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
