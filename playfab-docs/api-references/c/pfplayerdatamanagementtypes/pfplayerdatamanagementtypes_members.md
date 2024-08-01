---
author: jasonsandlin
title: "Services C API overview - PFPlayerDataManagementTypes.h"
description: "Services C API overview - PFPlayerDataManagementTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFPlayerDataManagementTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFPlayerDataManagementClientGetUserDataResult](structs/pfplayerdatamanagementclientgetuserdataresult.md) | PFPlayerDataManagementClientGetUserDataResult data model. |  
| [PFPlayerDataManagementClientUpdateUserDataRequest](structs/pfplayerdatamanagementclientupdateuserdatarequest.md) | PFPlayerDataManagementClientUpdateUserDataRequest data model. This function performs an additive update of the arbitrary strings containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. New keys will be added, with the given values. No other key-value pairs will be changed apart from those specified in the call. |  
| [PFPlayerDataManagementGetUserDataRequest](structs/pfplayerdatamanagementgetuserdatarequest.md) | PFPlayerDataManagementGetUserDataRequest data model. Data is stored as JSON key-value pairs. Every time the data is updated via any source, the version counter is incremented. If the Version parameter is provided, then this call will only return data if the current version on the system is greater than the value provided. If the Keys parameter is provided, the data object returned will only contain the data specific to the indicated Keys. Otherwise, the full set of custom user data will be returned. |  
| [PFPlayerDataManagementServerGetUserDataResult](structs/pfplayerdatamanagementservergetuserdataresult.md) | PFPlayerDataManagementServerGetUserDataResult data model. |  
| [PFPlayerDataManagementServerUpdateUserDataRequest](structs/pfplayerdatamanagementserverupdateuserdatarequest.md) | PFPlayerDataManagementServerUpdateUserDataRequest data model. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call. |  
| [PFPlayerDataManagementUpdateUserDataResult](structs/pfplayerdatamanagementupdateuserdataresult.md) | PFPlayerDataManagementUpdateUserDataResult data model. |  
| [PFPlayerDataManagementUpdateUserInternalDataRequest](structs/pfplayerdatamanagementupdateuserinternaldatarequest.md) | PFPlayerDataManagementUpdateUserInternalDataRequest data model. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call. |  
