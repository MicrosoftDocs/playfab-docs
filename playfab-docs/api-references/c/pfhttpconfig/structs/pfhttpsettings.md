---
author: jasonsandlin
title: "PFHttpSettings"
description: "Struct that defines generic Http settings for PlayFab HTTP requests. Currently holds settings to enable gzip compression on all sdk responses."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFHttpSettings  

Struct that defines generic Http settings for PlayFab HTTP requests. Currently holds settings to enable gzip compression on all sdk responses.  

## Syntax  
  
```cpp
struct PFHttpSettings {  
    bool requestResponseCompression;  
}  
```
  
### Members  
  
**`requestResponseCompression`** &nbsp; bool  
  
Controls whether the SDK currently requests that incoming responses be compressed. Response compression is enabled by specifying the Accept-Encoding Header as "application/gzip". In order to decompress a compressed response provided by an API endpoint HCHttpCallResponseSetGzipCompressed must be called prior to calling HCHttpCallPerformAsync.
  
  
## Requirements  
  
**Header:** PFHttpConfig.h
  
## See also  
[PFHttpConfig members](../pfhttpconfig_members.md)  

  
  
