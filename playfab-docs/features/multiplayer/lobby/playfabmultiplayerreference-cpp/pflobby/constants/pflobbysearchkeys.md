---
author: fschober-atg
title: "PFLobby Search Keys"
description: "Values representing pre-defined search keys."
ms.author: fschober
ms.topic: reference
ms.prod: playfab
ms.date: 09/01/2022
---

# PFLobby Search Keys

Values representing the lobby's pre-defined search keys.

## Syntax
  
```cpp
constexpr char PFLobbyMemberCountSearchKey[] = "lobby/memberCount";
constexpr char PFLobbyAmMemberSearchKey[] = "lobby/amMember";
```
  
## Constants
  
| Constant | Description | Example |
| --- | --- | --- |
| PFLobbyMemberCountSearchKey | A special, pre-defined search key which can be used in the [PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md) filtering and sorting strings to search for lobbies based on the current number of members in the lobby. | "lobby/memberCount lt 5" |
| PFLobbyAmMemberSearchKey | A special, pre-defined search key which can be used in the [PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md) filtering string to search for lobbies that you are currently a member of. | "lobby/amMember eq true" |
  
## Requirements
  
**Header:** PFLobby.h
  
## See also
[PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md)
