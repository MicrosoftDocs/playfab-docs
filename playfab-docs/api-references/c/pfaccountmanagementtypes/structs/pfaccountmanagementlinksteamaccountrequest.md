---
author: jasonsandlin
title: "PFAccountManagementLinkSteamAccountRequest"
description: "PFAccountManagementLinkSteamAccountRequest data model. Steam authentication is accomplished with the Steam Session Ticket. More information on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth (requires sign-in). NOTE: For Steam authentication to work, the title must be configured with the Steam Application ID and Publisher Key in the PlayFab Game Manager (under Properties). Information on creating a Publisher Key (referred to as the Secret Key in PlayFab) for your title can be found here: https://partner.steamgames.com/documentation/webapi#publisherkey."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkSteamAccountRequest  

PFAccountManagementLinkSteamAccountRequest data model. Steam authentication is accomplished with the Steam Session Ticket. More information on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth (requires sign-in). NOTE: For Steam authentication to work, the title must be configured with the Steam Application ID and Publisher Key in the PlayFab Game Manager (under Properties). Information on creating a Publisher Key (referred to as the Secret Key in PlayFab) for your title can be found here: https://partner.steamgames.com/documentation/webapi#publisherkey.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkSteamAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* steamTicket;  
    bool const* ticketIsServiceSpecific;  
} PFAccountManagementLinkSteamAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link.
  
**`steamTicket`** &nbsp; const char*  
*is null-terminated*  
  
Authentication token for the user, returned as a byte array from Steam, and converted to a string (for example, the byte 0x08 should become "08").
  
**`ticketIsServiceSpecific`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) True if ticket was generated using ISteamUser::GetAuthTicketForWebAPI() using "AzurePlayFab" as the identity string. False if the ticket was generated with ISteamUser::GetAuthSessionTicket().
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
