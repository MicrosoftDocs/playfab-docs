---
author: jdeweyMSFT
title: "PartyEndpointUserTypeFilter"
description: "Categories of users associated with endpoints that can be used to filter the results returned by PartyNetwork::GetEndpointsByUserType()."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyEndpointUserTypeFilter  

Categories of users associated with endpoints that can be used to filter the results returned by PartyNetwork::GetEndpointsByUserType().    

## Syntax  
  
```cpp
enum class PartyEndpointUserTypeFilter    
{  
    NoUserFilter = 0,  
    Players = 1,  
    Servers = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoUserFilter | Retrieve all endpoints, regardless of associated user. |  
| Players | Retrieve only endpoints created by "title_player_account" entity type users.<br/><br/> Endpoints created by users of other entity types and endpoints with no associated user are not included in the retrieved array. |  
| Servers | Retrieve only endpoints created by "game_server" entity type users.<br/><br/> Endpoints created by users of other entity types and endpoints with no associated user are not included in the retrieved array. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::GetEndpointsByUserType](../classes/PartyNetwork/methods/partynetwork_getendpointsbyusertype.md)
  
  
