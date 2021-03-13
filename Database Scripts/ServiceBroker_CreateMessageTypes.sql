USE [AlviandaMessageBroker]

CREATE MESSAGE TYPE
[mhb.cbs.InRequestMessage]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.DateTimeRequestMessage]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.DateTimeResponseMessage]
VALIDATION = WELL_FORMED_XML
GO

/** following set of messages is created by running the query below **/
/ **/** SELECT DISTINCT 'CREATE MESSAGE TYPE [' + TargetMessageType + '] VALIDATION = WELL_FORMED_XML' FROM [AlviandaMessageBroker].[dbo].[BrokerContractMessageTypes] **/

CREATE MESSAGE TYPE [mhb.cbs.ResponseMessageType1] VALIDATION = WELL_FORMED_XML
CREATE MESSAGE TYPE [mhb.cbs.ResponseMessageType2] VALIDATION = WELL_FORMED_XML
CREATE MESSAGE TYPE [mhb.cbs.ResponseMessageType3] VALIDATION = WELL_FORMED_XML
CREATE MESSAGE TYPE [mhb.cbs.ResponseMessageType4] VALIDATION = WELL_FORMED_XML
CREATE MESSAGE TYPE [mhb.cbs.ResponseMessageType5] VALIDATION = WELL_FORMED_XML
GO
