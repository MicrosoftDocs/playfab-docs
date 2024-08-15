---
author: jasonsandlin
title: "PFMembershipModel"
description: "PFMembershipModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMembershipModel  

PFMembershipModel data model.  

## Syntax  
  
```cpp
typedef struct PFMembershipModel {  
    bool isActive;  
    time_t membershipExpiration;  
    const char* membershipId;  
    time_t const* overrideExpiration;  
    PFSubscriptionModel const* subscriptions;  
    uint32_t subscriptionsCount;  
} PFMembershipModel;  
```
  
### Members  
  
**`isActive`** &nbsp; bool  
  
Whether this membership is active. That is, whether the MembershipExpiration time has been reached.
  
**`membershipExpiration`** &nbsp; time_t  
  
The time this membership expires.
  
**`membershipId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the membership.
  
**`overrideExpiration`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Membership expirations can be explicitly overridden (via game manager or the admin api). If this membership has been overridden, this will be the new expiration time.
  
**`subscriptions`** &nbsp; [PFSubscriptionModel](pfsubscriptionmodel.md) const*  
*may be nullptr*  
  
(Optional) The list of subscriptions that this player has for this membership.
  
**`subscriptionsCount`** &nbsp; uint32_t  
  
Count of subscriptions
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
