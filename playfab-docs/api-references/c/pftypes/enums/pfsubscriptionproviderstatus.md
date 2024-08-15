---
author: jasonsandlin
title: "PFSubscriptionProviderStatus"
description: "SubscriptionProviderStatus enum."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSubscriptionProviderStatus  

SubscriptionProviderStatus enum.    

## Syntax  
  
```cpp
enum class PFSubscriptionProviderStatus  : uint32_t  
{  
    NoError,  
    Cancelled,  
    UnknownError,  
    BillingError,  
    ProductUnavailable,  
    CustomerDidNotAcceptPriceChange,  
    FreeTrial,  
    PaymentPending  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoError | TBD   |  
| Cancelled | TBD   |  
| UnknownError | TBD   |  
| BillingError | TBD   |  
| ProductUnavailable | TBD   |  
| CustomerDidNotAcceptPriceChange | TBD   |  
| FreeTrial | TBD   |  
| PaymentPending | TBD   |  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
