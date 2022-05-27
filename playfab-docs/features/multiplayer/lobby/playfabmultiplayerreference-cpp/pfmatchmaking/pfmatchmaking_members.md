---
author: ScottMunroMS
title: "PFMultiplayer C/C++ API overview - PFMatchmaking.h"
description: "PFMultiplayer C/C++ API overview - PFMatchmaking.h"
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFMultiplayer C/C++ API overview - PFMatchmaking.h

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMatchmakingTicketCancel](functions/pfmatchmakingticketcancel.md) | Cancels the ticket. |  
| [PFMatchmakingTicketGetMatch](functions/pfmatchmakingticketgetmatch.md) | Provides the match, if one has been found. |  
| [PFMatchmakingTicketGetStatus](functions/pfmatchmakingticketgetstatus.md) | Provides the matchmaking ticket status. |  
| [PFMatchmakingTicketGetTicketId](functions/pfmatchmakingticketgetticketid.md) | Provides the ticket ID. |  
| [PFMultiplayerCreateMatchmakingTicket](functions/pfmultiplayercreatematchmakingticket.md) | Creates a matchmaking ticket for one or more local users. |  
| [PFMultiplayerDestroyMatchmakingTicket](functions/pfmultiplayerdestroymatchmakingticket.md) | Destroys the matchmaking ticket. |  
| [PFMultiplayerFinishProcessingMatchmakingStateChanges](functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md) | Returns an array of matchmaking state changes that were being processed. |  
| [PFMultiplayerJoinMatchmakingTicketFromId](functions/pfmultiplayerjoinmatchmakingticketfromid.md) | Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name. |  
| [PFMultiplayerStartProcessingMatchmakingStateChanges](functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md) | Retrieves an array of all matchmaking state changes to process since the last such call. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFMatchmakingMatchDetails](structs/pfmatchmakingmatchdetails.md) | The resulting match information found by a completed ticket. |  
| [PFMatchmakingMatchMember](structs/pfmatchmakingmatchmember.md) | A member of a match result. |  
| [PFMatchmakingTicketConfiguration](structs/pfmatchmakingticketconfiguration.md) | Defines the configuration for a matchmaking ticket. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
| [PFMatchmakingStateChange](structs/pfmatchmakingstatechange.md) | A generic, base structure representation of an event or change in state. |  
| [PFMatchmakingTicketCompletedStateChange](structs/pfmatchmakingticketcompletedstatechange.md) | Information specific to the *TicketCompleted* type of state change. |  
| [PFMatchmakingTicketStatusChangedStateChange](structs/pfmatchmakingticketstatuschangedstatechange.md) | Information specific to the *TicketStatusChanged* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFMatchmakingStateChangeType](enums/pfmatchmakingstatechangetype.md) | The types of state changes that can occur.|  
| [PFMatchmakingTicketStatus](enums/pfmatchmakingticketstatus.md) | The possible states for a matchmaking ticket.|  
