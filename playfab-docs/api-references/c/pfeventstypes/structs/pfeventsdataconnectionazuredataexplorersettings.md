---
author: jasonsandlin
title: "PFEventsDataConnectionAzureDataExplorerSettings"
description: "PFEventsDataConnectionAzureDataExplorerSettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEventsDataConnectionAzureDataExplorerSettings  

PFEventsDataConnectionAzureDataExplorerSettings data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDataConnectionAzureDataExplorerSettings {  
    const char* clusterUri;  
    const char* database;  
    const char* table;  
} PFEventsDataConnectionAzureDataExplorerSettings;  
```
  
### Members  
  
**`clusterUri`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The URI of the ADX cluster.
  
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

  
  
