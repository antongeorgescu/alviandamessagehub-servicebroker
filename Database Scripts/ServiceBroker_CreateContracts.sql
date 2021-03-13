USE [AlviandaMessageBroker]

CREATE CONTRACT [mhb.cbs.DateTimeContract]
(
[mhb.cbs.DateTimeRequestMessage] SENT BY INITIATOR,
[mhb.cbs.DateTimeResponseMessage] SENT BY TARGET
)
GO

/** following set of contracts is created by running the query below **/
/** SELECT DISTINCT 'CREATE CONTRACT ['+[Contract]+'] (['+InitiatorMessageType+'] SENT NY INITIATOR,['+TargetMessageType+'] SENT BY TARGET )'  FROM [AlviandaMessageBroker].[dbo].[BrokerContractMessageTypes] **/

CREATE CONTRACT [mhb.cbs.ContractInType1] ([mhb.cbs.InRequestMessage] SENT NY INITIATOR,[mhb.cbs.ResponseMessageType1] SENT BY TARGET )
CREATE CONTRACT [mhb.cbs.ContractInType2] ([mhb.cbs.InRequestMessage] SENT NY INITIATOR,[mhb.cbs.ResponseMessageType2] SENT BY TARGET )
CREATE CONTRACT [mhb.cbs.ContractInType3] ([mhb.cbs.InRequestMessage] SENT NY INITIATOR,[mhb.cbs.ResponseMessageType3] SENT BY TARGET )
CREATE CONTRACT [mhb.cbs.ContractInType4] ([mhb.cbs.InRequestMessage] SENT NY INITIATOR,[mhb.cbs.ResponseMessageType4] SENT BY TARGET )
CREATE CONTRACT [mhb.cbs.ContractInType5] ([mhb.cbs.InRequestMessage] SENT NY INITIATOR,[mhb.cbs.ResponseMessageType5] SENT BY TARGET )
GO
