---
author: jasonsandlin
title: "PFTitleDataManagementSetPublisherDataRequest"
description: "PFTitleDataManagementSetPublisherDataRequest data model. This API is designed to store publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value. For more information email helloplayfab@microsoft.com."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementSetPublisherDataRequest  

PFTitleDataManagementSetPublisherDataRequest data model. This API is designed to store publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value. For more information email helloplayfab@microsoft.com.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementSetPublisherDataRequest {  
    const char* key;  
    const char* value;  
} PFTitleDataManagementSetPublisherDataRequest;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
Key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) New value to set. Set to null to remove a value.
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
