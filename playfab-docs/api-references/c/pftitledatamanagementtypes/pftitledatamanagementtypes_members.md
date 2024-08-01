---
author: jasonsandlin
title: "Services C API overview - PFTitleDataManagementTypes.h"
description: "Services C API overview - PFTitleDataManagementTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFTitleDataManagementTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFTitleDataManagementGetPublisherDataRequest](structs/pftitledatamanagementgetpublisherdatarequest.md) | PFTitleDataManagementGetPublisherDataRequest data model. This API is designed to return publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. For more information email helloplayfab@microsoft.com. Note that there may up to a minute delay in between updating title data and this API call returning the newest value. |  
| [PFTitleDataManagementGetPublisherDataResult](structs/pftitledatamanagementgetpublisherdataresult.md) | PFTitleDataManagementGetPublisherDataResult data model. |  
| [PFTitleDataManagementGetTimeResult](structs/pftitledatamanagementgettimeresult.md) | PFTitleDataManagementGetTimeResult data model. Time is always returned as Coordinated Universal Time (UTC). |  
| [PFTitleDataManagementGetTitleDataRequest](structs/pftitledatamanagementgettitledatarequest.md) | PFTitleDataManagementGetTitleDataRequest data model. This API is designed to return title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. If the player belongs to an experiment variant that uses title data overrides, the overrides are applied automatically and returned with the title data. Note that there may up to a minute delay in between updating title data and this API call returning the newest value. |  
| [PFTitleDataManagementGetTitleDataResult](structs/pftitledatamanagementgettitledataresult.md) | PFTitleDataManagementGetTitleDataResult data model. |  
| [PFTitleDataManagementGetTitleNewsRequest](structs/pftitledatamanagementgettitlenewsrequest.md) | PFTitleDataManagementGetTitleNewsRequest data model. |  
| [PFTitleDataManagementGetTitleNewsResult](structs/pftitledatamanagementgettitlenewsresult.md) | PFTitleDataManagementGetTitleNewsResult data model. |  
| [PFTitleDataManagementSetPublisherDataRequest](structs/pftitledatamanagementsetpublisherdatarequest.md) | PFTitleDataManagementSetPublisherDataRequest data model. This API is designed to store publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value. For more information email helloplayfab@microsoft.com. |  
| [PFTitleDataManagementSetTitleDataRequest](structs/pftitledatamanagementsettitledatarequest.md) | PFTitleDataManagementSetTitleDataRequest data model. This API is designed to store title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value. |  
| [PFTitleDataManagementTitleNewsItem](structs/pftitledatamanagementtitlenewsitem.md) | PFTitleDataManagementTitleNewsItem data model. |  
