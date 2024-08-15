---
author: jasonsandlin
title: "PFMultiplayerServerListBuildAliasesResponse"
description: "PFMultiplayerServerListBuildAliasesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListBuildAliasesResponse  

PFMultiplayerServerListBuildAliasesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListBuildAliasesResponse {  
    PFMultiplayerServerBuildAliasDetailsResponse const* buildAliases;  
    uint32_t buildAliasesCount;  
    int32_t pageSize;  
    const char* skipToken;  
} PFMultiplayerServerListBuildAliasesResponse;  
```
  
### Members  
  
**`buildAliases`** &nbsp; [PFMultiplayerServerBuildAliasDetailsResponse](pfmultiplayerserverbuildaliasdetailsresponse.md) const*  
*may be nullptr*  
  
(Optional) The list of build aliases for the title.
  
**`buildAliasesCount`** &nbsp; uint32_t  
  
Count of buildAliases
  
**`pageSize`** &nbsp; int32_t  
  
The page size on the response.
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged response.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
