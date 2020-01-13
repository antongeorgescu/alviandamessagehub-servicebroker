-- drop Services
-- Service Publisher
DROP SERVICE ServicePublisher
GO
-- Service Consumer A
DROP SERVICE ServiceConsumerA0
GO
DROP SERVICE ServiceConsumerA2
GO
DROP SERVICE ServiceConsumerA3
GO
-- Service Consumer B
DROP SERVICE ServiceConsumerB0
GO
DROP SERVICE ServiceConsumerB1
GO
DROP SERVICE ServiceConsumerB2
GO
DROP SERVICE ServiceConsumerB3
GO
-- Service Consumer C
DROP SERVICE ServiceConsumerC1
GO
DROP SERVICE ServiceConsumerC3
GO
DROP SERVICE ServiceConsumerC4
GO
-- Service Consumer D
DROP SERVICE ServiceConsumerD1
GO
DROP SERVICE ServiceConsumerD4
GO
-- Service Consumer E
DROP SERVICE ServiceConsumerE0
GO
DROP SERVICE ServiceConsumerE2
GO
DROP SERVICE ServiceConsumerE4
GO

-- drop Publisher Queue
DROP QUEUE QueuePublisher
GO

-- drop Consumer Queues
DROP QUEUE QueueConsumerA
GO
DROP QUEUE QueueConsumerB
GO
DROP QUEUE QueueConsumerC
GO
DROP QUEUE QueueConsumerD
GO
DROP QUEUE QueueConsumerE
GO

-- drop Contracts
DROP CONTRACT [mhb.cbs.ContractInType0]
GO
DROP CONTRACT [mhb.cbs.ContractInType1]
GO
DROP CONTRACT [mhb.cbs.ContractInType2]
GO
DROP CONTRACT [mhb.cbs.ContractInType3]
GO
DROP CONTRACT [mhb.cbs.ContractInType4]
GO

-- drop Message Types
DROP MESSAGE TYPE [mhb.cbs.InRequestMessage]
GO
DROP MESSAGE TYPE [mhb.cbs.ResponseMessageType0]
GO
DROP MESSAGE TYPE [mhb.cbs.ResponseMessageType1]
GO
DROP MESSAGE TYPE [mhb.cbs.ResponseMessageType2]
GO
DROP MESSAGE TYPE [mhb.cbs.ResponseMessageType3]
GO
DROP MESSAGE TYPE [mhb.cbs.ResponseMessageType4]
GO