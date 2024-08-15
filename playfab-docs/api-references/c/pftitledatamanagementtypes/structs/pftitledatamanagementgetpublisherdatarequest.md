---
author: jasonsandlin
title: "PFTitleDataManagementGetPublisherDataRequest"
description: "PFTitleDataManagementGetPublisherDataRequest data model. This API is designed to return publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. For more information email helloplayfab@microsoft.com. Note that there may up to a minute delay in between updating title data and this API call returning the newest value."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementGetPublisherDataRequest  

PFTitleDataManagementGetPublisherDataRequest data model. This API is designed to return publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. For more information email helloplayfab@microsoft.com. Note that there may up to a minute delay in between updating title data and this API call returning the newest value.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetPublisherDataRequest {  
    const char* const* keys;  
    uint32_t keysCount;  
} PFTitleDataManagementGetPublisherDataRequest;  
```
  
### Members  
  
**`keys`** &nbsp; const char* const*  
  
array of keys to get back data from the Publisher data blob, set by the admin tools.
  
**`keysCount`** &nbsp; uint32_t  
  
Count of keys
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
