---
author: jasonsandlin
title: "PFEventsDataConnectionAzureBlobSettings"
description: "PFEventsDataConnectionAzureBlobSettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEventsDataConnectionAzureBlobSettings  

PFEventsDataConnectionAzureBlobSettings data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDataConnectionAzureBlobSettings {  
    const char* accountName;  
    const char* containerName;  
    const char* tenantId;  
} PFEventsDataConnectionAzureBlobSettings;  
```
  
### Members  
  
**`accountName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the storage account.
  
**`containerName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the container.
  
**`tenantId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Azure Entra Tenant Id.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
