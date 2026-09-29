---
author: jasonsandlin
title: "PFEventsDataConnectionSettings"
description: "PFEventsDataConnectionSettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEventsDataConnectionSettings  

PFEventsDataConnectionSettings data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDataConnectionSettings {  
    PFEventsDataConnectionAzureBlobSettings const* azureBlobSettings;  
    PFEventsDataConnectionAzureDataExplorerSettings const* azureDataExplorerSettings;  
    PFEventsDataConnectionFabricKQLSettings const* azureFabricKQLSettings;  
} PFEventsDataConnectionSettings;  
```
  
### Members  
  
**`azureBlobSettings`** &nbsp; [PFEventsDataConnectionAzureBlobSettings](pfeventsdataconnectionazureblobsettings.md) const*  
*may be nullptr*  
  
(Optional) Settings if the type of connection is AzureBlobStorage.
  
**`azureDataExplorerSettings`** &nbsp; [PFEventsDataConnectionAzureDataExplorerSettings](pfeventsdataconnectionazuredataexplorersettings.md) const*  
*may be nullptr*  
  
(Optional) Settings if the type of connection is AzureDataExplorer.
  
**`azureFabricKQLSettings`** &nbsp; [PFEventsDataConnectionFabricKQLSettings](pfeventsdataconnectionfabrickqlsettings.md) const*  
*may be nullptr*  
  
(Optional) Settings if the type of connection is FabricKQL.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
