---
author: jasonsandlin
title: "Services C API overview - PFAuthenticationTypes.h"
description: "Services C API overview - PFAuthenticationTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 09/25/2023
---

# Services C API overview - PFAuthenticationTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFAuthenticationAuthenticateCustomIdRequest](structs/pfauthenticationauthenticatecustomidrequest.md) | PFAuthenticationAuthenticateCustomIdRequest data model. Create or return a game_server entity token. Caller must be a title entity. |  
| [PFAuthenticationAuthenticateCustomIdResult](structs/pfauthenticationauthenticatecustomidresult.md) | PFAuthenticationAuthenticateCustomIdResult data model. |  
| [PFAuthenticationDeleteRequest](structs/pfauthenticationdeleterequest.md) | PFAuthenticationDeleteRequest data model. Delete a game_server entity. The caller can be the game_server entity attempting to delete itself. Or a title entity attempting to delete game_server entities for this title. |  
| [PFAuthenticationEntityTokenResponse](structs/pfauthenticationentitytokenresponse.md) | PFAuthenticationEntityTokenResponse data model. |  
| [PFAuthenticationGetEntityRequest](structs/pfauthenticationgetentityrequest.md) | PFAuthenticationGetEntityRequest data model. This API must be called with X-SecretKey, X-Authentication or X-EntityToken headers. An optional EntityKey may be included to attempt to set the resulting EntityToken to a specific entity, however the entity must be a relation of the caller, such as the master_player_account of a character. If sending X-EntityToken the account will be marked as freshly logged in and will issue a new token. If using X-Authentication or X-EntityToken the header must still be valid and cannot be expired or revoked. |  
| [PFAuthenticationLoginResult](structs/pfauthenticationloginresult.md) | PFAuthenticationLoginResult data model. |  
| [PFAuthenticationLoginWithCustomIDRequest](structs/pfauthenticationloginwithcustomidrequest.md) | PFAuthenticationLoginWithCustomIDRequest data model. It is highly recommended that developers ensure that it is extremely unlikely that a customer could generate an ID which is already in use by another customer. If this is the first time a user has signed in with the Custom ID and CreateAccount is set to true, a new PlayFab account will be created and linked to the Custom ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Custom ID, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. |  
| [PFAuthenticationLoginWithNintendoServiceAccountRequest](structs/pfauthenticationloginwithnintendoserviceaccountrequest.md) | PFAuthenticationLoginWithNintendoServiceAccountRequest data model. |  
| [PFAuthenticationLoginWithOpenIdConnectRequest](structs/pfauthenticationloginwithopenidconnectrequest.md) | PFAuthenticationLoginWithOpenIdConnectRequest data model. |  
| [PFAuthenticationLoginWithPSNRequest](structs/pfauthenticationloginwithpsnrequest.md) | PFAuthenticationLoginWithPSNRequest data model. If this is the first time a user has signed in with the PlayStation :tm: Network account and CreateAccount is set to true, a new PlayFab account will be created and linked to the PlayStation :tm: Network account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the PlayStation :tm: Network account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. |  
| [PFAuthenticationLoginWithServerCustomIdRequest](structs/pfauthenticationloginwithservercustomidrequest.md) | PFAuthenticationLoginWithServerCustomIdRequest data model. |  
| [PFAuthenticationLoginWithSteamIdRequest](structs/pfauthenticationloginwithsteamidrequest.md) | PFAuthenticationLoginWithSteamIdRequest data model. If this is the first time a user has signed in with the Steam ID and CreateAccount is set to true, a new PlayFab account will be created and linked to the Steam account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Steam users that are not logged into the Steam Client app will only have their Steam username synced, other data, such as currency and country will not be available until they login while the Client is open. |  
| [PFAuthenticationLoginWithSteamRequest](structs/pfauthenticationloginwithsteamrequest.md) | PFAuthenticationLoginWithSteamRequest data model. Steam sign-in is accomplished with the Steam Session Ticket. More information on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth. NOTE: For Steam authentication to work, the title must be configured with the Steam Application ID and Web API Key in the PlayFab Game Manager (under Steam in the Add-ons Marketplace). You can obtain a Web API Key from the Permissions page of any Group associated with your App ID in the Steamworks site. If this is the first time a user has signed in with the Steam account and CreateAccount is set to true, a new PlayFab account will be created and linked to the provided account's Steam ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. |  
| [PFAuthenticationLoginWithXboxIdRequest](structs/pfauthenticationloginwithxboxidrequest.md) | PFAuthenticationLoginWithXboxIdRequest data model. If this is the first time a user has signed in with the Xbox ID and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. |  
| [PFAuthenticationLoginWithXboxRequest](structs/pfauthenticationloginwithxboxrequest.md) | PFAuthenticationLoginWithXboxRequest data model. If this is the first time a user has signed in with the Xbox Live account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. |  
| [PFAuthenticationLoginWithXUserRequest](structs/pfauthenticationloginwithxuserrequest.md) | PFAuthenticationLoginWithXUserRequest data model. If this is the first time a user has signed in with the Xbox Live account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Request object for PFAuthenticationLoginWithXUserAsync. |  
| [PFAuthenticationServerLoginWithXboxRequest](structs/pfauthenticationserverloginwithxboxrequest.md) | PFAuthenticationServerLoginWithXboxRequest data model. If this is the first time a user has signed in with the Xbox Live account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. |  
| [PFAuthenticationUserSettings](structs/pfauthenticationusersettings.md) | PFAuthenticationUserSettings data model. |  
| [PFAuthenticationValidateEntityTokenRequest](structs/pfauthenticationvalidateentitytokenrequest.md) | PFAuthenticationValidateEntityTokenRequest data model. Given an entity token, validates that it hasn't expired or been revoked and will return details of the owner. |  
| [PFAuthenticationValidateEntityTokenResponse](structs/pfauthenticationvalidateentitytokenresponse.md) | PFAuthenticationValidateEntityTokenResponse data model. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFAuthenticationIdentifiedDeviceType](enums/pfauthenticationidentifieddevicetype.md) | IdentifiedDeviceType enum.|  
