USE [LoanStarMessageBusBroker]
GO

DROP SERVICE [DateTimeInitiatorService]
GO

DROP SERVICE [DateTimeTargetService]
GO

DROP QUEUE [dbo].[DateTimeInitiatorQueue]
GO

DROP QUEUE [dbo].[DateTimeTargetQueue]
GO

DROP CONTRACT [mhb.cbs.DateTimeContract]
GO

DROP MESSAGE TYPE [mhb.cbs.DateTimeResponsetMessage]
GO

DROP MESSAGE TYPE [mhb.cbs.DateTimeRequestMessage]
GO