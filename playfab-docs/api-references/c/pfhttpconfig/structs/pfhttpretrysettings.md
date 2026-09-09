---
author: jasonsandlin
title: "PFHttpRetrySettings"
description: "Struct the defines retry settings for PlayFab HTTP requests."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFHttpRetrySettings  

Struct the defines retry settings for PlayFab HTTP requests.  

## Syntax  
  
```cpp
struct PFHttpRetrySettings {  
    bool allowRetry;  
    uint32_t minimumRetryDelayInSeconds;  
    uint32_t timeoutWindowInSeconds;  
}  
```
  
### Members  
  
**`allowRetry`** &nbsp; bool  
  
Controls whether the SDK should automatically retry select errors. There are certain errors that will never be handled internally and will always be returned directly to the client. Default value is 'true'.
  
**`minimumRetryDelayInSeconds`** &nbsp; uint32_t  
  
The minimum number of seconds the SDK will wait after an HTTP failure before retrying the call. The default and minimum value is 2 seconds.
  
**`timeoutWindowInSeconds`** &nbsp; uint32_t  
  
The maximum number of seconds the SDK will attempt to retry an HTTP request before returning to the client. The default value is 20 seconds.
  
  
## Requirements  
  
**Header:** PFHttpConfig.h
  
## See also  
[PFHttpConfig members](../pfhttpconfig_members.md)  

  
  
