---
title: Entity Groups
author: v-thopra
description: Describes the concepts behind Entity Groups in the PlayFab APIs and the basics of how to use them.
ms.author: v-thopra
ms.date: 10/26/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entity groups, guilds
ms.localizationpriority: medium
---

# Entity groups

## PlayFab guild solution

Let's say that you need guilds, clans, corporations, companies, tribes, or whatever your game calls them - PlayFab has them.

PlayFab builds guilds using the new  **[Entity Programming Model](../../data/entities/index.md)**, or more specifically the entity type of groups. Entity groups are a much broader concept than guilds, but fundamentally, entity groups have been created as a solution for guilds.

## Entity groups

Entity groups are the root concept that was inspired by the need for clans/guilds.

At its core, entity groups are any logical group of entities, which can serve any purpose. entity groups can simultaneously serve many purposes within your game.

Examples:

- **Clans/Guilds** - This was the starting point, and the main driving need. *Entity groups can be used to describe a set of players who are playing together on a regular basis, for whatever social glue that holds them together on a long-term basis.

- **Parties** - Entity groups can be used for short-term groups created to allow individual players to accomplish an immediate goal, and easily disband.
- **Chat Channels** - Short or long term chat channels can be defined as an entity group.
- **In-Game subscription to information** - Do you have a single-instance legendary item in your game? Do players want constant updates about what is happening with that item? Create an entity group focused on that item, with all player entities interested in the item as members.

In short, entity groups can be *any* collection of entities (whether **NPC** or player-controlled, real or abstract), which need a persistent-state bound to that group.

A friends list is a group. A three person private chat is a group. Go nuts!

> [!NOTE]
> We'd appreciate some warning in the forums if you are trying something we might not be expecting...

In addition, since entity groups are also entities themselves, they will contain all the initial features of entities:

- **Object data**
- **File data**
- **Profiles**

They will be generally eligible for new entity features going forward, if those features are relevant to groups.

## Using entity groups

Today, entity groups can contain players and/or characters. When creating a group, the first entity added to the group is placed in an Admin role (this guide will refer to that entity as the owner, for simplicity).

The owner will then be able to invite new members, create new roles with a wide variety of customizable permissions, modify member roles, kick members, etc.

Additionally, the same entity functions that exist for entities also function for groups, so you will be able to save **JSON** objects, and files directly to the group to save arbitrary game-specific data.

The code example that is provided below should give you a head start on basic guild interaction.

It allows you to create groups, add and remove members, and delete the group. It is meant to be a starting point, and does not demonstrate any of the roles or permissions.

