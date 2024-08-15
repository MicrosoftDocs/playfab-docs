---
author: jasonsandlin
title: "Services C API overview - PFPlayerDataManagement.h"
description: "Services C API overview - PFPlayerDataManagement.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFPlayerDataManagement.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFPlayerDataManagementClientGetUserDataAsync](functions/pfplayerdatamanagementclientgetuserdataasync.md) | Retrieves the title-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementClientGetUserDataGetResult](functions/pfplayerdatamanagementclientgetuserdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementClientGetUserDataAsync call. |  
| [PFPlayerDataManagementClientGetUserDataGetResultSize](functions/pfplayerdatamanagementclientgetuserdatagetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetUserData call. |  
| [PFPlayerDataManagementClientGetUserPublisherDataAsync](functions/pfplayerdatamanagementclientgetuserpublisherdataasync.md) | Retrieves the publisher-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementClientGetUserPublisherDataGetResult](functions/pfplayerdatamanagementclientgetuserpublisherdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementClientGetUserPublisherDataAsync call. |  
| [PFPlayerDataManagementClientGetUserPublisherDataGetResultSize](functions/pfplayerdatamanagementclientgetuserpublisherdatagetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetUserPublisherData call. |  
| [PFPlayerDataManagementClientGetUserPublisherReadOnlyDataAsync](functions/pfplayerdatamanagementclientgetuserpublisherreadonlydataasync.md) | Retrieves the publisher-specific custom data for the user which can only be read by the client |  
| [PFPlayerDataManagementClientGetUserPublisherReadOnlyDataGetResult](functions/pfplayerdatamanagementclientgetuserpublisherreadonlydatagetresult.md) | Gets the result of a successful PFPlayerDataManagementClientGetUserPublisherReadOnlyDataAsync call. |  
| [PFPlayerDataManagementClientGetUserPublisherReadOnlyDataGetResultSize](functions/pfplayerdatamanagementclientgetuserpublisherreadonlydatagetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetUserPublisherReadOnlyData call. |  
| [PFPlayerDataManagementClientGetUserReadOnlyDataAsync](functions/pfplayerdatamanagementclientgetuserreadonlydataasync.md) | Retrieves the title-specific custom data for the user which can only be read by the client |  
| [PFPlayerDataManagementClientGetUserReadOnlyDataGetResult](functions/pfplayerdatamanagementclientgetuserreadonlydatagetresult.md) | Gets the result of a successful PFPlayerDataManagementClientGetUserReadOnlyDataAsync call. |  
| [PFPlayerDataManagementClientGetUserReadOnlyDataGetResultSize](functions/pfplayerdatamanagementclientgetuserreadonlydatagetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetUserReadOnlyData call. |  
| [PFPlayerDataManagementClientUpdateUserDataAsync](functions/pfplayerdatamanagementclientupdateuserdataasync.md) | Creates and updates the title-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementClientUpdateUserDataGetResult](functions/pfplayerdatamanagementclientupdateuserdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementClientUpdateUserDataAsync call. |  
| [PFPlayerDataManagementClientUpdateUserPublisherDataAsync](functions/pfplayerdatamanagementclientupdateuserpublisherdataasync.md) | Creates and updates the publisher-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementClientUpdateUserPublisherDataGetResult](functions/pfplayerdatamanagementclientupdateuserpublisherdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementClientUpdateUserPublisherDataAsync call. |  
| [PFPlayerDataManagementServerGetUserDataAsync](functions/pfplayerdatamanagementservergetuserdataasync.md) | Retrieves the title-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementServerGetUserDataGetResult](functions/pfplayerdatamanagementservergetuserdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerGetUserDataAsync call. |  
| [PFPlayerDataManagementServerGetUserDataGetResultSize](functions/pfplayerdatamanagementservergetuserdatagetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetUserData call. |  
| [PFPlayerDataManagementServerGetUserInternalDataAsync](functions/pfplayerdatamanagementservergetuserinternaldataasync.md) | Retrieves the title-specific custom data for the user which cannot be accessed by the client |  
| [PFPlayerDataManagementServerGetUserInternalDataGetResult](functions/pfplayerdatamanagementservergetuserinternaldatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerGetUserInternalDataAsync call. |  
| [PFPlayerDataManagementServerGetUserInternalDataGetResultSize](functions/pfplayerdatamanagementservergetuserinternaldatagetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetUserInternalData call. |  
| [PFPlayerDataManagementServerGetUserPublisherDataAsync](functions/pfplayerdatamanagementservergetuserpublisherdataasync.md) | Retrieves the publisher-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementServerGetUserPublisherDataGetResult](functions/pfplayerdatamanagementservergetuserpublisherdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerGetUserPublisherDataAsync call. |  
| [PFPlayerDataManagementServerGetUserPublisherDataGetResultSize](functions/pfplayerdatamanagementservergetuserpublisherdatagetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetUserPublisherData call. |  
| [PFPlayerDataManagementServerGetUserPublisherInternalDataAsync](functions/pfplayerdatamanagementservergetuserpublisherinternaldataasync.md) | Retrieves the publisher-specific custom data for the user which cannot be accessed by the client |  
| [PFPlayerDataManagementServerGetUserPublisherInternalDataGetResult](functions/pfplayerdatamanagementservergetuserpublisherinternaldatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerGetUserPublisherInternalDataAsync call. |  
| [PFPlayerDataManagementServerGetUserPublisherInternalDataGetResultSize](functions/pfplayerdatamanagementservergetuserpublisherinternaldatagetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetUserPublisherInternalData call. |  
| [PFPlayerDataManagementServerGetUserPublisherReadOnlyDataAsync](functions/pfplayerdatamanagementservergetuserpublisherreadonlydataasync.md) | Retrieves the publisher-specific custom data for the user which can only be read by the client |  
| [PFPlayerDataManagementServerGetUserPublisherReadOnlyDataGetResult](functions/pfplayerdatamanagementservergetuserpublisherreadonlydatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerGetUserPublisherReadOnlyDataAsync call. |  
| [PFPlayerDataManagementServerGetUserPublisherReadOnlyDataGetResultSize](functions/pfplayerdatamanagementservergetuserpublisherreadonlydatagetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetUserPublisherReadOnlyData call. |  
| [PFPlayerDataManagementServerGetUserReadOnlyDataAsync](functions/pfplayerdatamanagementservergetuserreadonlydataasync.md) | Retrieves the title-specific custom data for the user which can only be read by the client |  
| [PFPlayerDataManagementServerGetUserReadOnlyDataGetResult](functions/pfplayerdatamanagementservergetuserreadonlydatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerGetUserReadOnlyDataAsync call. |  
| [PFPlayerDataManagementServerGetUserReadOnlyDataGetResultSize](functions/pfplayerdatamanagementservergetuserreadonlydatagetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetUserReadOnlyData call. |  
| [PFPlayerDataManagementServerUpdateUserDataAsync](functions/pfplayerdatamanagementserverupdateuserdataasync.md) | Updates the title-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementServerUpdateUserDataGetResult](functions/pfplayerdatamanagementserverupdateuserdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerUpdateUserDataAsync call. |  
| [PFPlayerDataManagementServerUpdateUserInternalDataAsync](functions/pfplayerdatamanagementserverupdateuserinternaldataasync.md) | Updates the title-specific custom data for the user which cannot be accessed by the client |  
| [PFPlayerDataManagementServerUpdateUserInternalDataGetResult](functions/pfplayerdatamanagementserverupdateuserinternaldatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerUpdateUserInternalDataAsync call. |  
| [PFPlayerDataManagementServerUpdateUserPublisherDataAsync](functions/pfplayerdatamanagementserverupdateuserpublisherdataasync.md) | Updates the publisher-specific custom data for the user which is readable and writable by the client |  
| [PFPlayerDataManagementServerUpdateUserPublisherDataGetResult](functions/pfplayerdatamanagementserverupdateuserpublisherdatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerUpdateUserPublisherDataAsync call. |  
| [PFPlayerDataManagementServerUpdateUserPublisherInternalDataAsync](functions/pfplayerdatamanagementserverupdateuserpublisherinternaldataasync.md) | Updates the publisher-specific custom data for the user which cannot be accessed by the client |  
| [PFPlayerDataManagementServerUpdateUserPublisherInternalDataGetResult](functions/pfplayerdatamanagementserverupdateuserpublisherinternaldatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerUpdateUserPublisherInternalDataAsync call. |  
| [PFPlayerDataManagementServerUpdateUserPublisherReadOnlyDataAsync](functions/pfplayerdatamanagementserverupdateuserpublisherreadonlydataasync.md) | Updates the publisher-specific custom data for the user which can only be read by the client |  
| [PFPlayerDataManagementServerUpdateUserPublisherReadOnlyDataGetResult](functions/pfplayerdatamanagementserverupdateuserpublisherreadonlydatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerUpdateUserPublisherReadOnlyDataAsync call. |  
| [PFPlayerDataManagementServerUpdateUserReadOnlyDataAsync](functions/pfplayerdatamanagementserverupdateuserreadonlydataasync.md) | Updates the title-specific custom data for the user which can only be read by the client |  
| [PFPlayerDataManagementServerUpdateUserReadOnlyDataGetResult](functions/pfplayerdatamanagementserverupdateuserreadonlydatagetresult.md) | Gets the result of a successful PFPlayerDataManagementServerUpdateUserReadOnlyDataAsync call. |  
