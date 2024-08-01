---
author: jasonsandlin
title: "Services C API overview - PFGroups.h"
description: "Services C API overview - PFGroups.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFGroups.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFGroupsAcceptGroupApplicationAsync](functions/pfgroupsacceptgroupapplicationasync.md) | Accepts an outstanding invitation to to join a group |  
| [PFGroupsAcceptGroupInvitationAsync](functions/pfgroupsacceptgroupinvitationasync.md) | Accepts an invitation to join a group |  
| [PFGroupsAddMembersAsync](functions/pfgroupsaddmembersasync.md) | Adds members to a group or role. |  
| [PFGroupsApplyToGroupAsync](functions/pfgroupsapplytogroupasync.md) | Applies to join a group |  
| [PFGroupsApplyToGroupGetResult](functions/pfgroupsapplytogroupgetresult.md) | Gets the result of a successful PFGroupsApplyToGroupAsync call. |  
| [PFGroupsApplyToGroupGetResultSize](functions/pfgroupsapplytogroupgetresultsize.md) | Get the size in bytes needed to store the result of a ApplyToGroup call. |  
| [PFGroupsBlockEntityAsync](functions/pfgroupsblockentityasync.md) | Blocks a list of entities from joining a group. |  
| [PFGroupsChangeMemberRoleAsync](functions/pfgroupschangememberroleasync.md) | Changes the role membership of a list of entities from one role to another. |  
| [PFGroupsCreateGroupAsync](functions/pfgroupscreategroupasync.md) | Creates a new group. |  
| [PFGroupsCreateGroupGetResult](functions/pfgroupscreategroupgetresult.md) | Gets the result of a successful PFGroupsCreateGroupAsync call. |  
| [PFGroupsCreateGroupGetResultSize](functions/pfgroupscreategroupgetresultsize.md) | Get the size in bytes needed to store the result of a CreateGroup call. |  
| [PFGroupsCreateRoleAsync](functions/pfgroupscreateroleasync.md) | Creates a new group role. |  
| [PFGroupsCreateRoleGetResult](functions/pfgroupscreaterolegetresult.md) | Gets the result of a successful PFGroupsCreateRoleAsync call. |  
| [PFGroupsCreateRoleGetResultSize](functions/pfgroupscreaterolegetresultsize.md) | Get the size in bytes needed to store the result of a CreateRole call. |  
| [PFGroupsDeleteGroupAsync](functions/pfgroupsdeletegroupasync.md) | Deletes a group and all roles, invitations, join requests, and blocks associated with it. |  
| [PFGroupsDeleteRoleAsync](functions/pfgroupsdeleteroleasync.md) | Deletes an existing role in a group. |  
| [PFGroupsGetGroupAsync](functions/pfgroupsgetgroupasync.md) | Gets information about a group and its roles |  
| [PFGroupsGetGroupGetResult](functions/pfgroupsgetgroupgetresult.md) | Gets the result of a successful PFGroupsGetGroupAsync call. |  
| [PFGroupsGetGroupGetResultSize](functions/pfgroupsgetgroupgetresultsize.md) | Get the size in bytes needed to store the result of a GetGroup call. |  
| [PFGroupsInviteToGroupAsync](functions/pfgroupsinvitetogroupasync.md) | Invites a player to join a group |  
| [PFGroupsInviteToGroupGetResult](functions/pfgroupsinvitetogroupgetresult.md) | Gets the result of a successful PFGroupsInviteToGroupAsync call. |  
| [PFGroupsInviteToGroupGetResultSize](functions/pfgroupsinvitetogroupgetresultsize.md) | Get the size in bytes needed to store the result of a InviteToGroup call. |  
| [PFGroupsIsMemberAsync](functions/pfgroupsismemberasync.md) | Checks to see if an entity is a member of a group or role within the group |  
| [PFGroupsIsMemberGetResult](functions/pfgroupsismembergetresult.md) | Gets the result of a successful PFGroupsIsMemberAsync call. |  
| [PFGroupsListGroupApplicationsAsync](functions/pfgroupslistgroupapplicationsasync.md) | Lists all outstanding requests to join a group |  
| [PFGroupsListGroupApplicationsGetResult](functions/pfgroupslistgroupapplicationsgetresult.md) | Gets the result of a successful PFGroupsListGroupApplicationsAsync call. |  
| [PFGroupsListGroupApplicationsGetResultSize](functions/pfgroupslistgroupapplicationsgetresultsize.md) | Get the size in bytes needed to store the result of a ListGroupApplications call. |  
| [PFGroupsListGroupBlocksAsync](functions/pfgroupslistgroupblocksasync.md) | Lists all entities blocked from joining a group |  
| [PFGroupsListGroupBlocksGetResult](functions/pfgroupslistgroupblocksgetresult.md) | Gets the result of a successful PFGroupsListGroupBlocksAsync call. |  
| [PFGroupsListGroupBlocksGetResultSize](functions/pfgroupslistgroupblocksgetresultsize.md) | Get the size in bytes needed to store the result of a ListGroupBlocks call. |  
| [PFGroupsListGroupInvitationsAsync](functions/pfgroupslistgroupinvitationsasync.md) | Lists all outstanding invitations for a group |  
| [PFGroupsListGroupInvitationsGetResult](functions/pfgroupslistgroupinvitationsgetresult.md) | Gets the result of a successful PFGroupsListGroupInvitationsAsync call. |  
| [PFGroupsListGroupInvitationsGetResultSize](functions/pfgroupslistgroupinvitationsgetresultsize.md) | Get the size in bytes needed to store the result of a ListGroupInvitations call. |  
| [PFGroupsListGroupMembersAsync](functions/pfgroupslistgroupmembersasync.md) | Lists all members for a group |  
| [PFGroupsListGroupMembersGetResult](functions/pfgroupslistgroupmembersgetresult.md) | Gets the result of a successful PFGroupsListGroupMembersAsync call. |  
| [PFGroupsListGroupMembersGetResultSize](functions/pfgroupslistgroupmembersgetresultsize.md) | Get the size in bytes needed to store the result of a ListGroupMembers call. |  
| [PFGroupsListMembershipAsync](functions/pfgroupslistmembershipasync.md) | Lists all groups and roles for an entity |  
| [PFGroupsListMembershipGetResult](functions/pfgroupslistmembershipgetresult.md) | Gets the result of a successful PFGroupsListMembershipAsync call. |  
| [PFGroupsListMembershipGetResultSize](functions/pfgroupslistmembershipgetresultsize.md) | Get the size in bytes needed to store the result of a ListMembership call. |  
| [PFGroupsListMembershipOpportunitiesAsync](functions/pfgroupslistmembershipopportunitiesasync.md) | Lists all outstanding invitations and group applications for an entity |  
| [PFGroupsListMembershipOpportunitiesGetResult](functions/pfgroupslistmembershipopportunitiesgetresult.md) | Gets the result of a successful PFGroupsListMembershipOpportunitiesAsync call. |  
| [PFGroupsListMembershipOpportunitiesGetResultSize](functions/pfgroupslistmembershipopportunitiesgetresultsize.md) | Get the size in bytes needed to store the result of a ListMembershipOpportunities call. |  
| [PFGroupsRemoveGroupApplicationAsync](functions/pfgroupsremovegroupapplicationasync.md) | Removes an application to join a group |  
| [PFGroupsRemoveGroupInvitationAsync](functions/pfgroupsremovegroupinvitationasync.md) | Removes an invitation join a group |  
| [PFGroupsRemoveMembersAsync](functions/pfgroupsremovemembersasync.md) | Removes members from a group. |  
| [PFGroupsUnblockEntityAsync](functions/pfgroupsunblockentityasync.md) | Unblocks a list of entities from joining a group |  
| [PFGroupsUpdateGroupAsync](functions/pfgroupsupdategroupasync.md) | Updates non-membership data about a group. |  
| [PFGroupsUpdateGroupGetResult](functions/pfgroupsupdategroupgetresult.md) | Gets the result of a successful PFGroupsUpdateGroupAsync call. |  
| [PFGroupsUpdateGroupGetResultSize](functions/pfgroupsupdategroupgetresultsize.md) | Get the size in bytes needed to store the result of a UpdateGroup call. |  
| [PFGroupsUpdateRoleAsync](functions/pfgroupsupdateroleasync.md) | Updates metadata about a role. |  
| [PFGroupsUpdateRoleGetResult](functions/pfgroupsupdaterolegetresult.md) | Gets the result of a successful PFGroupsUpdateRoleAsync call. |  
| [PFGroupsUpdateRoleGetResultSize](functions/pfgroupsupdaterolegetresultsize.md) | Get the size in bytes needed to store the result of a UpdateRole call. |  
