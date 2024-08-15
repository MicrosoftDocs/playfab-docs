---
author: jasonsandlin
title: "Services C API overview - PFFriends.h"
description: "Services C API overview - PFFriends.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFFriends.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFFriendsClientAddFriendAsync](functions/pffriendsclientaddfriendasync.md) | Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized. |  
| [PFFriendsClientAddFriendGetResult](functions/pffriendsclientaddfriendgetresult.md) | Gets the result of a successful PFFriendsClientAddFriendAsync call. |  
| [PFFriendsClientGetFriendsListAsync](functions/pffriendsclientgetfriendslistasync.md) | Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends. |  
| [PFFriendsClientGetFriendsListGetResult](functions/pffriendsclientgetfriendslistgetresult.md) | Gets the result of a successful PFFriendsClientGetFriendsListAsync call. |  
| [PFFriendsClientGetFriendsListGetResultSize](functions/pffriendsclientgetfriendslistgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetFriendsList call. |  
| [PFFriendsClientRemoveFriendAsync](functions/pffriendsclientremovefriendasync.md) | Removes a specified user from the friend list of the local user |  
| [PFFriendsClientSetFriendTagsAsync](functions/pffriendsclientsetfriendtagsasync.md) | Updates the tag list for a specified user in the friend list of the local user |  
| [PFFriendsServerAddFriendAsync](functions/pffriendsserveraddfriendasync.md) | Adds the Friend user to the friendlist of the user with PlayFabId. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized. |  
| [PFFriendsServerGetFriendsListAsync](functions/pffriendsservergetfriendslistasync.md) | Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends. |  
| [PFFriendsServerGetFriendsListGetResult](functions/pffriendsservergetfriendslistgetresult.md) | Gets the result of a successful PFFriendsServerGetFriendsListAsync call. |  
| [PFFriendsServerGetFriendsListGetResultSize](functions/pffriendsservergetfriendslistgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetFriendsList call. |  
| [PFFriendsServerRemoveFriendAsync](functions/pffriendsserverremovefriendasync.md) | Removes the specified friend from the the user's friend list |  
| [PFFriendsServerSetFriendTagsAsync](functions/pffriendsserversetfriendtagsasync.md) | Updates the tag list for a specified user in the friend list of another user |  
