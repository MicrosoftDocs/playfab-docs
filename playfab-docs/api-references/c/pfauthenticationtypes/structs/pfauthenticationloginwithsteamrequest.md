---
author: jasonsandlin
title: "PFAuthenticationLoginWithSteamRequest"
description: "PFAuthenticationLoginWithSteamRequest data model. Steam sign-in is accomplished with the Steam Session Ticket. More information on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth. NOTE: For Steam authentication to work, the title must be configured with the Steam Application ID and Web API Key in the PlayFab Game Manager (under Steam in the Add-ons Marketplace). You can obtain a Web API Key from the Permissions page of any Group associated with your App ID in the Steamworks site. If this is the first time a user has signed in with the Steam account and CreateAccount is set to true, a new PlayFab account will be created and linked to the provided account's Steam ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithSteamRequest  

PFAuthenticationLoginWithSteamRequest data model. Steam sign-in is accomplished with the Steam Session Ticket. More information on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth. NOTE: For Steam authentication to work, the title must be configured with the Steam Application ID and Web API Key in the PlayFab Game Manager (under Steam in the Add-ons Marketplace). You can obtain a Web API Key from the Permissions page of any Group associated with your App ID in the Steamworks site. If this is the first time a user has signed in with the Steam account and CreateAccount is set to true, a new PlayFab account will be created and linked to the provided account's Steam ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithSteamRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
    const char* steamTicket;  
    bool const* ticketIsServiceSpecific;  
} PFAuthenticationLoginWithSteamRequest;  
```
  
### Members  
  
**`createAccount`** &nbsp; bool  
  
Automatically create a PlayFab account if one is not currently linked to this ID.
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`infoRequestParameters`** &nbsp; PFGetPlayerCombinedInfoRequestParams const*  
*may be nullptr*  
  
(Optional) Flags for which pieces of info to return for the user.
  
**`playerSecret`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player secret that is used to verify API request signatures (Enterprise Only).
  
**`steamTicket`** &nbsp; const char*  
*is null-terminated*  
  
Authentication token for the user, returned as a byte array from Steam, and converted to a string (for example, the byte 0x08 should become "08").
  
**`ticketIsServiceSpecific`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) True if ticket was generated using ISteamUser::GetAuthTicketForWebAPI() using "AzurePlayFab" as the identity string. False if the ticket was generated with ISteamUser::GetAuthSessionTicket().
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
