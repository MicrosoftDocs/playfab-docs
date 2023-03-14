---
author: jasonsandlin
title: "PFEventsWriteEventsRequest"
description: "PFEventsWriteEventsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFEventsWriteEventsRequest  

PFEventsWriteEventsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFEventsWriteEventsRequest {  
    uint32_t customTagsCount;  
    PFEventsEventContents const* events;  
    uint32_t eventsCount;  
} PFEventsWriteEventsRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`events`** &nbsp; [PFEventsEventContents](pfeventseventcontents.md) const*  
*array of size `eventsCount`*  
  
Collection of events to write to PlayStream.
  
**`eventsCount`** &nbsp; uint32_t  
  
Count of events
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
