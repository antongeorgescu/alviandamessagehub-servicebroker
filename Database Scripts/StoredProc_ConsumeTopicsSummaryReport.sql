USE [AlviandaMessageBroker]
GO

/****** Object:  StoredProcedure [dbo].[ConsumeTopicsSummaryReport]    Script Date: 1/14/2020 11:19:03 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[ConsumeTopicsSummaryReport]
GO

/****** Object:  StoredProcedure [dbo].[ConsumeTopicsSummaryReport]    Script Date: 1/14/2020 11:19:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ===============================================================================
-- Author:		Anton Georgescu
-- Create date: January 14, 2020
-- Description:	Provide message processing summary report for specified consumer
-- ===============================================================================

CREATE PROCEDURE [dbo].[ConsumeTopicsSummaryReport]
	@consumer NVARCHAR(50)
AS
	select  message_type_name as "MessageType",
		mt.Topic as "Topic",
		CAST(qp.message_body AS XML) AS "ResponseMessage" 
		from dbo.QueuePublisher qp
		inner join dbo.BrokerContractMessageTypes mt on qp.message_type_name = mt.TargetMessageType COLLATE SQL_Latin1_General_CP1_CI_AS
		where qp.validation = 'X' 
		and CHARINDEX(@consumer,CAST(qp.message_body AS nvarchar(500)))>0
RETURN 0
GO


