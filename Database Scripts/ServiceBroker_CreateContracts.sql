USE [AlviandaMessageBroker]

CREATE CONTRACT [mhb.cbs.DateTimeContract]
(
[mhb.cbs.DateTimeRequestMessage] SENT BY INITIATOR,
[mhb.cbs.DateTimeResponseMessage] SENT BY TARGET
)
GO
