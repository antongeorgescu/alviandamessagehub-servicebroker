SELECT [dbo].[BrokerVwAllTopics].[Contract],[dbo].[BrokerVwAllTopics].[Topic],
CASE 
	WHEN EXISTS (SELECT DISTINCT sm.[Contract] as "Contract",mt.[Topic] as "Topic"
		FROM [dbo].[BrokerServicesMatrix] sm 
		RIGHT OUTER JOIN 
		[dbo].[BrokerContractMessageTypes] mt 
		ON sm.[Contract] = mt.[Contract] 
		WHERE sm.[QueueConsumer] = 'dbo.QueueConsumerA' AND sm.[Contract] = [dbo].[BrokerVwAllTopics].[Contract]) THEN 1
	ELSE 0
END as "Selected"   
FROM [dbo].[BrokerVwAllTopics]
