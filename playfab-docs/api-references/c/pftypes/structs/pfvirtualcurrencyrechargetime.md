---
author: jasonsandlin
title: "PFVirtualCurrencyRechargeTime"
description: "PFVirtualCurrencyRechargeTime data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFVirtualCurrencyRechargeTime  

PFVirtualCurrencyRechargeTime data model.  

## Syntax  
  
```cpp
typedef struct PFVirtualCurrencyRechargeTime {  
    int32_t rechargeMax;  
    time_t rechargeTime;  
    int32_t secondsToRecharge;  
} PFVirtualCurrencyRechargeTime;  
```
  
### Members  
  
**`rechargeMax`** &nbsp; int32_t  
  
Maximum value to which the regenerating currency will automatically increment. Note that it can exceed this value through use of the AddUserVirtualCurrency API call. However, it will not regenerate automatically until it has fallen below this value.
  
**`rechargeTime`** &nbsp; time_t  
  
Server timestamp in UTC indicating the next time the virtual currency will be incremented.
  
**`secondsToRecharge`** &nbsp; int32_t  
  
Time remaining (in seconds) before the next recharge increment of the virtual currency.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
