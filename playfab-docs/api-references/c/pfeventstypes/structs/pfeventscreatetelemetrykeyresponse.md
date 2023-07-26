---
author: jasonsandlin
title: "PFEventsCreateTelemetryKeyResponse"
description: "PFEventsCreateTelemetryKeyResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsCreateTelemetryKeyResponse  

PFEventsCreateTelemetryKeyResponse data model.  

## Syntax  
  
```cpp
typedef struct PFEventsCreateTelemetryKeyResponse {  
    PFEventsTelemetryKeyDetails const* newKeyDetails;  
} PFEventsCreateTelemetryKeyResponse;  
```
  
### Members  
  
**`newKeyDetails`** &nbsp; [PFEventsTelemetryKeyDetails](pfeventstelemetrykeydetails.md) const*  
*may be nullptr*  
  
(Optional) Details about the newly created telemetry key.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
