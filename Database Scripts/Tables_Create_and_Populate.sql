USE [AlviandaMessageBroker]
GO

/****** Object:  Table [dbo].[BrokerConsumers]    Script Date: 1/14/2020 11:24:48 AM ******/
DROP TABLE [dbo].[BrokerConsumers]
GO

/****** Object:  Table [dbo].[BrokerConsumers]    Script Date: 1/14/2020 11:24:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BrokerConsumers](
	[QueueConsumer] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[WorkerName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[QueueConsumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

INSERT INTO [dbo].[BrokerConsumers]
	([QueueConsumer],[Name],[WorkerName],[Description])
	VALUES ('dbo.QueueConsumerA','Application Consumer A','[Stored Proc] dbo.ConsumeMessage','Description of Application Consumer A')
INSERT INTO [dbo].[BrokerConsumers]
	([QueueConsumer],[Name],[WorkerName],[Description])
	VALUES ('dbo.QueueConsumerB','Application Consumer B','[Stored Proc] dbo.ConsumeMessage','Description of Application Consumer B')
INSERT INTO [dbo].[BrokerConsumers]
	([QueueConsumer],[Name],[WorkerName],[Description])
	VALUES ('dbo.QueueConsumerC','Application Consumer C','[Stored Proc] dbo.ConsumeMessage','Description of Application Consumer C')
INSERT INTO [dbo].[BrokerConsumers]
	([QueueConsumer],[Name],[WorkerName],[Description])
	VALUES ('dbo.QueueConsumerD','Application Consumer D','[Stored Proc] dbo.ConsumeMessage','Description of Application Consumer D')
INSERT INTO [dbo].[BrokerConsumers]
	([QueueConsumer],[Name],[WorkerName],[Description])
	VALUES ('dbo.QueueConsumerE','Application Consumer E','[Stored Proc] dbo.ConsumeMessage','Description of Application Consumer E')


/****** Object:  Table [dbo].[BrokerContractMessageTypes]    Script Date: 1/14/2020 11:25:52 AM ******/
DROP TABLE [dbo].[BrokerContractMessageTypes]
GO

/****** Object:  Table [dbo].[BrokerContractMessageTypes]    Script Date: 1/14/2020 11:25:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BrokerContractMessageTypes](
	[Contract] [nvarchar](50) NOT NULL,
	[InitiatorMessageType] [nvarchar](50) NOT NULL,
	[TargetMessageType] [nvarchar](50) NOT NULL,
	[Topic] [nvarchar](150) NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[BrokerContractMessageTypes]
	([Contract],[InitiatorMessageType],[TargetMessageType],[Topic])
	VALUES ('mhb.cbs.ContractInType1','mhb.cbs.InRequestMessage','mhb.cbs.ResponseMessageType1','<LanguageRequest>What is your language?</LanguageRequest>')
INSERT INTO [dbo].[BrokerContractMessageTypes]
	([Contract],[InitiatorMessageType],[TargetMessageType],[Topic])
	VALUES ('mhb.cbs.ContractInType2','mhb.cbs.InRequestMessage','mhb.cbs.ResponseMessageType2','<CountryRequest>What is your country?</CountryRequest>')
INSERT INTO [dbo].[BrokerContractMessageTypes]
	([Contract],[InitiatorMessageType],[TargetMessageType],[Topic])
	VALUES ('mhb.cbs.ContractInType3','mhb.cbs.InRequestMessage','mhb.cbs.ResponseMessageType3','<CapitalCityRequest>What is your capital?</CapitalCityRequest>')
INSERT INTO [dbo].[BrokerContractMessageTypes]
	([Contract],[InitiatorMessageType],[TargetMessageType],[Topic])
	VALUES ('mhb.cbs.ContractInType4','mhb.cbs.InRequestMessage','mhb.cbs.ResponseMessageType4','<FavouriteSportRequest>What is favourite sport?</FavouriteSportRequest>')
INSERT INTO [dbo].[BrokerContractMessageTypes]
	([Contract],[InitiatorMessageType],[TargetMessageType],[Topic])
	VALUES ('mhb.cbs.ContractInType5','mhb.cbs.InRequestMessage','mhb.cbs.ResponseMessageType5','<DateTimeRequest>What time is it?</DateTimeRequest>')

/****** Object:  Table [dbo].[BrokerServicesMatrix]    Script Date: 1/14/2020 11:27:00 AM ******/
DROP TABLE [dbo].[BrokerServicesMatrix]
GO

/****** Object:  Table [dbo].[BrokerServicesMatrix]    Script Date: 1/14/2020 11:27:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BrokerServicesMatrix](
	[Contract] [nvarchar](50) NOT NULL,
	[QueueConsumer] [nvarchar](50) NOT NULL,
	[ServiceConsumer] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType0','dbo.QueueConsumerA','ServiceConsumerA0')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType2','dbo.QueueConsumerA','ServiceConsumerA2')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType3','dbo.QueueConsumerA','ServiceConsumerA3')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType0','dbo.QueueConsumerB','ServiceConsumerB0')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType1','dbo.QueueConsumerB','ServiceConsumerB1')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType2','dbo.QueueConsumerB','ServiceConsumerB2')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType3','dbo.QueueConsumerB','ServiceConsumerB3')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType1','dbo.QueueConsumerC','ServiceConsumerC1')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType3','dbo.QueueConsumerC','ServiceConsumerC3')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType4','dbo.QueueConsumerC','ServiceConsumerC4')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType1','dbo.QueueConsumerD','ServiceConsumerD1')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType4','dbo.QueueConsumerD','ServiceConsumerD4')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType0','dbo.QueueConsumerE','ServiceConsumerE0')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType2','dbo.QueueConsumerE','ServiceConsumerE2')
INSERT INTO [dbo].[BrokerServicesMatrix] ([Contract],[QueueConsumer],[ServiceConsumer]) VALUES ('mhb.cbs.ContractInType4','dbo.QueueConsumerE','ServiceConsumerE4')

/****** Object:  Table [dbo].[ConsumerData]    Script Date: 1/14/2020 11:27:25 AM ******/
DROP TABLE [dbo].[ConsumerData]
GO

/****** Object:  Table [dbo].[ConsumerData]    Script Date: 1/14/2020 11:27:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConsumerData](
	[Consumer] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Timeoffset] [smallint] NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
	[FavouriteSport] [nvarchar](50) NOT NULL,
	[CapitalCity] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[ConsumerData] ([Consumer],[Country],[Timeoffset],[Language],[FavouriteSport],[CapitalCity]) VALUES ('dbo.QueueConsumerA','USA',1,'English','Football','Washington')
INSERT INTO [dbo].[ConsumerData] ([Consumer],[Country],[Timeoffset],[Language],[FavouriteSport],[CapitalCity]) VALUES ('dbo.QueueConsumerB','France',6,'French','Soccer','Paris')
INSERT INTO [dbo].[ConsumerData] ([Consumer],[Country],[Timeoffset],[Language],[FavouriteSport],[CapitalCity]) VALUES ('dbo.QueueConsumerC','Romania',7,'Romanian','Handball','Bucharest')
INSERT INTO [dbo].[ConsumerData] ([Consumer],[Country],[Timeoffset],[Language],[FavouriteSport],[CapitalCity]) VALUES ('dbo.QueueConsumerD','Russia',10,'Russian','Swimming','Moscow')
INSERT INTO [dbo].[ConsumerData] ([Consumer],[Country],[Timeoffset],[Language],[FavouriteSport],[CapitalCity]) VALUES ('dbo.QueueConsumerE','Pakistan',14,'Farsi','Polo','Karachi')


