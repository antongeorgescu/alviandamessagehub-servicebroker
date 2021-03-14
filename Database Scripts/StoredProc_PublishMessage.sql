USE [AlviandaMessageBroker]
GO

/****** Object:  StoredProcedure [dbo].[PublishMessage]    Script Date: 3/13/2021 11:49:08 PM ******/
DROP PROCEDURE [dbo].[PublishMessage]
GO

/****** Object:  StoredProcedure [dbo].[PublishMessage]    Script Date: 3/13/2021 11:49:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ======================================================
-- Author:		Anton Georgescu
-- Create date: January 14, 2020
-- Description:	Publish a message to Publisher Service
-- ======================================================
CREATE PROCEDURE [dbo].[PublishMessage] 
	-- Add the parameters for the stored procedure here
	@ContractName nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @service sysname, @contract sysname;  
	DECLARE @ch UNIQUEIDENTIFIER
	DECLARE @msg NVARCHAR(MAX) ;
    
	DECLARE services_cursor CURSOR FOR   
	
	-- Get all consumer services for this contract 
	SELECT ServiceConsumer 
	FROM BrokerServicesMatrix 
	WHERE [Contract] = @ContractName; 
  
	OPEN services_cursor  
  
	FETCH NEXT FROM services_cursor   
	INTO @service
  
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		BEGIN TRANSACTION ;
		SET @contract = @ContractName
		PRINT 'Service:'+@service+', Contract:'+@contract
		
		BEGIN DIALOG CONVERSATION @ch
			  FROM SERVICE [ServicePublisher]
			  TO SERVICE @service
			  ON CONTRACT @contract
			  WITH ENCRYPTION = OFF ;
		
		-- Select the topic for the contract specified
		SELECT @msg = [Topic] FROM [dbo].[BrokerContractMessageTypes] WHERE [Contract] = @ContractName;
		
		-- Start the conversation with a consumer service
		SEND ON CONVERSATION @ch 
		   MESSAGE TYPE [mhb.cbs.InRequestMessage] 
		   (@msg) ;
		COMMIT TRANSACTION

		-- Get the next consumer service.  
		FETCH NEXT FROM services_cursor   
		INTO @service 
	END   
	CLOSE services_cursor;  
	DEALLOCATE services_cursor;  

END
GO



