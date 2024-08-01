---
author: jasonsandlin
title: "PFAccountManagementLinkGooglePlayGamesServicesAccountRequest"
description: "PFAccountManagementLinkGooglePlayGamesServicesAccountRequest data model. Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google Play Games sign-in for Android APIs on the device and passing it to this API."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkGooglePlayGamesServicesAccountRequest  

PFAccountManagementLinkGooglePlayGamesServicesAccountRequest data model. Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google Play Games sign-in for Android APIs on the device and passing it to this API.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkGooglePlayGamesServicesAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* serverAuthCode;  
} PFAccountManagementLinkGooglePlayGamesServicesAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link. If the current user is already linked, link both accounts.
  
**`serverAuthCode`** &nbsp; const char*  
*is null-terminated*  
  
OAuth 2.0 server authentication code obtained on the client by calling the requestServerSideAccess() (https://developers.google.com/games/services/android/signin) Google Play Games client API.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
