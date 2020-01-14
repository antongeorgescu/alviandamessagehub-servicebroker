BEGIN TRANSACTION ;
DECLARE @ch UNIQUEIDENTIFIER
DECLARE @msg NVARCHAR(MAX) ;
BEGIN DIALOG CONVERSATION @ch
      FROM SERVICE [DateTimeInitiatorService]
      TO SERVICE 'DateTimeTargetService'
      ON CONTRACT [mhb.cbs.DateTimeContract]
      WITH ENCRYPTION = OFF ;
SET @msg = '<DateTimeRequest>What time is it?</DateTimeRequest>' ;
SEND ON CONVERSATION @ch 
   MESSAGE TYPE [mhb.cbs.DateTimeRequestMessage] 
   (@msg) ;
COMMIT TRANSACTION
GO