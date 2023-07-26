---
author: jasonsandlin
title: "Services C API overview - PFAccountManagement.h"
description: "Services C API overview - PFAccountManagement.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# Services C API overview - PFAccountManagement.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFAccountManagementClientGetAccountInfoAsync](functions/pfaccountmanagementclientgetaccountinfoasync.md) | Retrieves the user's PlayFab account details |  
| [PFAccountManagementClientGetAccountInfoGetResult](functions/pfaccountmanagementclientgetaccountinfogetresult.md) | Gets the result of a successful PFAccountManagementClientGetAccountInfoAsync call. |  
| [PFAccountManagementClientGetAccountInfoGetResultSize](functions/pfaccountmanagementclientgetaccountinfogetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetAccountInfo call. |  
| [PFAccountManagementClientGetPlayerCombinedInfoAsync](functions/pfaccountmanagementclientgetplayercombinedinfoasync.md) | Retrieves all of the user's different kinds of info. |  
| [PFAccountManagementClientGetPlayerCombinedInfoGetResult](functions/pfaccountmanagementclientgetplayercombinedinfogetresult.md) | Gets the result of a successful PFAccountManagementClientGetPlayerCombinedInfoAsync call. |  
| [PFAccountManagementClientGetPlayerCombinedInfoGetResultSize](functions/pfaccountmanagementclientgetplayercombinedinfogetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayerCombinedInfo call. |  
| [PFAccountManagementClientGetPlayerProfileAsync](functions/pfaccountmanagementclientgetplayerprofileasync.md) | Retrieves the player's profile |  
| [PFAccountManagementClientGetPlayerProfileGetResult](functions/pfaccountmanagementclientgetplayerprofilegetresult.md) | Gets the result of a successful PFAccountManagementClientGetPlayerProfileAsync call. |  
| [PFAccountManagementClientGetPlayerProfileGetResultSize](functions/pfaccountmanagementclientgetplayerprofilegetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayerProfile call. |  
| [PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsAsync](functions/pfaccountmanagementclientgetplayfabidsfromnintendoserviceaccountidsasync.md) | Retrieves the unique PlayFab identifiers for the given set of Nintendo Service Account identifiers. |  
| [PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsGetResult](functions/pfaccountmanagementclientgetplayfabidsfromnintendoserviceaccountidsgetresult.md) | Gets the result of a successful PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsAsync call. |  
| [PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsGetResultSize](functions/pfaccountmanagementclientgetplayfabidsfromnintendoserviceaccountidsgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayFabIDsFromNintendoServiceAccountIds call. |  
| [PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsAsync](functions/pfaccountmanagementclientgetplayfabidsfrompsnaccountidsasync.md) | Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers. |  
| [PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsGetResult](functions/pfaccountmanagementclientgetplayfabidsfrompsnaccountidsgetresult.md) | Gets the result of a successful PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsAsync call. |  
| [PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsGetResultSize](functions/pfaccountmanagementclientgetplayfabidsfrompsnaccountidsgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayFabIDsFromPSNAccountIDs call. |  
| [PFAccountManagementClientGetPlayFabIDsFromSteamIDsAsync](functions/pfaccountmanagementclientgetplayfabidsfromsteamidsasync.md) | Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls. |  
| [PFAccountManagementClientGetPlayFabIDsFromSteamIDsGetResult](functions/pfaccountmanagementclientgetplayfabidsfromsteamidsgetresult.md) | Gets the result of a successful PFAccountManagementClientGetPlayFabIDsFromSteamIDsAsync call. |  
| [PFAccountManagementClientGetPlayFabIDsFromSteamIDsGetResultSize](functions/pfaccountmanagementclientgetplayfabidsfromsteamidsgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayFabIDsFromSteamIDs call. |  
| [PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync](functions/pfaccountmanagementclientgetplayfabidsfromxboxliveidsasync.md) | Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers. |  
| [PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsGetResult](functions/pfaccountmanagementclientgetplayfabidsfromxboxliveidsgetresult.md) | Gets the result of a successful PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync call. |  
| [PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsGetResultSize](functions/pfaccountmanagementclientgetplayfabidsfromxboxliveidsgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayFabIDsFromXboxLiveIDs call. |  
| [PFAccountManagementClientLinkCustomIDAsync](functions/pfaccountmanagementclientlinkcustomidasync.md) | Links the custom identifier, generated by the title, to the user's PlayFab account |  
| [PFAccountManagementClientLinkNintendoServiceAccountAsync](functions/pfaccountmanagementclientlinknintendoserviceaccountasync.md) | Links the Nintendo account associated with the token to the user's PlayFab account. |  
| [PFAccountManagementClientLinkOpenIdConnectAsync](functions/pfaccountmanagementclientlinkopenidconnectasync.md) | Links an OpenID Connect account to a user's PlayFab account, based on an existing relationship between a title and an Open ID Connect provider and the OpenId Connect JWT from that provider. |  
| [PFAccountManagementClientLinkPSNAccountAsync](functions/pfaccountmanagementclientlinkpsnaccountasync.md) | Links the PlayStation :tm: Network account associated with the provided access code to the user's PlayFab account |  
| [PFAccountManagementClientLinkSteamAccountAsync](functions/pfaccountmanagementclientlinksteamaccountasync.md) | Links the Steam account associated with the provided Steam authentication ticket to the user's PlayFab account |  
| [PFAccountManagementClientLinkXboxAccountAsync](functions/pfaccountmanagementclientlinkxboxaccountasync.md) | Links the Xbox Live account associated with the provided access code to the user's PlayFab account |  
| [PFAccountManagementClientReportPlayerAsync](functions/pfaccountmanagementclientreportplayerasync.md) | Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title can take action concerning potentially toxic players. |  
| [PFAccountManagementClientReportPlayerGetResult](functions/pfaccountmanagementclientreportplayergetresult.md) | Gets the result of a successful PFAccountManagementClientReportPlayerAsync call. |  
| [PFAccountManagementClientUnlinkCustomIDAsync](functions/pfaccountmanagementclientunlinkcustomidasync.md) | Unlinks the related custom identifier from the user's PlayFab account |  
| [PFAccountManagementClientUnlinkNintendoServiceAccountAsync](functions/pfaccountmanagementclientunlinknintendoserviceaccountasync.md) | Unlinks the related Nintendo account from the user's PlayFab account. |  
| [PFAccountManagementClientUnlinkOpenIdConnectAsync](functions/pfaccountmanagementclientunlinkopenidconnectasync.md) | Unlinks an OpenID Connect account from a user's PlayFab account, based on the connection ID of an existing relationship between a title and an Open ID Connect provider. |  
| [PFAccountManagementClientUnlinkPSNAccountAsync](functions/pfaccountmanagementclientunlinkpsnaccountasync.md) | Unlinks the related PlayStation :tm: Network account from the user's PlayFab account |  
| [PFAccountManagementClientUnlinkSteamAccountAsync](functions/pfaccountmanagementclientunlinksteamaccountasync.md) | Unlinks the related Steam account from the user's PlayFab account |  
| [PFAccountManagementClientUnlinkXboxAccountAsync](functions/pfaccountmanagementclientunlinkxboxaccountasync.md) | Unlinks the related Xbox Live account from the user's PlayFab account |  
| [PFAccountManagementClientUpdateAvatarUrlAsync](functions/pfaccountmanagementclientupdateavatarurlasync.md) | Update the avatar URL of the player |  
