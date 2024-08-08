---
author: jdeweyMSFT
title: "PartyEndpoint::GetSharedProperty"
description: Gets the value of a shared property.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/20/2023
---

# PartyEndpoint::GetSharedProperty  

Gets the value of a shared property.  

## Syntax  
  
```cpp
PartyError GetSharedProperty(  
    PartyString key,  
    PartyDataBuffer* value  
)  
```  
  
### Parameters  
  
**`key`** &nbsp; [PartyString](../../../typedefs.md)  
  
The key of the shared property to retrieve.  
  
**`value`** &nbsp; [PartyDataBuffer*](../../../structs/partydatabuffer.md)  
*output*  
  
An output struct that receives a pointer to the property's value and the length in bytes of the value data. If the property was not found, the call succeeds, but the value is nullptr and the byte length is 0.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If there is no property associated with the key, the resulting value is nullptr. The returned value is only valid until the next call to [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  
[PartyNetwork::CreateEndpoint](../../PartyNetwork/methods/partynetwork_createendpoint.md)
  
  
