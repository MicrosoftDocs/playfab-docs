---
title: PubSub client API
author: MarcoWilliamsPF
description: Describes the technical design of the PubSub API.
ms.author: mawillia
ms.date: 12/21/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, pubsub, API
ms.localizationpriority: medium
---

# PubSub client API

Thi topic explains the technical design behind the Persistent Sockets API in a PlayFab client. Below you will find any dependencies, flow design, and explanation of each API signature required to make a clean Persistent Socket API that can talk to the PlayFab relay service, receive events and subscribe handlers to those events.

## Dependencies

- SignalR - The underlying technology in which messages are sent to the game client (aka: Relay Server).
- (A JSON Serializer) – `PluginManager<ISerializePlugin>` - Any serialization or de-serialization uses the PlayFab SDK's serialization.

## Design

The API was designed for easy integration. A game client can open a socket (`connect`) and subscribe to topic events (generally PlayStream messages, but not always). Once subscribed to events, messages are sent from the Relay service and are received by the client via the `OnMessageReceived` handler.  This handler is and will remain internal and private to the API. The `OnMessageReceived` handler processes the message. This process is known as the Message Event Dispatcher. It is responsible for looking at the `RegisteredHandlers`, taking the message topic and de-serializing the message into the type registered. Types are an extension of `PlayFabMessageBase` (which we will talk about later) and can have their own de-serialization strategy. Once the message has been successfully de-serialized, the registered handler is invoked thereby dispatching the event to all listed handlers.

<!--
 !["Persistent Sockets API Diagram"](images/diagram.png "Persistent Sockets API Diagram")

In the diagram below you will observe a flow in which a game client can open a socket connection ( **connect** ) and subscribe to topic events (generally PlayStream messages, but not always).  Once subscribed to events, messages are sent from the Relay service and are received by the client via the **OnMessageReceived** handler.  This handler is and will remain internal and private to the API.   The OnMessageReceived handler processes the message.  This process is known as the Message Event Dispatcher.  It is responsible for looking at the RegisteredHandlers, taking the message topic and deserializing the message into the type registered.  Types are an extension of **PlayFabMessageBase** which (we will talk about later) and can have their own deserialization strategy.  Once the message has been successfully deserialized, the Handler registered is invoked therefore dispatching the event to all listed handlers.
-->

## The API methods

- `Initialize(bool autoconnect=false)` – This method of the API initializes the Sockets API and instantiates any Unity specific objects into the scene that need to persist. It also setups the `PlayFabSocketsAPI` as a singleton object that can be referenced from anywhere in game code.   Optionally, we could have an "autoconnect" parameter Boolean that will also auto `Connect` to the relay service upon successful initialization.
- `Connect()`  - This method connects to the relay service and stores a reference to the connection. Optionally you can register your `OnConnect`, `OnDisconnect`, and `OnConnectionError` handlers when calling this function. This could be implemented as a method overload.
- `IsConnected()` - This returns **true** if we are currently connected to the relay hub.
- `Subscribe(topic, callback, error)` - This method sends a message to the relay service to inform it that this client has registered to receive notifications for the specified topic.
- `Subscribe(topics, callback, error)` - This method sends a message to the relay service to inform it that this client has registered to receive notifications for the specified topics (one or more topics).  
- `UnSubscribe(topic, callback, error)` – This method sends a message to the relay service to inform it that this client should no longer receive notifications for the specified topic.
- `UnSubscribe(topics, callback, error)` – This method sends a message to the relay service to inform it that this client should no longer receive notifications for the specified topics (one or more).
- `RegisterHandler(topic, Action<PlayFabNetworkMessage> handler)` - This methods allows the developer to register a handler to a topic from anywhere in their code. Each topic can have multiple handlers invoked, allowing the developer to register to the topic and receive messages in one or more views. By inheriting type `PlayFabNetworkMessage`, the event processor will attempt to de-serialize the message to the type specified. Types should extend `MessageBase` (see below).
- `UnRegisterHandler(topic, Action<PlayFabNetworkMessage> handler)` - This method allows the developer to de-register a handler and no longer receive invocations in the view.
- `Disconnect()` – This method will close the connection and trigger the `OnDisconnect` event.


## The API events

- `OnConnect` – This event fires when a connection has been successfully made to the relay service. You can subscribe to this event to be informed of a successful connection.
- `OnDisconnect` – This event fires when you are disconnected from the relay service. It is fired/triggered only when the `close()` method has been invoked.
- `OnConnectionError(PlayFabError)` – This event fires when a disconnection happens due to some sort of error. The reason model should provide some information as to why the disconnect from the relay service occurred if that information is available. If that information is not available, the reason is listed as unknown.
- `OnRetryConnection()` - In the case where a connection is lost, this event will fire during the re-connection attempt.
- `OnTopicResubscriptionFailedEvent(Topic)` - If a connection is lost, and a re-connection has been established, this API will auto resubscribe to topics you were previously subscribed to. This event is fired if any of those attempts to resubscribe fails.

## PlayFabNetworkMessage

The message base class is a base class in which a developer can form message models off of. Message models are messages that a client can expect to receive via the PlayFab relay service. Message models might have some properties that are common across all messages, and also provide a way to handle the message (serialization and de-serialization).

`PlayFabMessageBase` should observe the following:

- `PublisherEntity` - This is the entity that published the event.
- `OriginalId` - The message Identity.
- `OriginalTimestamp` - The original timestamp of the message.
- `PayloadJSON` -  The actual JSON payload of the message.
- `ReadMessage<T>()` - This returns a deserialized typed object for this message

<!--
- Virtual OnDeserialize&lt;T&gt;(string message) – this is an override-able deserializer that by default will use playfab plugin serializer to attempt to deserialize the message into the type specified
- Virtual OnSerialize &lt;T&gt;(string message) – this is an override-able serializer that by default will use playfab plugin serializer to attempt to serialize the message from the type specified to a JSON string
- OnSerializationError - This is an event in which the serialization fails, allowing the developer full control on how to solve the problem.
</-->

## Retry Logic

Any persistent socket connection requires some sort of error handling. Connections are lost for various reasons and it is PlayFab's responsibility to attempt to maintain the connection for as long as possible. The PlayFab API has retry logic in place which will attempt to regain connection to the relay service should a connection error occur.

**Exponential back off** - When a connection failure happens, the API does the following:

- First Failure - Immediately try to reconnect once.
- Second Failure – Try to reconnect in 15 seconds.
- Third Failure – Try to reconnect in 30 seconds
- Fourth Failure – Try to reconnect in 1 minute.
- Fifth Failure – Try to reconnect in 5 minutes.
- Sixth Failure – Try to reconnect in 15 minutes.

Trying to reconnect post 15 minutes is unlikely to regain connection. Each attempt will notify the developer via an event that they can subscribe to. In addition, `OnConnectionError` is also fired.

<!--
**Focus On &amp; Focus Off -** It is possible for a game or app to go to sleep in the background.  This is a huge problem for persistent connections.  The following should happen should a focus on / off event happen.

- Focus On - If a focus off occurred and we now have a new focus on event, we should check that the connection is still open and valid.  If not we should initiate retry logic.
- Focus Off – Open Question – Should we close the connection and then reopen on focus on?
-->