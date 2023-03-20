---
author: fschober-atg
title: "PFLobby Search Keys"
description: "Values representing predefined search keys."
ms.author: fschober
ms.topic: reference
ms.service: playfab
ms.date: 09/06/2022
---

# PFLobby Search Keys

Values representing the lobby's predefined search keys.

## Syntax
  
```cpp
constexpr char PFLobbyMemberCountSearchKey[] = "lobby/memberCount";
constexpr char PFLobbyAmMemberSearchKey[] = "lobby/amMember";
constexpr char PFLobbyAmOwnerSearchKey[] = "lobby/amOwner";
constexpr char PFLobbyMembershipLockSearchKey[] = "lobby/membershipLock";
```
  
## Constants
  
| Constant | Description | Example |
| --- | --- | --- |
| PFLobbyMemberCountSearchKey | A special, predefined search key that can be used in the [PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md) filtering and sorting strings to search for lobbies based on the current number of members in the lobby. | "lobby/memberCount lt 5" |
| PFLobbyAmMemberSearchKey | A special, predefined search key that can be used in the [PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md) filtering string to search for lobbies that you are currently a member of. | "lobby/amMember eq true" |
| PFLobbyAmOwnerSearchKey | A special, predefined search key that can be used in the [PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md) filtering string to search for lobbies that you own. | "lobby/amOwner eq true" |
| PFLobbyMembershipLockSearchKey | A special, predefined search key that can be used in the [PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md) filtering string to search for lobbies with a specific lock state. | "lobby/membershipLock eq 'Unlocked'" |
  
## Requirements
  
**Header:** PFLobby.h
  
## See also
[PFLobbySearchConfiguration](../structs/pflobbysearchconfiguration.md)
