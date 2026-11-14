---
author: jasonsandlin
title: "Services C API overview - PFCore.h"
description: "Functions in PFCore.h that initialize and clean up Microsoft PlayFab Core global state."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/13/2026
---

# Services C API overview - PFCore.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFInitialize](functions/pfinitialize.md) | Initializes PlayFab Core global state on Windows PC, XBOX consoles, Linux, iOS, and macOS. |  
| [PFInitialize (Android)](functions/pfinitialize_2.md) | Android only. Initializes PlayFab Core global state with the Java VM and application context. |  
| [PFUninitializeAsync](functions/pfuninitializeasync.md) | Cleans up PlayFab Core global state asynchronously. |  
