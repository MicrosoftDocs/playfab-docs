---
author: jasonsandlin
title: "Services C API overview - PFSegments.h"
description: "Services C API overview - PFSegments.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
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
| [PFSegmentsServerGetAllSegmentsAsync](functions/pfsegmentsservergetallsegmentsasync.md) | Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as ExportPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change. |  
| [PFSegmentsServerGetAllSegmentsGetResult](functions/pfsegmentsservergetallsegmentsgetresult.md) | Gets the result of a successful PFSegmentsServerGetAllSegmentsAsync call. |  
| [PFSegmentsServerGetAllSegmentsGetResultSize](functions/pfsegmentsservergetallsegmentsgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetAllSegments call. |  
| [PFSegmentsServerGetPlayerSegmentsAsync](functions/pfsegmentsservergetplayersegmentsasync.md) | List all segments that a player currently belongs to at this moment in time. |  
| [PFSegmentsServerGetPlayerSegmentsGetResult](functions/pfsegmentsservergetplayersegmentsgetresult.md) | Gets the result of a successful PFSegmentsServerGetPlayerSegmentsAsync call. |  
| [PFSegmentsServerGetPlayerSegmentsGetResultSize](functions/pfsegmentsservergetplayersegmentsgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetPlayerSegments call. |  
| [PFSegmentsServerGetPlayerTagsAsync](functions/pfsegmentsservergetplayertagsasync.md) | Get all tags with a given Namespace (optional) from a player profile. |  
| [PFSegmentsServerGetPlayerTagsGetResult](functions/pfsegmentsservergetplayertagsgetresult.md) | Gets the result of a successful PFSegmentsServerGetPlayerTagsAsync call. |  
| [PFSegmentsServerGetPlayerTagsGetResultSize](functions/pfsegmentsservergetplayertagsgetresultsize.md) | Get the size in bytes needed to store the result of a ServerGetPlayerTags call. |  
| [PFSegmentsServerRemovePlayerTagAsync](functions/pfsegmentsserverremoveplayertagasync.md) | Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag. |  
