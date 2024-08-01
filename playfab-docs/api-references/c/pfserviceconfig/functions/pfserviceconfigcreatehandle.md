---
author: jasonsandlin
title: "PFServiceConfigCreateHandle"
description: "Creates a PlayFab service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServiceConfigCreateHandle  

Creates a PlayFab service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigCreateHandle(  
    const char* apiEndpoint,  
    const char* playFabTitleId,  
    PFServiceConfigHandle* serviceConfigHandle  
)  
```  
  
### Parameters  
  
**`apiEndpoint`** &nbsp; char*  
*_In_z_*  
  
String used to connect to a PlayFab Service instance.  
  
**`playFabTitleId`** &nbsp; char*  
*_In_z_*  
  
PlayFab TitleId for the title. Found in the Game Manager for your title on the PlayFab Website.  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle*  
*output*  
  
Pointer to a PFServiceConfigHandle to write.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_PF_NOT_INITIALIZED, or E_INVALIDARG.
  
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
