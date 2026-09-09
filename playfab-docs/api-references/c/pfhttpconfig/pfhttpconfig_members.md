---
author: jasonsandlin
title: "Services C API overview - PFHttpConfig.h"
description: "Services C API overview - PFHttpConfig.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# Services C API overview - PFHttpConfig.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFGetHttpRetrySettings](functions/pfgethttpretrysettings.md) | Gets the current HTTP retry settings for the SDK. |  
| [PFGetHttpSettings](functions/pfgethttpsettings.md) | Gets the current generic HTTP settings for the SDK. |  
| [PFSetHttpRetrySettings](functions/pfsethttpretrysettings.md) | Sets global HTTP retry settings for the SDK. |  
| [PFSetHttpSettings](functions/pfsethttpsettings.md) | Sets global generic HTTP settings for the SDK. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFHttpRetrySettings](structs/pfhttpretrysettings.md) | Struct the defines retry settings for PlayFab HTTP requests. |  
| [PFHttpSettings](structs/pfhttpsettings.md) | Struct that defines generic Http settings for PlayFab HTTP requests. Currently holds settings to enable gzip compression on all sdk responses. |  
