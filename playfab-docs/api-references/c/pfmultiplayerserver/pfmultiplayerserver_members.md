---
author: jasonsandlin
title: "Services C API overview - PFMultiplayerServer.h"
description: "Services C API overview - PFMultiplayerServer.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFMultiplayerServer.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMultiplayerServerListBuildAliasesAsync](functions/pfmultiplayerserverlistbuildaliasesasync.md) | Lists details of all build aliases for a title. Accepts tokens for title and if game client access is enabled, allows game client to request list of builds with player entity token. |  
| [PFMultiplayerServerListBuildAliasesGetResult](functions/pfmultiplayerserverlistbuildaliasesgetresult.md) | Gets the result of a successful PFMultiplayerServerListBuildAliasesAsync call. |  
| [PFMultiplayerServerListBuildAliasesGetResultSize](functions/pfmultiplayerserverlistbuildaliasesgetresultsize.md) | Get the size in bytes needed to store the result of a ListBuildAliases call. |  
| [PFMultiplayerServerListBuildSummariesV2Async](functions/pfmultiplayerserverlistbuildsummariesv2async.md) | Lists summarized details of all multiplayer server builds for a title. Accepts tokens for title and if game client access is enabled, allows game client to request list of builds with player entity token. |  
| [PFMultiplayerServerListBuildSummariesV2GetResult](functions/pfmultiplayerserverlistbuildsummariesv2getresult.md) | Gets the result of a successful PFMultiplayerServerListBuildSummariesV2Async call. |  
| [PFMultiplayerServerListBuildSummariesV2GetResultSize](functions/pfmultiplayerserverlistbuildsummariesv2getresultsize.md) | Get the size in bytes needed to store the result of a ListBuildSummariesV2 call. |  
| [PFMultiplayerServerListQosServersForTitleAsync](functions/pfmultiplayerserverlistqosserversfortitleasync.md) | Lists quality of service servers for the title. By default, servers are only returned for regions where a Multiplayer Servers build has been deployed. |  
| [PFMultiplayerServerListQosServersForTitleGetResult](functions/pfmultiplayerserverlistqosserversfortitlegetresult.md) | Gets the result of a successful PFMultiplayerServerListQosServersForTitleAsync call. |  
| [PFMultiplayerServerListQosServersForTitleGetResultSize](functions/pfmultiplayerserverlistqosserversfortitlegetresultsize.md) | Get the size in bytes needed to store the result of a ListQosServersForTitle call. |  
| [PFMultiplayerServerRequestMultiplayerServerAsync](functions/pfmultiplayerserverrequestmultiplayerserverasync.md) | Request a multiplayer server session. Accepts tokens for title and if game client access is enabled, allows game client to request a server with player entity token. |  
| [PFMultiplayerServerRequestMultiplayerServerGetResult](functions/pfmultiplayerserverrequestmultiplayerservergetresult.md) | Gets the result of a successful PFMultiplayerServerRequestMultiplayerServerAsync call. |  
| [PFMultiplayerServerRequestMultiplayerServerGetResultSize](functions/pfmultiplayerserverrequestmultiplayerservergetresultsize.md) | Get the size in bytes needed to store the result of a RequestMultiplayerServer call. |  
