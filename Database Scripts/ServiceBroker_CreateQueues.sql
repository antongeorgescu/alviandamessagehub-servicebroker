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

/** Following set of queues is extracted by running the query below: **
/** SELECT DISTINCT 'CREATE QUEUE ' + QueueConsumer + ' WITH STATUS = ON' FROM [AlviandaMessageBroker].[dbo].[BrokerServicesMatrix] **/

CREATE QUEUE dbo.QueueConsumerA WITH STATUS = ON
CREATE QUEUE dbo.QueueConsumerB WITH STATUS = ON
CREATE QUEUE dbo.QueueConsumerC WITH STATUS = ON
CREATE QUEUE dbo.QueueConsumerD WITH STATUS = ON
CREATE QUEUE dbo.QueueConsumerE WITH STATUS = ON
GO
