---
author: ScottMunroMS
title: "PFLobbySearchConfiguration"
description: "The configuration structure used to specify how a [PFMultiplayerFindLobbies](../functions/pfmultiplayerfindlobbies.md) operation should be performed."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 07/14/2023
---

# PFLobbySearchConfiguration  

The configuration structure used to specify how a [PFMultiplayerFindLobbies](../functions/pfmultiplayerfindlobbies.md) operation should be performed.  

## Syntax  
  
```cpp
struct PFLobbySearchConfiguration {  
    const PFLobbySearchFriendsFilter* friendsFilter;  
    const char* filterString;  
    const char* sortString;  
    const uint32_t* clientSearchResultCount;  
}  
```
  
### Members  
  
**`friendsFilter`** &nbsp; const [PFLobbySearchFriendsFilter](pflobbysearchfriendsfilter.md)*  
*may be nullptr*  
  
A filter that, when provided, will constrain the lobby search operation to only those owned by the members of that player's various friend lists.
  
If omitted, the search operation will search all available lobbies. <br /><br /> This value may only be specified when [PFMultiplayerFindLobbies](../functions/pfmultiplayerfindlobbies.md) is called with a title_player_account entity.
  
**`filterString`** &nbsp; const char*  
*is null-terminated*  
  
The query string used to filter which lobbies are returned in the search results.
  
This string is formatted in an OData-like filtering syntax. <br /><br /> Only the following operators are supported: "and" (logical and), "eq" (equal), "ne" (not equals), "ge" (greater than or equal), "gt" (greater than), "le" (less than or equal), and "lt" (less than).   <br /><br /> The left-hand side of each OData logical expression should be either a search property key (e.g. string_key1, number_key3, etc) or one of the predefined search keys (```PFLobbyMemberCountSearchKey```, ```PFLobbyAmMemberSearchKey```, or ```PFLobbyMembershipLockSearchKey```)   <br /><br /> The left-hand side of each OData logical expression should be a search property key.   <br /><br /> This string cannot exceed 500 characters.   <br /><br /> Example: "lobby/membershipLock eq 'Unlocked' and string_key1 eq 'CaptureTheFlag' and number_key10 gt 50 and lobby/memberCount lt 5"
  
**`sortString`** &nbsp; const char*  
*is null-terminated*  
  
The query string used to sort the lobbies returned in the search results.
  
This string is formatted in an OData-like order-by syntax: a comma-separated list of search property keys with an optional specifier to sort in either ascending or descending order. <br /><br /> To specify ascending order, use the "asc" operator after the associated search property key. To specify descending order, use the "desc" operator after the associated search property key.   <br /><br /> Additionally, a special sorting moniker, distance, is supported to enable sorting by closest distance from some numeric value. For example, "distance{number_key10=5} asc" will sort the results so that lobbies who have their "number_key10" search property closer to the value "5" will return earlier in the search results.   <br /><br /> This string cannot exceed 100 characters.   <br /><br /> Example: "string_key1 asc,lobby/memberCount desc"
  
**`clientSearchResultCount`** &nbsp; const uint32_t*  
*may be nullptr*  
  
An optional value which, when specified by title_player_account entities, will limit the number of results provided in the completion response.
  
This value may only be specified when [PFMultiplayerFindLobbies](../functions/pfmultiplayerfindlobbies.md) is called with a title_player_account entity. <br /><br /> This value can be no higher than ```PFLobbyClientRequestedSearchResultCountUpperLimit```.   <br /><br /> When not specified, the limit on the number of search results is service-defined but will be no greater than ```PFLobbyClientRequestedSearchResultCountUpperLimit```.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
