---
author: jasonsandlin
title: "PFEntityGetEntityKey"
description: "Get the PFEntityKey for an entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetEntityKey  

Get the PFEntityKey for an entity.  

## Syntax  
  
```cpp
HRESULT PFEntityGetEntityKey(  
    PFEntityHandle entityHandle,  
    size_t bufferSize,  
    void* buffer,  
    const PFEntityKey** entityKey,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a auth call.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the PFEntityKey. The required size can be obtained from PFEntityGetEntityKeySize.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the PFEntityKey and its fields.  
  
**`entityKey`** &nbsp; [PFEntityKey**](../../pftypes/structs/pfentitykey-c.md)  
*library-allocated output*  
  
TBD    
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
entityKey is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
