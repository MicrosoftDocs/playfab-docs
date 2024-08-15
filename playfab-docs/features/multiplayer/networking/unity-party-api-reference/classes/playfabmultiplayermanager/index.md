---
author: vicodex
title: Class PlayFabMultiplayerManager
description: PlayFabMultiplayerManager members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# Class PlayFabMultiplayerManager

## Properties

| Name | Description |
| --- | --- |
| [LocalPlayer](properties/playfabunitylocalplayer.md) | Gets the local player for this client. |
| [LogLevel](properties/playfabunityloglevel.md) | Gets and sets the amount of logging currently enabled. |
| [NetworkId](properties/playfabunitynetworkid.md) | Returns NetworkID of the current network to which the player is connected. The other players can use this string to join the network. |
| [RemotePlayers](properties/playfabunityremoteplayers.md) | Gets the collection of remote players currently joined to the network. |
| [SpeechToTextMode](properties/playfabunityspeechtotextmode.md) | Gets or sets whether speech-to-text is enabled. |
| [State](properties/playfabunitystate.md) | Gets the current state of the multiplayer manager. |
| [TextToSpeechMode](properties/playfabunitytexttospeechmode.md) | Gets or sets whether text-to-speech is enabled. |
| [TranslateChat](properties/playfabunitytranslatechat.md) | Gets or sets whether incoming chat messages should be translated to local player's language. |

## Methods

| Name | Description |
| --- | --- |
| [SendChatMessage](methods/partyunitysendchatmessage.md) | Sends a chat message to a specific list of players (recipients). |
| [SendChatMessageToAllPlayers](methods/partyunitysendchatmessagetoallplayers.md) | Broadcasts a text message to all players. This API sends a message such that it is guaranteed to arrive and in sequential order. |
| [CreateAndJoinNetwork](methods/playfabunitycreateandjoinnetwork.md) | Creates a network for players to join. After the player joins the network, they can send the other players that are on the network chat and data messages. |
| [Get](methods/playfabunityget.md) | Returns a reference to the PlayFabMultiplayerManager singleton instance. |
| [JoinNetwork](methods/playfabunityjoinnetwork.md) | Joins this player to the specified network. |
| [LeaveNetwork](methods/playfabunityleavenetwork.md) | Causes the local player to leave the network. |
| [ResetParty](methods/playfabunityresetparty.md) | Leaves Network, cleans up and re-initializes all resources related to Party and the corresponding PlayFabMultiplayerManager object. If the object was connected to a network, attempts to reconnect to the same network. |
| [Resume](methods/playfabunityresume.md) | When the app is resumed, re-initializes Party and all resources of PlayFabMultiplayerManager object. |
| [SendDataMessage](methods/playfabunitysenddatamessage.md) |Sends a data message to the specified players using the specified delivery options. The most advanced method for sending data messages, allowing the developer more control over how the message is sent. |
| [SendDataMessageToAllPlayers](methods/playfabunitysenddatamessagetoallplayers.md) | Broadcasts a data message to all players. |
| [Suspend](methods/playfabunitysuspend.md) | During app suspension, suspends execution of Party and immediately reclaims all resources associated with the PlayFabMultiplayerManager object. |
| [UpdateEntityToken](methods/playfabunityupdateentitytoken.md) | Updates the Entity token for the current local user. |

## Events

| Name | Description |
| --- | --- |
| [OnChatMessageReceived](events/partyunityonchatmessagereceived.md) | Occurs when a chat message is received. |
| [OnDataMessageReceived](events/partyunityondatamessagereceived.md) | Occurs when a data message is received. |
| [OnDataMessageNoCopyReceived](events/partyunityondatamessagenocopyreceived.md) | Occurs when a data message is received. |
| [OnErrorEventHandler](events/partyunityonerroreventhandler.md) | Occurs when there is an error. |
| [OnNetworkChanged](events/partyunityonnetworkchanged.md) | Occurs when the Network changes. When this event fires you must move all the players to the new network, specified in the newNetworkID so the players can continue to communicate. |
| [OnNetworkJoined](events/partyunityonnetworkjoined.md) | Occurs when the local player joins the network. |
| [OnNetworkLeft](events/partyunityonnetworkleft.md) | Occurs when the local player leaves the network. |
| [OnRemotePlayerJoined](events/partyunityonremoteplayerjoined.md) | Occurs when a remote player joins the network. |
| [OnRemotePlayerLeft](events/partyunityonremoteplayerleft.md) | Occurs when a remote player leaves the network. |
