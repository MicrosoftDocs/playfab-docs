---
author: jasonsandlin
title: "Services C API overview - PFSegmentsTypes.h"
description: "Services C API overview - PFSegmentsTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# Services C API overview - PFSegmentsTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFSegmentsAddPlayerTagRequest](structs/pfsegmentsaddplayertagrequest.md) | PFSegmentsAddPlayerTagRequest data model. This API will trigger a player_tag_added event and add a tag with the given TagName and PlayFabID to the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. Also there is a limit on the number of tags a title can have. |  
| [PFSegmentsGetAllSegmentsResult](structs/pfsegmentsgetallsegmentsresult.md) | PFSegmentsGetAllSegmentsResult data model. |  
| [PFSegmentsGetPlayerSegmentsResult](structs/pfsegmentsgetplayersegmentsresult.md) | PFSegmentsGetPlayerSegmentsResult data model. |  
| [PFSegmentsGetPlayersSegmentsRequest](structs/pfsegmentsgetplayerssegmentsrequest.md) | PFSegmentsGetPlayersSegmentsRequest data model. |  
| [PFSegmentsGetPlayerTagsRequest](structs/pfsegmentsgetplayertagsrequest.md) | PFSegmentsGetPlayerTagsRequest data model. This API will return a list of canonical tags which includes both namespace and tag's name. If namespace is not provided, the result is a list of all canonical tags. TagName can be used for segmentation and Namespace is limited to 128 characters. |  
| [PFSegmentsGetPlayerTagsResult](structs/pfsegmentsgetplayertagsresult.md) | PFSegmentsGetPlayerTagsResult data model. |  
| [PFSegmentsGetSegmentResult](structs/pfsegmentsgetsegmentresult.md) | PFSegmentsGetSegmentResult data model. |  
| [PFSegmentsRemovePlayerTagRequest](structs/pfsegmentsremoveplayertagrequest.md) | PFSegmentsRemovePlayerTagRequest data model. This API will trigger a player_tag_removed event and remove a tag with the given TagName and PlayFabID from the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. |  
