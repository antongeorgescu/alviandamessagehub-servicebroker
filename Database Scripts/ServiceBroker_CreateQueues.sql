USE [AlviandaMessageBroker]

CREATE QUEUE QueuePublisher
WITH STATUS = ON
GO
CREATE QUEUE DateTimeInitiatorQueue
WITH STATUS = ON
GO
CREATE QUEUE DateTimeTargetQueue
WITH STATUS = ON
GO
