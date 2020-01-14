BEGIN TRANSACTION ;
DECLARE @ch UNIQUEIDENTIFIER
DECLARE @msg NVARCHAR(MAX) ;
DECLARE @contract sysname

SET @contract = N'mhb.cbs.DateTimeContract'
BEGIN DIALOG CONVERSATION @ch
      FROM SERVICE [DateTimeInitiatorService]
      TO SERVICE 'DateTimeTargetService'
      --ON CONTRACT [mhb.cbs.DateTimeContract]
	  ON CONTRACT @contract
      WITH ENCRYPTION = OFF ;
SET @msg = '<DateTimeRequest>What time is it?</DateTimeRequest>' ;
SEND ON CONVERSATION @ch 
   MESSAGE TYPE [mhb.cbs.DateTimeRequestMessage] 
   (@msg) ;
COMMIT TRANSACTION
GO