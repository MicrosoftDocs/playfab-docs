---
author: jasonsandlin
title: "PFEventsWriteEventsResponse"
description: "PFEventsWriteEventsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEventsWriteEventsResponse  

PFEventsWriteEventsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFEventsWriteEventsResponse {  
    const char* const* assignedEventIds;  
    uint32_t assignedEventIdsCount;  
} PFEventsWriteEventsResponse;  
```
  
### Members  
  
**`assignedEventIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The unique identifiers assigned by the server to the events, in the same order as the events in the request. Only returned if FlushToPlayStream option is true.
  
**`assignedEventIdsCount`** &nbsp; uint32_t  
  
Count of assignedEventIds
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
