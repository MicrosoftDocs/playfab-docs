---
author: jasonsandlin
title: "Services C API overview - PFSegmentsTypes.h"
description: "Services C API overview - PFSegmentsTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFSegmentsTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFSegmentsAdCampaignAttribution](structs/pfsegmentsadcampaignattribution.md) | PFSegmentsAdCampaignAttribution data model. |  
| [PFSegmentsAddPlayerTagRequest](structs/pfsegmentsaddplayertagrequest.md) | PFSegmentsAddPlayerTagRequest data model. This API will trigger a player_tag_added event and add a tag with the given TagName and PlayFabID to the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. Also there is a limit on the number of tags a title can have. |  
| [PFSegmentsContactEmailInfo](structs/pfsegmentscontactemailinfo.md) | PFSegmentsContactEmailInfo data model. |  
| [PFSegmentsGetAllSegmentsResult](structs/pfsegmentsgetallsegmentsresult.md) | PFSegmentsGetAllSegmentsResult data model. |  
| [PFSegmentsGetPlayerSegmentsResult](structs/pfsegmentsgetplayersegmentsresult.md) | PFSegmentsGetPlayerSegmentsResult data model. |  
| [PFSegmentsGetPlayersInSegmentRequest](structs/pfsegmentsgetplayersinsegmentrequest.md) | PFSegmentsGetPlayersInSegmentRequest data model. Initial request must contain at least a Segment ID. Subsequent requests must contain the Segment ID as well as the Continuation Token. Failure to send the Continuation Token will result in a new player segment list being generated. Each time the Continuation Token is passed in the length of the Total Seconds to Live is refreshed. If too much time passes between requests to the point that a subsequent request is past the Total Seconds to Live an error will be returned and paging will be terminated. This API is resource intensive and should not be used in scenarios which might generate high request volumes. Only one request to this API at a time should be made per title. Concurrent requests to the API may be rejected with the APIConcurrentRequestLimitExceeded error. |  
| [PFSegmentsGetPlayersInSegmentResult](structs/pfsegmentsgetplayersinsegmentresult.md) | PFSegmentsGetPlayersInSegmentResult data model. |  
| [PFSegmentsGetPlayersSegmentsRequest](structs/pfsegmentsgetplayerssegmentsrequest.md) | PFSegmentsGetPlayersSegmentsRequest data model. |  
| [PFSegmentsGetPlayerTagsRequest](structs/pfsegmentsgetplayertagsrequest.md) | PFSegmentsGetPlayerTagsRequest data model. This API will return a list of canonical tags which includes both namespace and tag's name. If namespace is not provided, the result is a list of all canonical tags. TagName can be used for segmentation and Namespace is limited to 128 characters. |  
| [PFSegmentsGetPlayerTagsResult](structs/pfsegmentsgetplayertagsresult.md) | PFSegmentsGetPlayerTagsResult data model. |  
| [PFSegmentsGetSegmentResult](structs/pfsegmentsgetsegmentresult.md) | PFSegmentsGetSegmentResult data model. |  
| [PFSegmentsPlayerLinkedAccount](structs/pfsegmentsplayerlinkedaccount.md) | PFSegmentsPlayerLinkedAccount data model. |  
| [PFSegmentsPlayerLocation](structs/pfsegmentsplayerlocation.md) | PFSegmentsPlayerLocation data model. |  
| [PFSegmentsPlayerLocationDictionaryEntry](structs/pfsegmentsplayerlocationdictionaryentry.md) | Dictionary entry for an associative array with PFSegmentsPlayerLocation values. |  
| [PFSegmentsPlayerProfile](structs/pfsegmentsplayerprofile.md) | PFSegmentsPlayerProfile data model. |  
| [PFSegmentsPlayerStatistic](structs/pfsegmentsplayerstatistic.md) | PFSegmentsPlayerStatistic data model. |  
| [PFSegmentsPushNotificationRegistration](structs/pfsegmentspushnotificationregistration.md) | PFSegmentsPushNotificationRegistration data model. |  
| [PFSegmentsRemovePlayerTagRequest](structs/pfsegmentsremoveplayertagrequest.md) | PFSegmentsRemovePlayerTagRequest data model. This API will trigger a player_tag_removed event and remove a tag with the given TagName and PlayFabID from the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFSegmentsChurnRiskLevel](enums/pfsegmentschurnrisklevel.md) | ChurnRiskLevel enum.|  
