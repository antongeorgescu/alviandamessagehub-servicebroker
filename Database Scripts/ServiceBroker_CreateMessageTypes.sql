USE [AlviandaMessageBroker]

CREATE MESSAGE TYPE
[mhb.cbs.DateTimeRequestMessage]
VALIDATION = WELL_FORMED_XML
GO
CREATE MESSAGE TYPE
[mhb.cbs.DateTimeResponseMessage]
VALIDATION = WELL_FORMED_XML
GO
