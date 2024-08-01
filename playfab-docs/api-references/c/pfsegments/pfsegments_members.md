---
author: jasonsandlin
title: "Services C API overview - PFSegments.h"
description: "Services C API overview - PFSegments.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFSegments.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFSegmentsClientGetPlayerSegmentsAsync](functions/pfsegmentsclientgetplayersegmentsasync.md) | List all segments that a player currently belongs to at this moment in time. |  
| [PFSegmentsClientGetPlayerSegmentsGetResult](functions/pfsegmentsclientgetplayersegmentsgetresult.md) | Gets the result of a successful PFSegmentsClientGetPlayerSegmentsAsync call. |  
| [PFSegmentsClientGetPlayerSegmentsGetResultSize](functions/pfsegmentsclientgetplayersegmentsgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayerSegments call. |  
| [PFSegmentsClientGetPlayerTagsAsync](functions/pfsegmentsclientgetplayertagsasync.md) | Get all tags with a given Namespace (optional) from a player profile. |  
| [PFSegmentsClientGetPlayerTagsGetResult](functions/pfsegmentsclientgetplayertagsgetresult.md) | Gets the result of a successful PFSegmentsClientGetPlayerTagsAsync call. |  
| [PFSegmentsClientGetPlayerTagsGetResultSize](functions/pfsegmentsclientgetplayertagsgetresultsize.md) | Get the size in bytes needed to store the result of a ClientGetPlayerTags call. |  
| [PFSegmentsServerAddPlayerTagAsync](functions/pfsegmentsserveraddplayertagasync.md) | Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag. |  
| [PFSegmentsServerGetAllSegmentsAsync](functions/pfsegmentsservergetallsegmentsasync.md) | Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change. |  
| [PFSegmentsServerGetAllSegmentsGetResult](functions/pfsegmentsservergetallsegmentsgetresult.md) | Gets the result of a successful PFSegmentsServerGetAllSegmentsAsync call. |  
| [PFSegmentsServerGetAllSegmentsGetResultSize](functions/pfsegmentsservergetallsegmentsgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetAllSegments call. |  
| [PFSegmentsServerGetPlayerSegmentsAsync](functions/pfsegmentsservergetplayersegmentsasync.md) | List all segments that a player currently belongs to at this moment in time. |  
| [PFSegmentsServerGetPlayerSegmentsGetResult](functions/pfsegmentsservergetplayersegmentsgetresult.md) | Gets the result of a successful PFSegmentsServerGetPlayerSegmentsAsync call. |  
| [PFSegmentsServerGetPlayerSegmentsGetResultSize](functions/pfsegmentsservergetplayersegmentsgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetPlayerSegments call. |  
| [PFSegmentsServerGetPlayersInSegmentAsync](functions/pfsegmentsservergetplayersinsegmentasync.md) | Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected in the results. AB Test segments are currently not supported by this operation. NOTE: This API is limited to being called 30 times in one minute. You will be returned an error if you exceed this threshold. |  
| [PFSegmentsServerGetPlayersInSegmentGetResult](functions/pfsegmentsservergetplayersinsegmentgetresult.md) | Gets the result of a successful PFSegmentsServerGetPlayersInSegmentAsync call. |  
| [PFSegmentsServerGetPlayersInSegmentGetResultSize](functions/pfsegmentsservergetplayersinsegmentgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetPlayersInSegment call. |  
| [PFSegmentsServerGetPlayerTagsAsync](functions/pfsegmentsservergetplayertagsasync.md) | Get all tags with a given Namespace (optional) from a player profile. |  
| [PFSegmentsServerGetPlayerTagsGetResult](functions/pfsegmentsservergetplayertagsgetresult.md) | Gets the result of a successful PFSegmentsServerGetPlayerTagsAsync call. |  
| [PFSegmentsServerGetPlayerTagsGetResultSize](functions/pfsegmentsservergetplayertagsgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetPlayerTags call. |  
| [PFSegmentsServerRemovePlayerTagAsync](functions/pfsegmentsserverremoveplayertagasync.md) | Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag. |  
