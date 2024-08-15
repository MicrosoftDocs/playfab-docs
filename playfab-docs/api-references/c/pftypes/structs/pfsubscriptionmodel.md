---
author: jasonsandlin
title: "PFSubscriptionModel"
description: "PFSubscriptionModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSubscriptionModel  

PFSubscriptionModel data model.  

## Syntax  
  
```cpp
typedef struct PFSubscriptionModel {  
    time_t expiration;  
    time_t initialSubscriptionTime;  
    bool isActive;  
    PFSubscriptionProviderStatus const* status;  
    const char* subscriptionId;  
    const char* subscriptionItemId;  
    const char* subscriptionProvider;  
} PFSubscriptionModel;  
```
  
### Members  
  
**`expiration`** &nbsp; time_t  
  
When this subscription expires.
  
**`initialSubscriptionTime`** &nbsp; time_t  
  
The time the subscription was orignially purchased.
  
**`isActive`** &nbsp; bool  
  
Whether this subscription is currently active. That is, if Expiration&gt; now.
  
**`status`** &nbsp; [PFSubscriptionProviderStatus](../enums/pfsubscriptionproviderstatus.md) const*  
*may be nullptr*  
  
(Optional) The status of this subscription, according to the subscription provider.
  
**`subscriptionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id for this subscription.
  
**`subscriptionItemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The item id for this subscription from the primary catalog.
  
**`subscriptionProvider`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The provider for this subscription. Apple or Google Play are supported today.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
