---
author: jasonsandlin
title: "PFSegmentsGetPlayerSegmentsResult"
description: "PFSegmentsGetPlayerSegmentsResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetPlayerSegmentsResult  

PFSegmentsGetPlayerSegmentsResult data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetPlayerSegmentsResult {  
    PFSegmentsGetSegmentResult const* segments;  
    uint32_t segmentsCount;  
} PFSegmentsGetPlayerSegmentsResult;  
```
  
### Members  
  
**`segments`** &nbsp; [PFSegmentsGetSegmentResult](pfsegmentsgetsegmentresult.md) const*  
*may be nullptr*  
  
(Optional) Array of segments the requested player currently belongs to.
  
**`segmentsCount`** &nbsp; uint32_t  
  
Count of segments
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
