---
author: ScottMunroMS
title: "PFMultiplayer C/C++ API overview - PFMatchmaking.h"
description: "PFMultiplayer C/C++ API overview - PFMatchmaking.h"
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/15/2023
---

# PFMultiplayer C/C++ API overview - PFMatchmaking.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMatchmakingTicketCancel](functions/pfmatchmakingticketcancel.md) | Cancels the ticket. |  
| [PFMatchmakingTicketGetCustomContext](functions/pfmatchmakingticketgetcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this ticket object. |  
| [PFMatchmakingTicketGetMatch](functions/pfmatchmakingticketgetmatch.md) | Provides the match, if one has been found. |  
| [PFMatchmakingTicketGetStatus](functions/pfmatchmakingticketgetstatus.md) | Provides the matchmaking ticket status. |  
| [PFMatchmakingTicketGetTicketId](functions/pfmatchmakingticketgetticketid.md) | Provides the ticket ID. |  
| [PFMatchmakingTicketSetCustomContext](functions/pfmatchmakingticketsetcustomcontext.md) | Configures an optional, custom pointer-sized context value with this ticket object. |  
| [PFMultiplayerCreateMatchmakingTicket](functions/pfmultiplayercreatematchmakingticket.md) | Creates a matchmaking ticket for one or more local users. |  
| [PFMultiplayerCreateServerBackfillTicket](functions/pfmultiplayercreateserverbackfillticket.md) | Creates a server backfill ticket. |  
| [PFMultiplayerDestroyMatchmakingTicket](functions/pfmultiplayerdestroymatchmakingticket.md) | Destroys the matchmaking ticket. |  
| [PFMultiplayerFinishProcessingMatchmakingStateChanges](functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md) | Returns an array of matchmaking state changes that were being processed. |  
| [PFMultiplayerJoinMatchmakingTicketFromId](functions/pfmultiplayerjoinmatchmakingticketfromid.md) | Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name. |  
| [PFMultiplayerStartProcessingMatchmakingStateChanges](functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md) | Retrieves an array of all matchmaking state changes to process since the last such call. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFMatchmakingMatchDetails](structs/pfmatchmakingmatchdetails.md) | The resulting match information found by a completed ticket. |  
| [PFMatchmakingMatchMember](structs/pfmatchmakingmatchmember.md) | A member of a match result. |  
| [PFMatchmakingServerBackfillTicketConfiguration](structs/pfmatchmakingserverbackfillticketconfiguration.md) | Defines the configuration for a server backfill ticket. |  
| [PFMatchmakingTicketConfiguration](structs/pfmatchmakingticketconfiguration.md) | Defines the configuration for a matchmaking ticket. |  
| [PFMultiplayerPort](structs/pfmultiplayerport.md) | A port used by a Playfab Multiplayer Server. |  
| [PFMultiplayerServerDetails](structs/pfmultiplayerserverdetails.md) | Details about a Playfab Multiplayer Server. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
| [PFMatchmakingStateChange](structs/pfmatchmakingstatechange.md) | A generic, base structure representation of an event or change in state in the Matchmaking library. |  
| [PFMatchmakingTicketCompletedStateChange](structs/pfmatchmakingticketcompletedstatechange.md) | Information specific to the *TicketCompleted* type of state change. |  
| [PFMatchmakingTicketStatusChangedStateChange](structs/pfmatchmakingticketstatuschangedstatechange.md) | Information specific to the *TicketStatusChanged* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFMatchmakingStateChangeType](enums/pfmatchmakingstatechangetype.md) | The types of state changes that can occur in the Matchmaking library.|  
| [PFMatchmakingTicketStatus](enums/pfmatchmakingticketstatus.md) | The possible states for a matchmaking ticket.|  
| [PFMultiplayerProtocolType](enums/pfmultiplayerprotocoltype.md) | The protocol type used for connecting to a PlayFab Multiplayer Server port.|  
