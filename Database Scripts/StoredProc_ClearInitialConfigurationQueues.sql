USE [AlviandaMessageBroker]
GO

/****** Object:  StoredProcedure [dbo].[ClearServiceBrokerQueries]    Script Date: 1/14/2020 11:20:57 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[ClearServiceBrokerQueries]
GO

/****** Object:  StoredProcedure [dbo].[ClearServiceBrokerQueries]    Script Date: 1/14/2020 11:20:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ===============================================================================
-- Author:		Anton Georgescu
-- Create date: January 14, 2020
-- Description:	Clear the initially create Service Broker Queues
-- ===============================================================================
CREATE PROCEDURE [dbo].[ClearServiceBrokerQueries]
AS
	-- ARRANGE
	SET NOCOUNT ON
	WHILE (0=0)
	BEGIN
		RECEIVE * FROM dbo.QueuePublisher;
		IF (@@ROWCOUNT = 0) BREAK;
	END
	WHILE (0=0)
	BEGIN
		RECEIVE * FROM dbo.QueueConsumerA;
		IF (@@ROWCOUNT = 0) BREAK;
	END
	WHILE (0=0)
	BEGIN
		RECEIVE * FROM dbo.QueueConsumerB;
		IF (@@ROWCOUNT = 0) BREAK;
	END
	WHILE (0=0)
	BEGIN
		RECEIVE * FROM dbo.QueueConsumerC;
		IF (@@ROWCOUNT = 0) BREAK;
	END
	WHILE (0=0)
	BEGIN
		RECEIVE * FROM dbo.QueueConsumerD;
		IF (@@ROWCOUNT = 0) BREAK;
	END
	WHILE (0=0)
	BEGIN
		RECEIVE * FROM dbo.QueueConsumerE;
		IF (@@ROWCOUNT = 0) BREAK;
	END

GO


