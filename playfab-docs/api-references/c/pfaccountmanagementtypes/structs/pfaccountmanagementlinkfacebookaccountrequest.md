---
author: jasonsandlin
title: "PFAccountManagementLinkFacebookAccountRequest"
description: "PFAccountManagementLinkFacebookAccountRequest data model. Facebook sign-in is accomplished using the Facebook User Access Token. More information on the Token can be found in the Facebook developer documentation (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject FB. Note that titles should never re-use the same Facebook applications between PlayFab Title IDs, as Facebook provides unique user IDs per application and doing so can result in issues with the Facebook ID for the user in their PlayFab account information. If you must re-use an application in a new PlayFab Title ID, please be sure to first unlink all accounts from Facebook, or delete all users in the first Title ID."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkFacebookAccountRequest  

PFAccountManagementLinkFacebookAccountRequest data model. Facebook sign-in is accomplished using the Facebook User Access Token. More information on the Token can be found in the Facebook developer documentation (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject FB. Note that titles should never re-use the same Facebook applications between PlayFab Title IDs, as Facebook provides unique user IDs per application and doing so can result in issues with the Facebook ID for the user in their PlayFab account information. If you must re-use an application in a new PlayFab Title ID, please be sure to first unlink all accounts from Facebook, or delete all users in the first Title ID.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkFacebookAccountRequest {  
    const char* accessToken;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
} PFAccountManagementLinkFacebookAccountRequest;  
```
  
### Members  
  
**`accessToken`** &nbsp; const char*  
*is null-terminated*  
  
Unique identifier from Facebook for the user.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
