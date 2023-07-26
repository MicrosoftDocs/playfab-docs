---
author: jasonsandlin
title: "PFEventsTelemetryKeyDetails"
description: "PFEventsTelemetryKeyDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsTelemetryKeyDetails  

PFEventsTelemetryKeyDetails data model.  

## Syntax  
  
```cpp
typedef struct PFEventsTelemetryKeyDetails {  
    time_t createTime;  
    bool isActive;  
    const char* keyValue;  
    time_t lastUpdateTime;  
    const char* name;  
} PFEventsTelemetryKeyDetails;  
```
  
### Members  
  
**`createTime`** &nbsp; time_t  
  
When the key was created.
  
**`isActive`** &nbsp; bool  
  
Whether or not the key is currently active. Deactivated keys cannot be used for telemetry ingestion.
  
**`keyValue`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The key that can be distributed to clients for use during telemetry ingestion.
  
**`lastUpdateTime`** &nbsp; time_t  
  
When the key was last updated.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the key. Telemetry key names are unique within the scope of the title.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
