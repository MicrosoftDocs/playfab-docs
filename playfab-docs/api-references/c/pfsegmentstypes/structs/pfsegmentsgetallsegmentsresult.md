---
author: jasonsandlin
title: "PFSegmentsGetAllSegmentsResult"
description: "PFSegmentsGetAllSegmentsResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetAllSegmentsResult  

PFSegmentsGetAllSegmentsResult data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetAllSegmentsResult {  
    PFSegmentsGetSegmentResult const* segments;  
    uint32_t segmentsCount;  
} PFSegmentsGetAllSegmentsResult;  
```
  
### Members  
  
**`segments`** &nbsp; [PFSegmentsGetSegmentResult](pfsegmentsgetsegmentresult.md) const*  
*may be nullptr*  
  
(Optional) Array of segments for this title.
  
**`segmentsCount`** &nbsp; uint32_t  
  
Count of segments
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
