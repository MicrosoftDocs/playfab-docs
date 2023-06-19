---
author: jasonsandlin
title: "PFEventPipelineTelemetryKeyConfig"
description: "Configuration struct that defines the properties required for using Telemetry Key."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFEventPipelineTelemetryKeyConfig  

Configuration struct that defines the properties required for using Telemetry Key.  

## Syntax  
  
```cpp
struct PFEventPipelineTelemetryKeyConfig {  
    const char* telemetryKey;  
    PFServiceConfigHandle serviceConfigHandle;  
}  
```
  
### Members  
  
**`telemetryKey`** &nbsp; const char*  
*is null-terminated*  
  
The Key created to send PlayFab event requests without an associated entity.
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
Service Config to be used with telemetry key.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
