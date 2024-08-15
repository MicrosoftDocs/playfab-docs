---
author: jasonsandlin
title: "PFCatalogDisplayPropertyIndexInfo"
description: "PFCatalogDisplayPropertyIndexInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogDisplayPropertyIndexInfo  

PFCatalogDisplayPropertyIndexInfo data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogDisplayPropertyIndexInfo {  
    const char* name;  
    PFCatalogDisplayPropertyType const* type;  
} PFCatalogDisplayPropertyIndexInfo;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The property name in the 'DisplayProperties' property to be indexed.
  
**`type`** &nbsp; [PFCatalogDisplayPropertyType](../enums/pfcatalogdisplaypropertytype.md) const*  
*may be nullptr*  
  
(Optional) The type of the property to be indexed.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
