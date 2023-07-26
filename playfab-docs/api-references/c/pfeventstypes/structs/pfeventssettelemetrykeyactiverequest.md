---
author: jasonsandlin
title: "PFEventsSetTelemetryKeyActiveRequest"
description: "PFEventsSetTelemetryKeyActiveRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFEventsSetTelemetryKeyActiveRequest  

PFEventsSetTelemetryKeyActiveRequest data model.  

## Syntax  
  
```cpp
typedef struct PFEventsSetTelemetryKeyActiveRequest {  
    bool active;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* keyName;  
} PFEventsSetTelemetryKeyActiveRequest;  
```
  
### Members  
  
**`active`** &nbsp; bool  
  
Whether to set the key to active (true) or deactivated (false).
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; PFEntityKey const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`keyName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the key to update.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
