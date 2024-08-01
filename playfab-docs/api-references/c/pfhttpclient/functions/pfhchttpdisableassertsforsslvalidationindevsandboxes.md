---
author: jasonsandlin
title: "PFHCHttpDisableAssertsForSSLValidationInDevSandboxes"
description: "Disables asserts for SSL validation in console dev sandboxes."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpDisableAssertsForSSLValidationInDevSandboxes  

Disables asserts for SSL validation in console dev sandboxes.  

## Syntax  
  
```cpp
HRESULT PFHCHttpDisableAssertsForSSLValidationInDevSandboxes(  
    PFHCConfigSetting setting  
)  
```  
  
### Parameters  
  
**`setting`** &nbsp; [PFHCConfigSetting](../enums/pfhcconfigsetting.md)  
  
The config settings value to be passed down.  
  
  
### Return value
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
On GDK console, SSL validation is enforced on RETAIL sandboxes regardless of this setting. The asserts will not fire in RETAIL sandbox, and this setting has no affect in RETAIL sandboxes. It is best practice to not call this API, but this can be used as a temporary way to get unblocked while in early stages of game development.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
