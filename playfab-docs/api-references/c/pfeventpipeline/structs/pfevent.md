---
author: jasonsandlin
title: "PFEvent"
description: "Event to be uploaded to PlayFab."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEvent  

Event to be uploaded to PlayFab.  

## Syntax  
  
```cpp
struct PFEvent {  
    PFEntityKey const* entity;  
    const char* eventNamespace;  
    const char* name;  
    const char* clientId;  
    const char* payloadJson;  
}  
```
  
### Members  
  
**`entity`** &nbsp; PFEntityKey const*  
*may be nullptr*  
  
Entity associated with the event. If null, the event will apply to the calling entity.
  
**`eventNamespace`** &nbsp; const char*  
*is null-terminated*  
  
The namespace in which the event is defined.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of the event.
  
**`clientId`** &nbsp; const char*  
*is null-terminated*  
  
Client assigned identifier associated with event. Not required but may be useful for tracking or tracing. If a clientId is not provided, the SDK will automatically assign one.
  
**`payloadJson`** &nbsp; const char*  
*is null-terminated*  
  
Arbitrary JSON data associated with the event.
  
  
## Requirements  
  
**Header:** PFEventPipeline.h
  
## See also  
[PFEventPipeline members](../pfeventpipeline_members.md)  

  
  
