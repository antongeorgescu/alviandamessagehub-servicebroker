USE [AlviandaMessageBroker]

CREATE SERVICE DateTimeInitiatorService
ON QUEUE DateTimeInitiatorQueue 
(
[mhb.cbs.DateTimeContract]
)
GO
CREATE SERVICE DateTimeTargetService
ON QUEUE DateTimeTargetQueue
(
[mhb.cbs.DateTimeContract]
)
GO
