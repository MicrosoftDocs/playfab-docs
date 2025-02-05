---
author: jasonsandlin
title: "PFMultiplayerServerListSecretSummariesResponse"
description: "PFMultiplayerServerListSecretSummariesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFMultiplayerServerListSecretSummariesResponse  

PFMultiplayerServerListSecretSummariesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListSecretSummariesResponse {  
    int32_t pageSize;  
    PFMultiplayerServerSecretSummary const* secretSummaries;  
    uint32_t secretSummariesCount;  
    const char* skipToken;  
} PFMultiplayerServerListSecretSummariesResponse;  
```
  
### Members  
  
**`pageSize`** &nbsp; int32_t  
  
The page size on the response.
  
**`secretSummaries`** &nbsp; [PFMultiplayerServerSecretSummary](pfmultiplayerserversecretsummary.md) const*  
*may be nullptr*  
  
(Optional) The list of game secret.
  
**`secretSummariesCount`** &nbsp; uint32_t  
  
Count of secretSummaries
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged response.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
