# Alvianda Message Hub
Example of a multi-topic/multi-consumer message hub implementation using Sql Server ServiceBroker 

A few advantages of this solution:
* It introduces a real separation of concerns by creating combination of message types and queues per consumer. This improvement comes as an out-of-box set of Service Broker features, without the need to write a single line of code 
* It implements a “message dispatcher” pattern with two levels of message processing: incoming and consuming 
* It addresses the “message transaction issues” due to the generic message type we currently use, that our developers have tried to fixed constantly. The proposed solution ensures the processing of the message by the rest of N-1 consumers, when 1 consumer is unable to process 
* It allows message processing with multiple “publishing queues” that might run under different priority levels 
* It allows the introduction of “activator procedures” that wake up as soon as messages land on the consumer queues. These activators can run .NET CLR stored procedures that wrap the Worker consumer instances 
* It allows parallel processing by letting us define the number of simultaneous queue readers. Each reader can process the messages of a particular conversation group. To ensure messages of a particular conversation group are being processed by a single reader it uses a new kind of lock, called conversation group lock. 
* The message order is guaranteed by Service Broker within a conversation group. So to preserve the order of correlated messages in processing, we need to send them on the same conversation. 
* The # activators (a.k.a. queue readers) can be predetermined, and by doing so we can have either 1) efficient parallel processing or 2) sequential processing, whenever the specific functional scenarios require 
* It introduces a Message-Configuration database that allows easy publisher/subscriber management through configuration.  
* A configuration and monitoring application can connect to both Publishing queues and Message-Configuration database to allow easy and efficient monitoring (including the processing of poison messages) 

![](https://github.com/antongeorgescu/alviandamessagehub-servicebroker/blob/master/Documentation/Message_Broker_Components.png)
