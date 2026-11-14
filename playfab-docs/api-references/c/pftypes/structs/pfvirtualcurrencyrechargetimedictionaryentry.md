---
author: jasonsandlin
title: "PFVirtualCurrencyRechargeTimeDictionaryEntry"
description: "Dictionary entry for an associative array with PFVirtualCurrencyRechargeTime values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFVirtualCurrencyRechargeTimeDictionaryEntry  

Dictionary entry for an associative array with PFVirtualCurrencyRechargeTime values.  

## Syntax  
  
```cpp
typedef struct PFVirtualCurrencyRechargeTimeDictionaryEntry {  
    const char* key;  
    PFVirtualCurrencyRechargeTime const* value;  
} PFVirtualCurrencyRechargeTimeDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry.  
  
**`value`** &nbsp; [PFVirtualCurrencyRechargeTime](pfvirtualcurrencyrechargetime.md) const*  
  
The `PFVirtualCurrencyRechargeTime` value associated with `key`.  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
