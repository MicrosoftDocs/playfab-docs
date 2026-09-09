---
author: jasonsandlin
title: "PFEventsDataConnectionStatusDetails"
description: "PFEventsDataConnectionStatusDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEventsDataConnectionStatusDetails  

PFEventsDataConnectionStatusDetails data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDataConnectionStatusDetails {  
    const char* error;  
    const char* errorMessage;  
    time_t const* mostRecentErrorTime;  
    PFEventsDataConnectionErrorState const* state;  
} PFEventsDataConnectionStatusDetails;  
```
  
### Members  
  
**`error`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the error affecting the data connection, if any.
  
**`errorMessage`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) A description of the error affecting the data connection, if any. This may be empty for some errors.
  
**`mostRecentErrorTime`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The most recent time of the error affecting the data connection, if any.
  
**`state`** &nbsp; [PFEventsDataConnectionErrorState](../enums/pfeventsdataconnectionerrorstate.md) const*  
*may be nullptr*  
  
(Optional) Indicates if the connection is in a normal state or error state.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
