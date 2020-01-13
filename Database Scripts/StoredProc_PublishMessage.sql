USE [LoanStarMessageBusBroker]
GO
/****** Object:  StoredProcedure [dbo].[PublishMessage]    Script Date: 1/10/2020 4:26:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PublishMessage] 
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
	-- Get all the targeted services for this contract 
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
		PRINT @service
		
		BEGIN DIALOG CONVERSATION @ch
			  FROM SERVICE [ServicePublisher]
			  TO SERVICE @service
			  ON CONTRACT @contract
			  WITH ENCRYPTION = OFF ;
		
		SELECT @msg = [Topic] FROM [dbo].[BrokerContractMessageTypes] WHERE [Contract] = @ContractName;
		--IF (@ContractName = 'mhb.cbs.ContractInType0')
		--	SET @msg = '<DateTimeRequest>What time is it?</DateTimeRequest>';
		--ELSE IF (@ContractName = 'mhb.cbs.ContractInType1')
		--	SET @msg = '<LanguageRequest>What is your language?</LanguageRequest>';
		--ELSE IF (@ContractName = 'mhb.cbs.ContractInType2')
		--	SET @msg = '<CountryRequest>What is your country?</CountryRequest>';
		--ELSE IF (@ContractName = 'mhb.cbs.ContractInType3')
		--	SET @msg = '<CapitalCityRequest>What is your capital?</CapitalCityRequest>';
		--ELSE IF (@ContractName = 'mhb.cbs.ContractInType4')
		--	SET @msg = '<FavouriteSportRequest>What is favourite sport?</FavouriteSportRequest>';	

		SEND ON CONVERSATION @ch 
		   MESSAGE TYPE [mhb.cbs.InRequestMessage] 
		   (@msg) ;
		COMMIT TRANSACTION
		-- Get the next service.  
		FETCH NEXT FROM services_cursor   
		INTO @service 
	END   
	CLOSE services_cursor;  
	DEALLOCATE services_cursor;  

END
