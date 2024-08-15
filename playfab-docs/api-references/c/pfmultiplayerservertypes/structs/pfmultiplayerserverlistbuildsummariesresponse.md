---
author: jasonsandlin
title: "PFMultiplayerServerListBuildSummariesResponse"
description: "PFMultiplayerServerListBuildSummariesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListBuildSummariesResponse  

PFMultiplayerServerListBuildSummariesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListBuildSummariesResponse {  
    PFMultiplayerServerBuildSummary const* buildSummaries;  
    uint32_t buildSummariesCount;  
    int32_t pageSize;  
    const char* skipToken;  
} PFMultiplayerServerListBuildSummariesResponse;  
```
  
### Members  
  
**`buildSummaries`** &nbsp; [PFMultiplayerServerBuildSummary](pfmultiplayerserverbuildsummary.md) const*  
*may be nullptr*  
  
(Optional) The list of build summaries for a title.
  
**`buildSummariesCount`** &nbsp; uint32_t  
  
Count of buildSummaries
  
**`pageSize`** &nbsp; int32_t  
  
The page size on the response.
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged response.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
