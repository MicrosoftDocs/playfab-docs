---
author: jasonsandlin
title: "PFGroupsIsMemberAsync"
description: "Checks to see if an entity is a member of a group or role within the group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsIsMemberAsync  

Checks to see if an entity is a member of a group or role within the group  

## Syntax  
  
```cpp
HRESULT PFGroupsIsMemberAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsIsMemberRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsIsMemberRequest*](../../pfgroupstypes/structs/pfgroupsismemberrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Checks to see if an entity is a member of a group or role within the group. A result indicating if the entity is a member of the group is returned, or a permission error if the caller does not have permission to read the group's member list. See also GroupGetGroupAsync. If successful, call [PFGroupsIsMemberGetResult](pfgroupsismembergetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
