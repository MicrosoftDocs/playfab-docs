---
author: jasonsandlin
title: "PFValueToDateModel"
description: "PFValueToDateModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFValueToDateModel  

PFValueToDateModel data model.  

## Syntax  
  
```cpp
typedef struct PFValueToDateModel {  
    const char* currency;  
    uint32_t totalValue;  
    const char* totalValueAsDecimal;  
} PFValueToDateModel;  
```
  
### Members  
  
**`currency`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ISO 4217 code of the currency used in the purchases.
  
**`totalValue`** &nbsp; uint32_t  
  
Total value of the purchases in a whole number of 1/100 monetary units. For example, 999 indicates nine dollars and ninety-nine cents when Currency is 'USD').
  
**`totalValueAsDecimal`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Total value of the purchases in a string representation of decimal monetary units. For example, '9.99' indicates nine dollars and ninety-nine cents when Currency is 'USD'.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
