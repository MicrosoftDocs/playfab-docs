---
author: jasonsandlin
title: "PFSegmentsGetSegmentResult"
description: "PFSegmentsGetSegmentResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetSegmentResult  

PFSegmentsGetSegmentResult data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetSegmentResult {  
    const char* aBTestParent;  
    const char* id;  
    const char* name;  
} PFSegmentsGetSegmentResult;  
```
  
### Members  
  
**`aBTestParent`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Identifier of the segments AB Test, if it is attached to one.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
Unique identifier for this segment.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Segment name.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
