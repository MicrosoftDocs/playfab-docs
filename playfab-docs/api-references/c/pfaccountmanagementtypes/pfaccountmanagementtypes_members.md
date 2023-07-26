---
author: jasonsandlin
title: "Services C API overview - PFAccountManagementTypes.h"
description: "Services C API overview - PFAccountManagementTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# Services C API overview - PFAccountManagementTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFAccountManagementBanInfo](structs/pfaccountmanagementbaninfo.md) | PFAccountManagementBanInfo data model. Contains information for a ban. |  
| [PFAccountManagementBanRequest](structs/pfaccountmanagementbanrequest.md) | PFAccountManagementBanRequest data model. Represents a single ban request. |  
| [PFAccountManagementClientLinkNintendoServiceAccountRequest](structs/pfaccountmanagementclientlinknintendoserviceaccountrequest.md) | PFAccountManagementClientLinkNintendoServiceAccountRequest data model. |  
| [PFAccountManagementClientLinkPSNAccountRequest](structs/pfaccountmanagementclientlinkpsnaccountrequest.md) | PFAccountManagementClientLinkPSNAccountRequest data model. |  
| [PFAccountManagementClientLinkXboxAccountRequest](structs/pfaccountmanagementclientlinkxboxaccountrequest.md) | PFAccountManagementClientLinkXboxAccountRequest data model. |  
| [PFAccountManagementClientUnlinkNintendoServiceAccountRequest](structs/pfaccountmanagementclientunlinknintendoserviceaccountrequest.md) | PFAccountManagementClientUnlinkNintendoServiceAccountRequest data model. |  
| [PFAccountManagementClientUnlinkPSNAccountRequest](structs/pfaccountmanagementclientunlinkpsnaccountrequest.md) | PFAccountManagementClientUnlinkPSNAccountRequest data model. |  
| [PFAccountManagementClientUnlinkXboxAccountRequest](structs/pfaccountmanagementclientunlinkxboxaccountrequest.md) | PFAccountManagementClientUnlinkXboxAccountRequest data model. |  
| [PFAccountManagementClientUpdateAvatarUrlRequest](structs/pfaccountmanagementclientupdateavatarurlrequest.md) | PFAccountManagementClientUpdateAvatarUrlRequest data model. |  
| [PFAccountManagementFacebookInstantGamesPlayFabIdPair](structs/pfaccountmanagementfacebookinstantgamesplayfabidpair.md) | PFAccountManagementFacebookInstantGamesPlayFabIdPair data model. |  
| [PFAccountManagementFacebookPlayFabIdPair](structs/pfaccountmanagementfacebookplayfabidpair.md) | PFAccountManagementFacebookPlayFabIdPair data model. |  
| [PFAccountManagementGameCenterPlayFabIdPair](structs/pfaccountmanagementgamecenterplayfabidpair.md) | PFAccountManagementGameCenterPlayFabIdPair data model. |  
| [PFAccountManagementGetAccountInfoRequest](structs/pfaccountmanagementgetaccountinforequest.md) | PFAccountManagementGetAccountInfoRequest data model. |  
| [PFAccountManagementGetAccountInfoResult](structs/pfaccountmanagementgetaccountinforesult.md) | PFAccountManagementGetAccountInfoResult data model. This API retrieves details regarding the player in the PlayFab service. Note that when this call is used to retrieve data about another player (not the one signed into the local client), some data, such as Personally Identifying Information (PII), will be omitted for privacy reasons or to comply with the requirements of the platform belongs to. The user account returned will be based on the identifier provided in priority order: PlayFabId, Username, Email, then TitleDisplayName. If no identifier is specified, the currently signed in user's information will be returned. |  
| [PFAccountManagementGetPlayerCombinedInfoRequest](structs/pfaccountmanagementgetplayercombinedinforequest.md) | PFAccountManagementGetPlayerCombinedInfoRequest data model. |  
| [PFAccountManagementGetPlayerCombinedInfoResult](structs/pfaccountmanagementgetplayercombinedinforesult.md) | PFAccountManagementGetPlayerCombinedInfoResult data model. Returns whatever info is requested in the response for the user. If no user is explicitly requested this defaults to the authenticated user. If the user is the same as the requester, PII (like email address, facebook id) is returned if available. Otherwise, only public information is returned. All parameters default to false. |  
| [PFAccountManagementGetPlayerProfileRequest](structs/pfaccountmanagementgetplayerprofilerequest.md) | PFAccountManagementGetPlayerProfileRequest data model. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally. |  
| [PFAccountManagementGetPlayerProfileResult](structs/pfaccountmanagementgetplayerprofileresult.md) | PFAccountManagementGetPlayerProfileResult data model. |  
| [PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest](structs/pfaccountmanagementgetplayfabidsfromnintendoserviceaccountidsrequest.md) | PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest data model. |  
| [PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult](structs/pfaccountmanagementgetplayfabidsfromnintendoserviceaccountidsresult.md) | PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult data model. For Nintendo Service Account identifiers which have not been linked to PlayFab accounts, null will be returned. |  
| [PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest](structs/pfaccountmanagementgetplayfabidsfrompsnaccountidsrequest.md) | PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest data model. |  
| [PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult](structs/pfaccountmanagementgetplayfabidsfrompsnaccountidsresult.md) | PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult data model. For PlayStation :tm: Network identifiers which have not been linked to PlayFab accounts, null will be returned. |  
| [PFAccountManagementGetPlayFabIDsFromSteamIDsRequest](structs/pfaccountmanagementgetplayfabidsfromsteamidsrequest.md) | PFAccountManagementGetPlayFabIDsFromSteamIDsRequest data model. |  
| [PFAccountManagementGetPlayFabIDsFromSteamIDsResult](structs/pfaccountmanagementgetplayfabidsfromsteamidsresult.md) | PFAccountManagementGetPlayFabIDsFromSteamIDsResult data model. For Steam identifiers which have not been linked to PlayFab accounts, null will be returned. |  
| [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest](structs/pfaccountmanagementgetplayfabidsfromxboxliveidsrequest.md) | PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest data model. |  
| [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult](structs/pfaccountmanagementgetplayfabidsfromxboxliveidsresult.md) | PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult data model. For XboxLive identifiers which have not been linked to PlayFab accounts, null will be returned. |  
| [PFAccountManagementGetTitlePlayersFromProviderIDsResponse](structs/pfaccountmanagementgettitleplayersfromprovideridsresponse.md) | PFAccountManagementGetTitlePlayersFromProviderIDsResponse data model. |  
| [PFAccountManagementGooglePlayFabIdPair](structs/pfaccountmanagementgoogleplayfabidpair.md) | PFAccountManagementGooglePlayFabIdPair data model. |  
| [PFAccountManagementGooglePlayGamesPlayFabIdPair](structs/pfaccountmanagementgoogleplaygamesplayfabidpair.md) | PFAccountManagementGooglePlayGamesPlayFabIdPair data model. |  
| [PFAccountManagementKongregatePlayFabIdPair](structs/pfaccountmanagementkongregateplayfabidpair.md) | PFAccountManagementKongregatePlayFabIdPair data model. |  
| [PFAccountManagementLinkCustomIDRequest](structs/pfaccountmanagementlinkcustomidrequest.md) | PFAccountManagementLinkCustomIDRequest data model. |  
| [PFAccountManagementLinkKongregateAccountRequest](structs/pfaccountmanagementlinkkongregateaccountrequest.md) | PFAccountManagementLinkKongregateAccountRequest data model. |  
| [PFAccountManagementLinkOpenIdConnectRequest](structs/pfaccountmanagementlinkopenidconnectrequest.md) | PFAccountManagementLinkOpenIdConnectRequest data model. |  
| [PFAccountManagementLinkSteamAccountRequest](structs/pfaccountmanagementlinksteamaccountrequest.md) | PFAccountManagementLinkSteamAccountRequest data model. Steam authentication is accomplished with the Steam Session Ticket. More information on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth (requires sign-in). NOTE: For Steam authentication to work, the title must be configured with the Steam Application ID and Publisher Key in the PlayFab Game Manager (under Properties). Information on creating a Publisher Key (referred to as the Secret Key in PlayFab) for your title can be found here: https://partner.steamgames.com/documentation/webapi#publisherkey. |  
| [PFAccountManagementLinkTwitchAccountRequest](structs/pfaccountmanagementlinktwitchaccountrequest.md) | PFAccountManagementLinkTwitchAccountRequest data model. |  
| [PFAccountManagementNintendoServiceAccountPlayFabIdPair](structs/pfaccountmanagementnintendoserviceaccountplayfabidpair.md) | PFAccountManagementNintendoServiceAccountPlayFabIdPair data model. |  
| [PFAccountManagementNintendoSwitchPlayFabIdPair](structs/pfaccountmanagementnintendoswitchplayfabidpair.md) | PFAccountManagementNintendoSwitchPlayFabIdPair data model. |  
| [PFAccountManagementPSNAccountPlayFabIdPair](structs/pfaccountmanagementpsnaccountplayfabidpair.md) | PFAccountManagementPSNAccountPlayFabIdPair data model. |  
| [PFAccountManagementReportPlayerClientRequest](structs/pfaccountmanagementreportplayerclientrequest.md) | PFAccountManagementReportPlayerClientRequest data model. |  
| [PFAccountManagementReportPlayerClientResult](structs/pfaccountmanagementreportplayerclientresult.md) | PFAccountManagementReportPlayerClientResult data model. Players are currently limited to five reports per day. Attempts by a single user account to submit reports beyond five will result in Updated being returned as false. |  
| [PFAccountManagementServerCustomIDPlayFabIDPair](structs/pfaccountmanagementservercustomidplayfabidpair.md) | PFAccountManagementServerCustomIDPlayFabIDPair data model. |  
| [PFAccountManagementSteamPlayFabIdPair](structs/pfaccountmanagementsteamplayfabidpair.md) | PFAccountManagementSteamPlayFabIdPair data model. |  
| [PFAccountManagementTwitchPlayFabIdPair](structs/pfaccountmanagementtwitchplayfabidpair.md) | PFAccountManagementTwitchPlayFabIdPair data model. |  
| [PFAccountManagementUnlinkCustomIDRequest](structs/pfaccountmanagementunlinkcustomidrequest.md) | PFAccountManagementUnlinkCustomIDRequest data model. |  
| [PFAccountManagementUnlinkKongregateAccountRequest](structs/pfaccountmanagementunlinkkongregateaccountrequest.md) | PFAccountManagementUnlinkKongregateAccountRequest data model. |  
| [PFAccountManagementUnlinkOpenIdConnectRequest](structs/pfaccountmanagementunlinkopenidconnectrequest.md) | PFAccountManagementUnlinkOpenIdConnectRequest data model. |  
| [PFAccountManagementUnlinkSteamAccountRequest](structs/pfaccountmanagementunlinksteamaccountrequest.md) | PFAccountManagementUnlinkSteamAccountRequest data model. |  
| [PFAccountManagementUnlinkTwitchAccountRequest](structs/pfaccountmanagementunlinktwitchaccountrequest.md) | PFAccountManagementUnlinkTwitchAccountRequest data model. |  
| [PFAccountManagementUpdateBanRequest](structs/pfaccountmanagementupdatebanrequest.md) | PFAccountManagementUpdateBanRequest data model. Represents a single update ban request. |  
| [PFAccountManagementXboxLiveAccountPlayFabIdPair](structs/pfaccountmanagementxboxliveaccountplayfabidpair.md) | PFAccountManagementXboxLiveAccountPlayFabIdPair data model. |  
