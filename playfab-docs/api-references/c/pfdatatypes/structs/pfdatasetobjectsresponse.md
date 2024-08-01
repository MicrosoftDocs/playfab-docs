---
author: jasonsandlin
title: "PFDataSetObjectsResponse"
description: "PFDataSetObjectsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataSetObjectsResponse  

PFDataSetObjectsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataSetObjectsResponse {  
    int32_t profileVersion;  
    PFDataSetObjectInfo const* setResults;  
    uint32_t setResultsCount;  
} PFDataSetObjectsResponse;  
```
  
### Members  
  
**`profileVersion`** &nbsp; int32_t  
  
New version of the entity profile.
  
**`setResults`** &nbsp; [PFDataSetObjectInfo](pfdatasetobjectinfo.md) const*  
*may be nullptr*  
  
(Optional) New version of the entity profile.
  
**`setResultsCount`** &nbsp; uint32_t  
  
Count of setResults
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
