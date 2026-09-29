---
author: jasonsandlin
title: "Services C API overview - PFPlayerDataManagementTypes.h"
description: "Services C API overview - PFPlayerDataManagementTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# Services C API overview - PFPlayerDataManagementTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest](structs/pfplayerdatamanagementclientdeleteplayercustompropertiesrequest.md) | PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest data model. Deletes custom properties for the specified player. The list of provided property names must be non-empty. |  
| [PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult](structs/pfplayerdatamanagementclientdeleteplayercustompropertiesresult.md) | PFPlayerDataManagementClientDeletePlayerCustomPropertiesResult data model. |  
| [PFPlayerDataManagementClientGetPlayerCustomPropertyRequest](structs/pfplayerdatamanagementclientgetplayercustompropertyrequest.md) | PFPlayerDataManagementClientGetPlayerCustomPropertyRequest data model. |  
| [PFPlayerDataManagementClientGetPlayerCustomPropertyResult](structs/pfplayerdatamanagementclientgetplayercustompropertyresult.md) | PFPlayerDataManagementClientGetPlayerCustomPropertyResult data model. |  
| [PFPlayerDataManagementClientGetUserDataResult](structs/pfplayerdatamanagementclientgetuserdataresult.md) | PFPlayerDataManagementClientGetUserDataResult data model. |  
| [PFPlayerDataManagementClientListPlayerCustomPropertiesResult](structs/pfplayerdatamanagementclientlistplayercustompropertiesresult.md) | PFPlayerDataManagementClientListPlayerCustomPropertiesResult data model. |  
| [PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest](structs/pfplayerdatamanagementclientupdateplayercustompropertiesrequest.md) | PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest data model. Performs an additive update of the custom properties for the specified player. In updating the player's custom properties, properties which already exist will have their values overwritten. No other properties will be changed apart from those specified in the call. |  
| [PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult](structs/pfplayerdatamanagementclientupdateplayercustompropertiesresult.md) | PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult data model. |  
| [PFPlayerDataManagementClientUpdateUserDataRequest](structs/pfplayerdatamanagementclientupdateuserdatarequest.md) | PFPlayerDataManagementClientUpdateUserDataRequest data model. This function performs an additive update of the arbitrary strings containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. New keys will be added, with the given values. No other key-value pairs will be changed apart from those specified in the call. |  
| [PFPlayerDataManagementCustomPropertyDetails](structs/pfplayerdatamanagementcustompropertydetails.md) | PFPlayerDataManagementCustomPropertyDetails data model. |  
| [PFPlayerDataManagementDeletedPropertyDetails](structs/pfplayerdatamanagementdeletedpropertydetails.md) | PFPlayerDataManagementDeletedPropertyDetails data model. |  
| [PFPlayerDataManagementGetUserDataRequest](structs/pfplayerdatamanagementgetuserdatarequest.md) | PFPlayerDataManagementGetUserDataRequest data model. Data is stored as JSON key-value pairs. Every time the data is updated via any source, the version counter is incremented. If the Version parameter is provided, then this call will only return data if the current version on the system is greater than the value provided. If the Keys parameter is provided, the data object returned will only contain the data specific to the indicated Keys. Otherwise, the full set of custom user data will be returned. |  
| [PFPlayerDataManagementListPlayerCustomPropertiesRequest](structs/pfplayerdatamanagementlistplayercustompropertiesrequest.md) | PFPlayerDataManagementListPlayerCustomPropertiesRequest data model. |  
| [PFPlayerDataManagementServerDeletePlayerCustomPropertiesRequest](structs/pfplayerdatamanagementserverdeleteplayercustompropertiesrequest.md) | PFPlayerDataManagementServerDeletePlayerCustomPropertiesRequest data model. Deletes custom properties for the specified player. The list of provided property names must be non-empty. |  
| [PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult](structs/pfplayerdatamanagementserverdeleteplayercustompropertiesresult.md) | PFPlayerDataManagementServerDeletePlayerCustomPropertiesResult data model. |  
| [PFPlayerDataManagementServerGetPlayerCustomPropertyRequest](structs/pfplayerdatamanagementservergetplayercustompropertyrequest.md) | PFPlayerDataManagementServerGetPlayerCustomPropertyRequest data model. |  
| [PFPlayerDataManagementServerGetPlayerCustomPropertyResult](structs/pfplayerdatamanagementservergetplayercustompropertyresult.md) | PFPlayerDataManagementServerGetPlayerCustomPropertyResult data model. |  
| [PFPlayerDataManagementServerGetUserDataResult](structs/pfplayerdatamanagementservergetuserdataresult.md) | PFPlayerDataManagementServerGetUserDataResult data model. |  
| [PFPlayerDataManagementServerListPlayerCustomPropertiesResult](structs/pfplayerdatamanagementserverlistplayercustompropertiesresult.md) | PFPlayerDataManagementServerListPlayerCustomPropertiesResult data model. |  
| [PFPlayerDataManagementServerUpdatePlayerCustomPropertiesRequest](structs/pfplayerdatamanagementserverupdateplayercustompropertiesrequest.md) | PFPlayerDataManagementServerUpdatePlayerCustomPropertiesRequest data model. Performs an additive update of the custom properties for the specified player. In updating the player's custom properties, properties which already exist will have their values overwritten. No other properties will be changed apart from those specified in the call. |  
| [PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult](structs/pfplayerdatamanagementserverupdateplayercustompropertiesresult.md) | PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult data model. |  
| [PFPlayerDataManagementServerUpdateUserDataRequest](structs/pfplayerdatamanagementserverupdateuserdatarequest.md) | PFPlayerDataManagementServerUpdateUserDataRequest data model. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call. |  
| [PFPlayerDataManagementUpdateProperty](structs/pfplayerdatamanagementupdateproperty.md) | PFPlayerDataManagementUpdateProperty data model. |  
| [PFPlayerDataManagementUpdateUserDataResult](structs/pfplayerdatamanagementupdateuserdataresult.md) | PFPlayerDataManagementUpdateUserDataResult data model. |  
| [PFPlayerDataManagementUpdateUserInternalDataRequest](structs/pfplayerdatamanagementupdateuserinternaldatarequest.md) | PFPlayerDataManagementUpdateUserInternalDataRequest data model. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call. |  
