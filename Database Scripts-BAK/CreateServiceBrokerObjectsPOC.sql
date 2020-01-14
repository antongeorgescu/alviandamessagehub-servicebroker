-- Create message types

CREATE MESSAGE TYPE
[mhb.cbs.InRequestMessage]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.ResponseMessageType0]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.ResponseMessageType1]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.ResponseMessageType2]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.ResponseMessageType3]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.ResponseMessageType4]
VALIDATION = WELL_FORMED_XML
GO

-- Create Message Contracts
CREATE CONTRACT [mhb.cbs.ContractInType0]
(
[mhb.cbs.InRequestMessage] SENT BY INITIATOR,
[mhb.cbs.ResponseMessageType0] SENT BY TARGET
)
GO
CREATE CONTRACT [mhb.cbs.ContractInType1]
(
[mhb.cbs.InRequestMessage] SENT BY INITIATOR,
[mhb.cbs.ResponseMessageType1] SENT BY TARGET
)
GO
CREATE CONTRACT [mhb.cbs.ContractInType2]
(
[mhb.cbs.InRequestMessage] SENT BY INITIATOR,
[mhb.cbs.ResponseMessageType2] SENT BY TARGET
)
GO
CREATE CONTRACT [mhb.cbs.ContractInType3]
(
[mhb.cbs.InRequestMessage] SENT BY INITIATOR,
[mhb.cbs.ResponseMessageType3] SENT BY TARGET
)
GO
CREATE CONTRACT [mhb.cbs.ContractInType4]
(
[mhb.cbs.InRequestMessage] SENT BY INITIATOR,
[mhb.cbs.ResponseMessageType4] SENT BY TARGET
)
GO

-- create Publisher Queue
CREATE QUEUE QueuePublisher
WITH STATUS = ON
GO

-- Create Consumer Queues
CREATE QUEUE QueueConsumerA
WITH STATUS = ON
GO
CREATE QUEUE QueueConsumerB
WITH STATUS = ON
GO
CREATE QUEUE QueueConsumerC
WITH STATUS = ON
GO
CREATE QUEUE QueueConsumerD
WITH STATUS = ON
GO
CREATE QUEUE QueueConsumerE
WITH STATUS = ON
GO

-- create Services
-- Consumer A
CREATE SERVICE ServicePublisher
ON QUEUE QueuePublisher 
(
	[mhb.cbs.ContractInType0],
	[mhb.cbs.ContractInType1],
	[mhb.cbs.ContractInType2],
	[mhb.cbs.ContractInType3],
	[mhb.cbs.ContractInType4]
)
GO

-- Consumer A
CREATE SERVICE ServiceConsumerA0
ON QUEUE QueueConsumerA 
(
[mhb.cbs.ContractInType0]
)
GO
CREATE SERVICE ServiceConsumerA2
ON QUEUE QueueConsumerA 
(
[mhb.cbs.ContractInType2]
)
GO
CREATE SERVICE ServiceConsumerA3
ON QUEUE QueueConsumerA 
(
[mhb.cbs.ContractInType3]
)
GO
-- Consumer B
CREATE SERVICE ServiceConsumerB0
ON QUEUE QueueConsumerB 
(
[mhb.cbs.ContractInType0]
)
GO
CREATE SERVICE ServiceConsumerB1
ON QUEUE QueueConsumerB 
(
[mhb.cbs.ContractInType1]
)
GO
CREATE SERVICE ServiceConsumerB2
ON QUEUE QueueConsumerB 
(
[mhb.cbs.ContractInType2]
)
GO
CREATE SERVICE ServiceConsumerB3
ON QUEUE QueueConsumerB 
(
[mhb.cbs.ContractInType3]
)
GO
-- Consumer C
CREATE SERVICE ServiceConsumerC1
ON QUEUE QueueConsumerC 
(
[mhb.cbs.ContractInType1]
)
GO
CREATE SERVICE ServiceConsumerC3
ON QUEUE QueueConsumerC 
(
[mhb.cbs.ContractInType3]
)
GO
CREATE SERVICE ServiceConsumerC4
ON QUEUE QueueConsumerC 
(
[mhb.cbs.ContractInType4]
)
GO
-- Consumer D
CREATE SERVICE ServiceConsumerD1
ON QUEUE QueueConsumerD 
(
[mhb.cbs.ContractInType1]
)
GO
CREATE SERVICE ServiceConsumerD4
ON QUEUE QueueConsumerD 
(
[mhb.cbs.ContractInType4]
)
GO
-- Consumer E
CREATE SERVICE ServiceConsumerE0
ON QUEUE QueueConsumerE 
(
[mhb.cbs.ContractInType0]
)
GO
CREATE SERVICE ServiceConsumerE2
ON QUEUE QueueConsumerE 
(
[mhb.cbs.ContractInType2]
)
GO
CREATE SERVICE ServiceConsumerE4
ON QUEUE QueueConsumerE 
(
[mhb.cbs.ContractInType4]
)
GO

