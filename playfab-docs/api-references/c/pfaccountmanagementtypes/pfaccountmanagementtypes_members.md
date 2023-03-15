---
author: jasonsandlin
title: "Services C API overview - PFAccountManagementTypes.h"
description: "Services C API overview - PFAccountManagementTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# Services C API overview - PFAccountManagementTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFAccountManagementClientUpdateAvatarUrlRequest](structs/pfaccountmanagementclientupdateavatarurlrequest.md) | PFAccountManagementClientUpdateAvatarUrlRequest data model. |  
| [PFAccountManagementGetAccountInfoRequest](structs/pfaccountmanagementgetaccountinforequest.md) | PFAccountManagementGetAccountInfoRequest data model. |  
| [PFAccountManagementGetAccountInfoResult](structs/pfaccountmanagementgetaccountinforesult.md) | PFAccountManagementGetAccountInfoResult data model. This API retrieves details regarding the player in the PlayFab service. Note that when this call is used to retrieve data about another player (not the one signed into the local client), some data, such as Personally Identifying Information (PII), will be omitted for privacy reasons or to comply with the requirements of the platform belongs to. The user account returned will be based on the identifier provided in priority order: PlayFabId, Username, Email, then TitleDisplayName. If no identifier is specified, the currently signed in user's information will be returned. |  
| [PFAccountManagementGetPlayerCombinedInfoRequest](structs/pfaccountmanagementgetplayercombinedinforequest.md) | PFAccountManagementGetPlayerCombinedInfoRequest data model. |  
| [PFAccountManagementGetPlayerCombinedInfoResult](structs/pfaccountmanagementgetplayercombinedinforesult.md) | PFAccountManagementGetPlayerCombinedInfoResult data model. Returns whatever info is requested in the response for the user. If no user is explicitly requested this defaults to the authenticated user. If the user is the same as the requester, PII (like email address, facebook id) is returned if available. Otherwise, only public information is returned. All parameters default to false. |  
| [PFAccountManagementGetPlayerProfileRequest](structs/pfaccountmanagementgetplayerprofilerequest.md) | PFAccountManagementGetPlayerProfileRequest data model. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally. |  
| [PFAccountManagementGetPlayerProfileResult](structs/pfaccountmanagementgetplayerprofileresult.md) | PFAccountManagementGetPlayerProfileResult data model. |  
| [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest](structs/pfaccountmanagementgetplayfabidsfromxboxliveidsrequest.md) | PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest data model. |  
| [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult](structs/pfaccountmanagementgetplayfabidsfromxboxliveidsresult.md) | PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult data model. For XboxLive identifiers which have not been linked to PlayFab accounts, null will be returned. |  
| [PFAccountManagementReportPlayerClientRequest](structs/pfaccountmanagementreportplayerclientrequest.md) | PFAccountManagementReportPlayerClientRequest data model. |  
| [PFAccountManagementReportPlayerClientResult](structs/pfaccountmanagementreportplayerclientresult.md) | PFAccountManagementReportPlayerClientResult data model. Players are currently limited to five reports per day. Attempts by a single user account to submit reports beyond five will result in Updated being returned as false. |  
| [PFAccountManagementXboxLiveAccountPlayFabIdPair](structs/pfaccountmanagementxboxliveaccountplayfabidpair.md) | PFAccountManagementXboxLiveAccountPlayFabIdPair data model. |  
