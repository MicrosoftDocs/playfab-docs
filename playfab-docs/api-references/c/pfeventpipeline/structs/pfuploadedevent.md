---
author: jasonsandlin
title: "PFUploadedEvent"
description: "Event that has been uploaded to PlayFab. Associates the service assigned ID with the clientId provided when the event was emitted."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUploadedEvent  

Event that has been uploaded to PlayFab. Associates the service assigned ID with the clientId provided when the event was emitted.  

## Syntax  
  
```cpp
struct PFUploadedEvent {  
    const char* clientId;  
    const char* serviceId;  
}  
```
  
### Members  
  
**`clientId`** &nbsp; const char*  
*is null-terminated*  
  
Id assigned by the client prior to the event being uploaded.
  
**`serviceId`** &nbsp; const char*  
*is null-terminated*  
  
Unique Id assigned by the PlayFab server for the event.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
