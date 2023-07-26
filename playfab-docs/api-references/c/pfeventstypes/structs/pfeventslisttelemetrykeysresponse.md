---
author: jasonsandlin
title: "PFEventsListTelemetryKeysResponse"
description: "PFEventsListTelemetryKeysResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsListTelemetryKeysResponse  

PFEventsListTelemetryKeysResponse data model.  

## Syntax  
  
```cpp
typedef struct PFEventsListTelemetryKeysResponse {  
    PFEventsTelemetryKeyDetails const* keyDetails;  
    uint32_t keyDetailsCount;  
} PFEventsListTelemetryKeysResponse;  
```
  
### Members  
  
**`keyDetails`** &nbsp; [PFEventsTelemetryKeyDetails](pfeventstelemetrykeydetails.md) const*  
*may be nullptr*  
  
(Optional) The telemetry keys configured for the title.
  
**`keyDetailsCount`** &nbsp; uint32_t  
  
Count of keyDetails
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
