---
author: jasonsandlin
title: "PFEventsDataConnectionDetails"
description: "PFEventsDataConnectionDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEventsDataConnectionDetails  

PFEventsDataConnectionDetails data model.  

## Syntax  
  
```cpp
typedef struct PFEventsDataConnectionDetails {  
    PFEventsDataConnectionSettings const* connectionSettings;  
    bool isActive;  
    const char* name;  
    PFEventsDataConnectionStatusDetails const* status;  
    PFEventsDataConnectionType type;  
} PFEventsDataConnectionDetails;  
```
  
### Members  
  
**`connectionSettings`** &nbsp; [PFEventsDataConnectionSettings](pfeventsdataconnectionsettings.md) const*  
  
Settings of the data connection.
  
**`isActive`** &nbsp; bool  
  
Whether or not the connection is currently active.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of the data connection.
  
**`status`** &nbsp; [PFEventsDataConnectionStatusDetails](pfeventsdataconnectionstatusdetails.md) const*  
*may be nullptr*  
  
(Optional) Current status of the data connection, if any.
  
**`type`** &nbsp; [PFEventsDataConnectionType](../enums/pfeventsdataconnectiontype.md)  
  
The type of data connection.
  
  
## Requirements  
  
**Header:** PFEventsTypes.h
  
## See also  
[PFEventsTypes members](../pfeventstypes_members.md)  

  
  
