---
author: jasonsandlin
title: "PFMultiplayerServerListQosServersForTitleRequest"
description: "PFMultiplayerServerListQosServersForTitleRequest data model. Returns a list of quality of service servers for a title."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerListQosServersForTitleRequest  

PFMultiplayerServerListQosServersForTitleRequest data model. Returns a list of quality of service servers for a title.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListQosServersForTitleRequest {  
    uint32_t customTagsCount;  
    bool const* includeAllRegions;  
} PFMultiplayerServerListQosServersForTitleRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`includeAllRegions`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Indicates that the response should contain Qos servers for all regions, including those where there are no builds deployed for the title.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
