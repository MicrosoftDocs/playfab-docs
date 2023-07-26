---
author: jasonsandlin
title: "PFEventsSetTelemetryKeyActiveResponse"
description: "PFEventsSetTelemetryKeyActiveResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsSetTelemetryKeyActiveResponse  

PFEventsSetTelemetryKeyActiveResponse data model.  

## Syntax  
  
```cpp
typedef struct PFEventsSetTelemetryKeyActiveResponse {  
    PFEventsTelemetryKeyDetails const* keyDetails;  
    bool wasKeyUpdated;  
} PFEventsSetTelemetryKeyActiveResponse;  
```
  
### Members  
  
**`keyDetails`** &nbsp; [PFEventsTelemetryKeyDetails](pfeventstelemetrykeydetails.md) const*  
*may be nullptr*  
  
(Optional) The most current details about the telemetry key that was to be updated.
  
**`wasKeyUpdated`** &nbsp; bool  
  
Indicates whether or not the key was updated. If false, the key was already in the desired state.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