```csharp
#if ENABLE_PLAYFABENTITY_API

using PlayFab.EntityModels;
using System;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Assumptions for this controller:
/// + Entitites can be in multiple groups
///   - This is game specific, many games would only allow 1 group, meaning you'd have to perform some additional checks to validate this.
/// </summary>
[Serializable]
public class GuildTestController
{
    // A local cache of some bits of PlayFab data
    // This cache pretty much only serves this example , and assumes that entities are uniquely identifyable by EntityId alone, which isn't technically true. Your data cache will have to be better.
    public readonly HashSet<KeyValuePair<string, string>> EntityGroupPairs = new HashSet<KeyValuePair<string, string>>();
    public readonly Dictionary<string, string> GroupNameById = new Dictionary<string, string>();

    public static EntityKey EntityKeyMaker(string entityId, EntityTypes entityType = EntityTypes.group)
    {
        return new EntityKey { Id = entityId, Type = entityType, TypeString = entityType.ToString() };
    }

    private void OnSharedError(PlayFab.PlayFabError error)
    {
        Debug.LogError(error.GenerateErrorReport());
    }

    public void ListGroups(EntityKey entityKey)
    {
        var request = new ListMembershipRequest { Entity = entityKey };
        PlayFab.PlayFabEntityAPI.ListMembership(request, OnListGroups, OnSharedError);
    }
    private void OnListGroups(ListMembershipResponse result)
    {
        var prevRequest = (ListMembershipRequest)result.Request;
        foreach (var pair in result.Groups)
        {
            GroupNameById[pair.Group.Id] = pair.GroupName;
            EntityGroupPairs.Add(new KeyValuePair<string, string>(prevRequest.Entity.Id, pair.Group.Id));
        }
    }

    public void CreateGroup(string groupName, EntityKey entityKey)
    {
        // A player-controlled entity creates a new group
        var request = new CreateGroupRequest { GroupName = groupName, Entity = entityKey };
        PlayFab.PlayFabEntityAPI.CreateGroup(request, OnCreateGroup, OnSharedError);
    }
    private void OnCreateGroup(CreateGroupResponse result)
    {
        Debug.Log("Group Created: " + result.GroupName + " - " + result.Group.Id);

        var prevRequest = (CreateGroupRequest)result.Request;
        EntityGroupPairs.Add(new KeyValuePair<string, string>(prevRequest.Entity.Id, result.Group.Id));
        GroupNameById[result.Group.Id] = result.GroupName;
    }
    public void DeleteGroup(string groupId)
    {
        // A title, or player-controlled entity with authority to do so, decides to destroy an existing group
        var request = new DeleteGroupRequest { Group = EntityKeyMaker(groupId) };
        PlayFab.PlayFabEntityAPI.DeleteGroup(request, OnDeleteGroup, OnSharedError);
    }
    private void OnDeleteGroup(EmptyResult result)
    {
        var prevRequest = (DeleteGroupRequest)result.Request;
        Debug.Log("Group Deleted: " + prevRequest.Group.Id);

        var temp = new HashSet<KeyValuePair<string, string>>();
        foreach (var each in EntityGroupPairs)
            if (each.Value != prevRequest.Group.Id)
                temp.Add(each);
        EntityGroupPairs.IntersectWith(temp);
        GroupNameById.Remove(prevRequest.Group.Id);
    }

    public void InviteToGroup(string groupId, EntityKey entityKey)
    {
        // A player-controlled entity invites another player-controlled entity to an existing group
        var request = new InviteToGroupRequest { Group = EntityKeyMaker(groupId), Entity = entityKey };
        PlayFab.PlayFabEntityAPI.InviteToGroup(request, OnInvite, OnSharedError);
    }
    public void OnInvite(InviteToGroupResponse result)
    {
        var prevRequest = (InviteToGroupRequest)result.Request;

        // Presumably, this would be part of a separate process where the recipient reviews and accepts the request
        var request = new AcceptGroupInvitationRequest { Group = EntityKeyMaker(prevRequest.Group.Id), Entity = prevRequest.Entity };
        PlayFab.PlayFabEntityAPI.AcceptGroupInvitation(request, OnAcceptInvite, OnSharedError);
    }
    public void OnAcceptInvite(EmptyResult result)
    {
        var prevRequest = (AcceptGroupInvitationRequest)result.Request;
        Debug.Log("Entity Added to Group: " + prevRequest.Entity.Id + " to " + prevRequest.Group.Id);
        EntityGroupPairs.Add(new KeyValuePair<string, string>(prevRequest.Entity.Id, prevRequest.Group.Id));
    }

    public void ApplyToGroup(string groupId, EntityKey entityKey)
    {
        // A player-controlled entity applies to join an existing group (of which they are not already a member)
        var request = new ApplyToGroupRequest { Group = EntityKeyMaker(groupId), Entity = entityKey };
        PlayFab.PlayFabEntityAPI.ApplyToGroup(request, OnApply, OnSharedError);
    }
    public void OnApply(ApplyToGroupResponse result)
    {
        var prevRequest = (ApplyToGroupRequest)result.Request;

        // Presumably, this would be part of a separate process where the recipient reviews and accepts the request
        var request = new AcceptGroupApplicationRequest { Group = prevRequest.Group, Entity = prevRequest.Entity };
        PlayFab.PlayFabEntityAPI.AcceptGroupApplication(request, OnAcceptApplication, OnSharedError);
    }
    public void OnAcceptApplication(EmptyResult result)
    {
        var prevRequest = (AcceptGroupApplicationRequest)result.Request;
        Debug.Log("Entity Added to Group: " + prevRequest.Entity.Id + " to " + prevRequest.Group.Id);
    }
    public void KickMember(string groupId, EntityKey entityKey)
    {
        var request = new RemoveMembersRequest { Group = EntityKeyMaker(groupId), Members = new List<EntityKey> { entityKey } };
        PlayFab.PlayFabEntityAPI.RemoveMembers(request, OnKickMembers, OnSharedError);
    }
    private void OnKickMembers(EmptyResult result)
    {
        var prevRequest = (RemoveMembersRequest)result.Request;
        Debug.Log("Entity kicked from Group: " + prevRequest.Members[0].Id + " to " + prevRequest.Group.Id);
        EntityGroupPairs.Remove(new KeyValuePair<string, string>(prevRequest.Members[0].Id, prevRequest.Group.Id));
    }
}
#endif
```

## Deconstructing the example

This example is built as a controller, which saves minimal data to a local cache (PlayFab being the authoritative data layer), and provides a way to perform CRUD operations on groups.

Let's take a look at some of the functions in the example provided:

- **OnSharedError** - This is a typical pattern with PlayFab examples. The simplest way to handle an error is to report it. Your game client will probably have much more sophisticated error handling logic.

- **ListGroups** - This calls **ListMembership** to determine all the groups that the given entity belongs to.Players will want to know the groups they have already joined.

- **CreateGroup/DeleteGroup** - Mostly self-explanatory. This example demonstrates updating the local group info cache when these calls are executed successfully.

- **InviteToGroup/ApplyToGroup** - Joining a group is a two-step process, and it can be activated both directions:
     - A player can ask to join a group.
     - A group can invite a player.

- **AcceptGroupInvitation/AcceptGroupApplication** - The second step of the join process. The responding entity accepts the invitation, completing the process of making the player a part of the group.

- **RemoveMembers** - Members with authority to do so (defined by their role permissions) will be able to kick members from a group.

## Server vs client

Like all new entity **API** methods, there is no distinction between the server **API** and the client **API**.

The action is performed by the caller, according to how the process was authenticated. A client will be identified as such, and will call these methods as a title player entity, and their roles and permissions within the group will be evaluated with every call, ensuring they have permission to perform this action.

A server is authenticated with the same **developerSecretKey**, which identifies that process as a title entity. A title will bypass the role checks, and **API** calls executed by a title will only fail if the action is impossible to perform, in an instance such as if an entity cannot be removed if they are not a member.
