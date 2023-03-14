---
author: jasonsandlin
title: "PFSegmentsGetPlayerSegmentsResult"
description: "PFSegmentsGetPlayerSegmentsResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
*array of size `segmentsCount`*  
  
(Optional) Array of segments the requested player currently belongs to.
  
**`segmentsCount`** &nbsp; uint32_t  
  
Count of segments
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
