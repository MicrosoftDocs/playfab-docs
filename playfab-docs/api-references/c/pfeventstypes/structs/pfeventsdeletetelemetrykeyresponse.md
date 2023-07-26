---
author: jasonsandlin
title: "PFEventsDeleteTelemetryKeyResponse"
description: "PFEventsDeleteTelemetryKeyResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsDeleteTelemetryKeyResponse  

PFEventsDeleteTelemetryKeyResponse data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDeleteTelemetryKeyResponse {  
    bool wasKeyDeleted;  
} PFEventsDeleteTelemetryKeyResponse;  
```
  
### Members  
  
**`wasKeyDeleted`** &nbsp; bool  
  
Indicates whether or not the key was deleted. If false, no key with that name existed.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
