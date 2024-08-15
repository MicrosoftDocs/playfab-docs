---
author: jasonsandlin
title: "PFEventsWriteEventsRequest"
description: "PFEventsWriteEventsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventsWriteEventsRequest  

PFEventsWriteEventsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFEventsWriteEventsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEventsEventContents const* events;  
    uint32_t eventsCount;  
} PFEventsWriteEventsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`events`** &nbsp; [PFEventsEventContents](pfeventseventcontents.md) const*  
  
The collection of events to write. Up to 200 events can be written per request.
  
**`eventsCount`** &nbsp; uint32_t  
  
Count of events
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
