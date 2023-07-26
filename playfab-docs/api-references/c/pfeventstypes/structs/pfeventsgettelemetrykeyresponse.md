---
author: jasonsandlin
title: "PFEventsGetTelemetryKeyResponse"
description: "PFEventsGetTelemetryKeyResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsGetTelemetryKeyResponse  

PFEventsGetTelemetryKeyResponse data model.  

## Syntax  
  
```cpp
typedef struct PFEventsGetTelemetryKeyResponse {  
    PFEventsTelemetryKeyDetails const* keyDetails;  
} PFEventsGetTelemetryKeyResponse;  
```
  
### Members  
  
**`keyDetails`** &nbsp; [PFEventsTelemetryKeyDetails](pfeventstelemetrykeydetails.md) const*  
*may be nullptr*  
  
(Optional) Details about the requested telemetry key.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
