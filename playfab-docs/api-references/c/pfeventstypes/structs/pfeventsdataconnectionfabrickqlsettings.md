---
author: jasonsandlin
title: "PFEventsDataConnectionFabricKQLSettings"
description: "PFEventsDataConnectionFabricKQLSettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEventsDataConnectionFabricKQLSettings  

PFEventsDataConnectionFabricKQLSettings data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDataConnectionFabricKQLSettings {  
    const char* clusterUri;  
    const char* database;  
    const char* table;  
} PFEventsDataConnectionFabricKQLSettings;  
```
  
### Members  
  
**`clusterUri`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The URI of the Fabric cluster.
  
**`database`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The database to write to.
  
**`table`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The table to write to.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
