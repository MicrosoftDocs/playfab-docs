---
author: jasonsandlin
title: "PFVariable"
description: "PFVariable data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFVariable  

PFVariable data model.  

## Syntax  
  
```cpp
typedef struct PFVariable {  
    const char* name;  
    const char* value;  
} PFVariable;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the variable.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Value of the variable.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
