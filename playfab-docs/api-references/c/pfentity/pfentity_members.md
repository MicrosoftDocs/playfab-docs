---
author: jasonsandlin
title: "Services C API overview - PFEntity.h"
description: "Services C API overview - PFEntity.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFEntity.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFEntityCloseHandle](functions/pfentityclosehandle.md) | Closes a PFEntityHandle. |  
| [PFEntityDuplicateHandle](functions/pfentityduplicatehandle.md) | Duplicates a PFEntityHandle. |  
| [PFEntityGetAPIEndpoint](functions/pfentitygetapiendpoint.md) | Gets the API endpoint for the PFServiceConfig associated with an entity handle. |  
| [PFEntityGetAPIEndpointSize](functions/pfentitygetapiendpointsize.md) | Gets the size of the buffer needed to hold the API endpoint string from an entity handle. |  
| [PFEntityGetEntityKey](functions/pfentitygetentitykey.md) | Get the PFEntityKey for an entity. |  
| [PFEntityGetEntityKeySize](functions/pfentitygetentitykeysize.md) | Get the size in bytes needed to store the PFEntityKey for an Entity. |  
| [PFEntityGetEntityTokenAsync](functions/pfentitygetentitytokenasync.md) | Get the cached PFEntityToken for an Entity. |  
| [PFEntityGetEntityTokenResult](functions/pfentitygetentitytokenresult.md) | Gets the result of a successful PFEntityGetEntityTokenAsync call. |  
| [PFEntityGetEntityTokenResultSize](functions/pfentitygetentitytokenresultsize.md) | Get the size in bytes needed to store the result of a PFEntityGetEntityTokenAsync call. |  
| [PFEntityGetSecretKey](functions/pfentitygetsecretkey.md) | Gets the PlayFab secretKey associated with a title Entity. Will fail with E_PF_NOSECRETKEY if there is no Secret Key associated with the provided Entity. |  
| [PFEntityGetSecretKeySize](functions/pfentitygetsecretkeysize.md) | Gets the size of the buffer needed to hold the PlayFab secretKey. Will fail with E_PF_NOSECRETKEY if there is no Secret Key associated with the provided Entity. |  
| [PFEntityIsTitlePlayer](functions/pfentityistitleplayer.md) | Convenience method to check if an Entity is a Title Player. This is equivalent to calling PFEntityGetEntityKey and comparing entityKey.type to PFTitlePlayerEntityType. |  
| [PFEntityRegisterTokenExpiredEventHandler](functions/pfentityregistertokenexpiredeventhandler.md) | Register a handler for EntityToken expired events. |  
| [PFEntityRegisterTokenRefreshedEventHandler](functions/pfentityregistertokenrefreshedeventhandler.md) | Register a handler for EntityToken refreshed events. |  
| [PFEntityTokenExpiredEventHandler](functions/pfentitytokenexpiredeventhandler.md) | EntityToken expired event handler. Needed to reauthenticate players in scenarios where the SDK is unable to automatically refresh the cached EntityToken. |  
| [PFEntityTokenRefreshedEventHandler](functions/pfentitytokenrefreshedeventhandler.md) | A handler invoked every time an Entity is automatically re-authenticated, thus obtaining a new EntityToken. An entity will be automatically re-authenticated prior to its EntityToken expiring. |  
| [PFEntityUnregisterTokenExpiredEventHandler](functions/pfentityunregistertokenexpiredeventhandler.md) | Unregisters a previously registered callback. |  
| [PFEntityUnregisterTokenRefreshedEventHandler](functions/pfentityunregistertokenrefreshedeventhandler.md) | Unregisters a previously registered PFEntityTokenRefreshedCallback. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFEntityToken](structs/pfentitytoken.md) | PlayFab EntityToken and its expiration time. Used to authenticate PlayFab service calls. |  
