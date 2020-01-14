DECLARE @ch UNIQUEIDENTIFIER
DECLARE @messagetypename NVARCHAR(256)
DECLARE @messagebody XML
DECLARE @responsemessage XML
DECLARE @messagebodystr NVARCHAR(MAX)

BEGIN TRANSACTION ;

RECEIVE TOP(1)
@ch = conversation_handle,
@messagetypename = message_type_name,
@messagebody = CAST(message_body AS XML)
FROM DateTimeTargetQueue
PRINT 'Conversation handle: ' + CAST(@ch AS NVARCHAR(MAX))
PRINT 'Message type: ' + @messagetypename
PRINT 'Message body: ' + CAST(@messagebody AS NVARCHAR(MAX))

IF ( @messagetypename = 'mhb.cbs.DateTimeRequestMessage' ) 
    BEGIN
		DECLARE @tempstr NVARCHAR(MAX)
		SELECT @tempstr = REPLACE(CAST(@messagebody AS NVARCHAR(MAX)),'<DateTimeRequest>','')
		SELECT @tempstr = REPLACE(@tempstr,'</DateTimeRequest>','')
		IF (@tempstr = 'What time is it?')
			BEGIN
				-- Construct the response message
				SET @responsemessage = '<DateTimeResponse>Current time is:'
					+ CAST(CURRENT_TIMESTAMP AS nvarchar(256)) 
					+ '</DateTimeResponse>' ;
				-- Send the response message back to the initiating service
				SEND ON CONVERSATION @ch MESSAGE TYPE [mhb.cbs.DateTimeResponseMessage] (@responsemessage) ;
				-- End the conversation on the target's side
				END CONVERSATION @ch ;
			END   
	END  
COMMIT TRANSACTION
GO