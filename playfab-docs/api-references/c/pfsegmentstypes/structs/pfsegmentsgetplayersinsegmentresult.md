---
author: jasonsandlin
title: "PFSegmentsGetPlayersInSegmentResult"
description: "PFSegmentsGetPlayersInSegmentResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetPlayersInSegmentResult  

PFSegmentsGetPlayersInSegmentResult data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetPlayersInSegmentResult {  
    const char* continuationToken;  
    PFSegmentsPlayerProfile const* playerProfiles;  
    uint32_t playerProfilesCount;  
    int32_t profilesInSegment;  
} PFSegmentsGetPlayersInSegmentResult;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Continuation token to use to retrieve subsequent pages of results. If token returns null there are no more results.
  
**`playerProfiles`** &nbsp; [PFSegmentsPlayerProfile](pfsegmentsplayerprofile.md) const*  
*may be nullptr*  
  
(Optional) Array of player profiles in this segment.
  
**`playerProfilesCount`** &nbsp; uint32_t  
  
Count of playerProfiles
  
**`profilesInSegment`** &nbsp; int32_t  
  
Count of profiles matching this segment.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
