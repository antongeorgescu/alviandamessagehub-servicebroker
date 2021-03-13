USE [AlviandaMessageBroker]
GO

/****** Object:  StoredProcedure [dbo].[ConsumeMessage]    Script Date: 1/14/2020 11:07:40 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[ConsumeMessage]
GO

/****** Object:  StoredProcedure [dbo].[ConsumeMessage]    Script Date: 1/14/2020 11:07:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =========================================================================================
-- Author:		Anton Georgescu
-- Create date: January 14, 2020
-- Description:	Process a message published to Consumer queue (served by Consumer service)
-- =========================================================================================
CREATE PROCEDURE [dbo].[ConsumeMessage] 
	-- Add the parameters for the stored procedure here
	@QueueConsumer nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @service sysname, @contract sysname;  
	DECLARE @ch UNIQUEIDENTIFIER
	DECLARE @msg NVARCHAR(MAX) ;
	DECLARE @messagetypename NVARCHAR(256)
	DECLARE @messagebody XML
	DECLARE @responsemessage XML
	DECLARE @messagebodystr NVARCHAR(MAX)
	DECLARE @contractname NVARCHAR(MAX)
	DECLARE @messagetype NVARCHAR(50)

	DECLARE @SQLString nvarchar(500);  
	DECLARE @ParmDefinition nvarchar(500); 
	
    
	DECLARE msgtypes_cursor CURSOR FOR   

	-- Get all message types for this contract and put them in a cursor
	SELECT c.TargetMessageType
	FROM BrokerContractMessageTypes c
	INNER JOIN BrokerServicesMatrix s
	ON c.Contract = s.Contract
	WHERE s.QueueConsumer = @QueueConsumer;
        
	OPEN msgtypes_cursor  
  
	FETCH NEXT FROM msgtypes_cursor   
	INTO @messagetype
  
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		
		BEGIN TRANSACTION ;

		--/* Build the SQL string one time.*/  
		--SET @SQLString =  
		--	 N'RECEIVE TOP(1)
		--		@ch = conversation_handle,
		--		@messagetypename = message_type_name,
		--		@messagebody = CAST(message_body AS XML)
		--		FROM ' + @QueueConsumer;  
 
		--EXECUTE sp_executesql @SQLString; 

		SET @QueueConsumer = REPLACE(@QueueConsumer,' ','')

		IF @QueueConsumer = 'dbo.QueueConsumerA'
			RECEIVE TOP(1)
			@ch = conversation_handle,
			@messagetypename = message_type_name,
			@contractname = service_contract_name,
			@messagebody = CAST(message_body AS XML)
			FROM dbo.QueueConsumerA

		IF @QueueConsumer = 'dbo.QueueConsumerB'
			RECEIVE TOP(1)
			@ch = conversation_handle,
			@messagetypename = message_type_name,
			@contractname = service_contract_name,
			@messagebody = CAST(message_body AS XML)
			FROM dbo.QueueConsumerB

		IF @QueueConsumer = 'dbo.QueueConsumerC'
			RECEIVE TOP(1)
			@ch = conversation_handle,
			@messagetypename = message_type_name,
			@contractname = service_contract_name,
			@messagebody = CAST(message_body AS XML)
			FROM dbo.QueueConsumerC

		IF @QueueConsumer = 'dbo.QueueConsumerD'
			RECEIVE TOP(1)
			@ch = conversation_handle,
			@messagetypename = message_type_name,
			@contractname = service_contract_name,
			@messagebody = CAST(message_body AS XML)
			FROM dbo.QueueConsumerD

		IF @QueueConsumer = 'dbo.QueueConsumerE'
			RECEIVE TOP(1)
			@ch = conversation_handle,
			@messagetypename = message_type_name,
			@contractname = service_contract_name,
			@messagebody = CAST(message_body AS XML)
			FROM dbo.QueueConsumerE

		PRINT 'Conversation handle: ' + CAST(@ch AS NVARCHAR(MAX))
		PRINT 'Message type: ' + @messagetypename
		PRINT 'Contract name: ' + @contractname
		PRINT 'Message body: ' + CAST(@messagebody AS NVARCHAR(MAX))

		DECLARE @rows int			
		SELECT @rows = COUNT(*) 
			FROM BrokerContractMessageTypes 
			WHERE [Contract] = @contractname AND TargetMessageType = @messagetype
		IF (@rows>0)
			BEGIN
				DECLARE @tempstr NVARCHAR(MAX)

				IF (@ContractName = 'mhb.cbs.ContractInType0')
					BEGIN
						SELECT @tempstr = REPLACE(CAST(@messagebody AS NVARCHAR(MAX)),'<DateTimeRequest>','')
						SELECT @tempstr = REPLACE(@tempstr,'</DateTimeRequest>','')
						IF (@tempstr = 'What time is it?')
						BEGIN
							-- Get time offset from customer data
							DECLARE @timeoffset int
							SELECT @timeoffset = [Timeoffset] FROM [dbo].[ConsumerData] WHERE [Consumer] = @QueueConsumer
							-- Construct the response message
							SET @responsemessage = '<DateTimeResponse>Response from ' + @QueueConsumer + ': Current time is '
								+ CAST(SYSDATETIME() AS nvarchar(256)) + ' offset by ' +  CAST(@timeoffset AS nvarchar(100))
								+ ' hours</DateTimeResponse>' ;
							-- Send the response message back to the initiating service
							SEND ON CONVERSATION @ch MESSAGE TYPE @messagetype (@responsemessage) ;
							-- End the conversation on the target's side
							END CONVERSATION @ch ;
						END   
					END
				ELSE IF (@ContractName = 'mhb.cbs.ContractInType1')
					BEGIN
						SELECT @tempstr = REPLACE(CAST(@messagebody AS NVARCHAR(MAX)),'<LanguageRequest>','')
						SELECT @tempstr = REPLACE(@tempstr,'</LanguageRequest>','')
						IF (@tempstr = 'What is your language?')
						BEGIN
							-- Get language from customer data
							DECLARE @language nvarchar(50)
							SELECT @language = [Language] FROM [dbo].[ConsumerData] WHERE [Consumer] = @QueueConsumer
							-- Construct the response message
							SET @responsemessage = '<LanguageResponse>Response from ' + @QueueConsumer + ': Language is '
								+ @language
								+ '</LanguageResponse>' ;
							-- Send the response message back to the initiating service
							SEND ON CONVERSATION @ch MESSAGE TYPE @messagetype (@responsemessage) ;
							-- End the conversation on the target's side
							END CONVERSATION @ch ;
						END   
					END
				ELSE IF (@ContractName = 'mhb.cbs.ContractInType2')
					BEGIN
						SELECT @tempstr = REPLACE(CAST(@messagebody AS NVARCHAR(MAX)),'<CountryRequest>','')
						SELECT @tempstr = REPLACE(@tempstr,'</CountryRequest>','')
						IF (@tempstr = 'What is your country?')
						BEGIN
							-- Get language from customer data
							DECLARE @country nvarchar(50)
							SELECT @country = [Country] FROM [dbo].[ConsumerData] WHERE [Consumer] = @QueueConsumer
							-- Construct the response message
							SET @responsemessage = '<CountryResponse>Response from ' + @QueueConsumer + ': Country is '
								+ @country
								+ '</CountryResponse>' ;
							--Send the response message back to the initiating service
							SEND ON CONVERSATION @ch MESSAGE TYPE @messagetype (@responsemessage) ;
							-- End the conversation on the target's side
							END CONVERSATION @ch ;
						END   
					END
				ELSE IF (@ContractName = 'mhb.cbs.ContractInType3')
					BEGIN
						SELECT @tempstr = REPLACE(CAST(@messagebody AS NVARCHAR(MAX)),'<CapitalCityRequest>','')
						SELECT @tempstr = REPLACE(@tempstr,'</CapitalCityRequest>','')
						IF (@tempstr = 'What is your capital?')
						BEGIN
							-- Get capital from customer data
							DECLARE @capital nvarchar(50)
							SELECT @capital = [CapitalCity] FROM [dbo].[ConsumerData] WHERE [Consumer] = @QueueConsumer
							-- Construct the response message
							SET @responsemessage = '<CapitalCityResponse>Response from ' + @QueueConsumer + ': Capital city is '
								+ @capital
								+ '</CapitalCityResponse>' ;
							-- Send the response message back to the initiating service
							SEND ON CONVERSATION @ch MESSAGE TYPE @messagetype (@responsemessage) ;
							-- End the conversation on the target's side
							END CONVERSATION @ch ;
						END   
					END
				ELSE IF (@ContractName = 'mhb.cbs.ContractInType4')
					BEGIN
						SELECT @tempstr = REPLACE(CAST(@messagebody AS NVARCHAR(MAX)),'<FavouriteSportRequest>','')
						SELECT @tempstr = REPLACE(@tempstr,'</FavouriteSportRequest>','')
						IF (@tempstr = 'What is favourite sport?')
						BEGIN
							-- Get favourite sport from customer data
							DECLARE @sport nvarchar(50)
							SELECT @sport = [FavouriteSport] FROM [dbo].[ConsumerData] WHERE [Consumer] = @QueueConsumer
							-- Construct the response message
							SET @responsemessage = '<FavouriteSportRequest>Response from ' + @QueueConsumer + ': Favourite sport is '
								+ @sport
								+ '</FavouriteSportRequest>' ;
							-- Send the response message back to the initiating service
							SEND ON CONVERSATION @ch MESSAGE TYPE @messagetype (@responsemessage) ;
							-- End the conversation on the target's side
							END CONVERSATION @ch ;
						END   
					END
				
				COMMIT TRANSACTION
			END
		ELSE
			BEGIN
				ROLLBACK TRANSACTION
			END

		-- Get the next service.  
		FETCH NEXT FROM msgtypes_cursor   
		INTO @messagetype 
	END   
	CLOSE msgtypes_cursor;  
	DEALLOCATE msgtypes_cursor;  

END
GO


