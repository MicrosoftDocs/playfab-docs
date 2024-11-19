---
title: PlayFab User Roles
author: joannaleecy
description: Describes how to create and configure User Roles in PlayFab.
ms.author: joanlee
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config, game manager, user roles
ms.localizationpriority: medium
---

# PlayFab user roles

PlayFab now supports roles as a more efficient way to manage user permissions within the Game Manager. We're very pleased to have added this feature, since it's been one of the most frequently requested features.

With the introduction of roles, we are phasing out the ability to directly edit user permissions. This is no problem for new titles - those can immediately begin using the new roles system.

However, *existing* titles that are using custom permissions must first *migrate* these custom permissions over to the new roles system.

First, let's first see how the new roles work, then we'll discuss how to migrate them from the old permissions system to the new roles system.

## Permissions and roles

PlayFab features a powerful, fine-grained permissions model with more than 80 individual permissions to determine *exactly* what users are allowed to do. Most features in the Game Manager can be completely turned off, set to read-only mode, or set to read-write mode.

For example, you may want your Customer Service rep to be able to edit a player profile, but not view revenue data. And you may want a Product Manager to be able to view revenue data, but *not* upload new multiplayer game server builds.

Previously, permissions had to be set *individually* for each user, and for each title. This was cumbersome, especially for large studios with many users, titles, and permissions sets.

And worst of all, if a permission policy changed, or a new feature was added, you needed to go through and manually edit the permissions for every user.

Now, however, studios can define a role as a collection of permissions, and then assign those roles *directly* to users. You can edit a role at any time, and all users assigned to that role will immediately have their permissions changed.

For convenience, you can even assign multiple roles to a user. For example - you could define a Customer Support role, with permission to edit player profiles, and a Data Scientist role, with permission to view all events and see all dashboards, and assign *both* to a single user.

## Creating custom roles

The first step in using the new system is to define roles.

By default, PlayFab comes with two predefined roles:

1. **Title Admin**
2. **Dashboard**

Title Admin gives full permissions to a given game title, while Dashboard only gives permission to view the dashboards for the title.

There is also a third, special role -- **Studio Admin**.

Studio Admins are special users who have permission to create titles, define roles, and have automatic Title Admin rights to every title in the studio.

Here are the steps to create a new role:

1. [Login to PlayFab](https://developer.playfab.com/) with your developer account.
2. Ensure you are a Studio Admin (you will know that you are if you see the following options next to your studio name). If you are *not* the Studio Admin, please contact the Studio Admin to setup the permissions according to this tutorial.

   ![PlayFab - Studio Admin Options](media/tutorials/playfab-studio-admin-options.png)  

3. Select **Users and Roles** from the list of options.
4. Select the **Roles** tab at the top of the screen. You should now see a list of all the **Roles** in the system.

   ![Game Manager - Roles](media/tutorials/game-manager-roles.png)  

5. Select the **New Custom Role** button to create a new role. Give your new role a name, and check off the permissions you wish to include. Generally, all permissions follow this pattern:

    - You can enable or disable the entire feature using the top-most option **Permission (1)**.
    - You can show or hide the navigation tab using the **Permission** tab **(2)**.
    - Each **Permission** has a read-only and read-write option. The read-write option has **Edit** at the end **(3)** and **(4)**.

      ![Game Manager - New Role - Permissions](media/tutorials/game-manager-new-role-permissions.png)  

6. Select the **Save Role** button when you're done.

   ![Game Manager - Save Role](media/tutorials/game-manager-save-role.png)  

## Assigning roles

Once you've created a role, you can assign the role to users in a title.

Roles apply at the title level. If you have five titles, and you wish a given user to have the same role for each title, you must give the user that role for *each* title.

This gives you the most flexibility. Under this system, a given user could be a Title Admin for one title, a Product Manager for another, and a Customer Service rep for a third, all under the same studio.

Here are the steps to assign a role:

1. [Login to PlayFab](https://developer.playfab.com/) with your developer account. As mentioned previously, make sure you are a Studio Admin.
2. Select **Users and Roles** from the list of options. You will see a list of users for your studio.
3. Select **Settings** for the user for whom you wish to assign roles.
4. Select the **Roles** tab. You will see a list of all titles in your studio, and any roles that user already has for each title.
5. Select **Assign Roles** for each title for which you wish to give the user a role. You will see a list of your Roles. Check any role you wish to give the user on that title.
6. After you have assigned Roles, be sure to select **Save User**, otherwise your role assignments will be lost.

## Migrating to the new roles system

If you have an existing title, and you have already given users custom permissions, we will automatically create new roles for these users.

After a user has been migrated to their new custom role, you can rename the role.

Because Studio Admin is a new permission level, this will automatically be granted to users who have Title Admin on all titles in a studio.

## Conclusion

Roles are a powerful and flexible new way to determine who can do what in Game Manager.

Going forward, you should use roles to assign permissions. Existing custom permissions will continue to function, but you *cannot change* the permissions without migrating over to the new roles system.
