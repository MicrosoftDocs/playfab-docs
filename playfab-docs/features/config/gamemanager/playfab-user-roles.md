---
title: PlayFab User Roles
author: v-thopra
description: Describes how to create and configure User Roles in PlayFab.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, game manager, user roles
ms.localizationpriority: medium
---

# PlayFab User Roles

**PlayFab** now supports **Roles** as a more efficient way to manage **User Permissions** within the **Game Manager**.

We're very pleased to have added this feature, since it's been one of the most frequently requested features.

With the introduction of **Roles**, we are phasing out the ability to directly edit **User Permissions**. This is no problem for new **Titles**, who can immediately begin using the new **Roles** system.

However, existing **Titles** that are using **Custom Permissions** must first **migrate** these **Custom Permissions** over to the new **Roles** system.

First, let's first see how the new **Roles** work, then we'll discuss how to migrate them from the old **Permissions** system to the new **Roles** system.

## Permissions and Roles

**PlayFab** features a powerful, fine-grained **Permissions** model with more than 80 individual **Permissions** to determine *exactly* what **Users** are allowed to do. Most features in the **Game Manager** can be turned off entirely, set to read-only mode, or set to read-write mode.

For example, you may want your **Customer Service Rep** to be able to edit a **Player Profile**, but not view revenue data, and you may want a **Product Manager** to be able to view revenue data, but *not* upload new multiplayer game server builds.

Previously, **Permissions** had to be set *individually* for each **User**, and for each **Title**. This was cumbersome, especially for large **Studios** with many **Users**, **Titles**, and **Permissions** sets.

And worst of all, if a **Permission Policy** changed, or a new feature was added, you needed to go through and manually edit the **Permissions** for every **User**.

Now, however, **Studios** can define a **Role** as a collection of **Permissions**, and then assign those **Roles** *directly* to **Users**. You can edit a **Role** at any time, and all **Users** assigned to that **Role** will immediately have their **Permissions** changed.

For convenience, you can even assign multiple **Roles** to a **User**. For example - you could define a **Customer Support Role**, with **Permission** to edit **Player Profiles**, and a **Data Scientist Role** with **Permission** to view all **Events** and see all **Dashboards**, and assign *both* to a single **User**.

## Creating Custom Roles

The first step in using the new system is to define **Roles**.

By default, **PlayFab** comes with two predefined **Roles**:

1. **Title Admin**
2. **Dashboard**

T**itle Admin** gives full **Permissions** to a given game **Title**, and **Dashboard** only gives **Permission** to view the **Dashboards** for the **Title**.

There is also a third, special **Role** -- **Studio Admin**.

**Studio Admins** are special **Users** who have **Permission** to create **Titles**, define **Roles**, and have automatic **Title Admin** rights to every **Title** in the **Studio**.

Here are the steps to create a new **Role**:

1. [Login to PlayFab](https://developer.playfab.com/) with your **Developer Account**.
2. Ensure you are a **Studio Admin** (you will know that you are if you see the following options next to your **Studio Name**). If you are *not* the **Studio Admin**, please contact the **Studio Admin** to setup the **Permissions** according to this tutorial.

   ![PlayFab - Studio Admin Options](media/tutorials/playfab-studio-admin-options.png)  

3. Select **Users and Roles** from the list of options.
4. Select the **Roles** tab at the top of the screen. You should now see a list of all the **Roles** in the system.

   ![Game Manager - Roles](media/tutorials/game-manager-roles.png)  

5. Select the **New Custom Role** button to create a new **Role**. Give your new **Role** a name, and check off the **Permissions** you wish to include. Generally, all **Permissions** follow this pattern:

    - You can enable or disable the entire feature using the top-most option **Permission (1)**.
    - You can show or hide the navigation tab using the **Permission** tab **(2)**.
    - Each **Permission** has a read-only and read-write option. The read-write option has **Edit** at the end **(3)** and **(4)**.

      ![Game Manager - New Role - Permissions](media/tutorials/game-manager-new-role-permissions.png)  

6. Select the **Save Role** button when you're done.

   ![Game Manager - Save Role](media/tutorials/game-manager-save-role.png)  

## Assigning Roles

Once you've created a **Role**, you can assign the **Role** to **Users** in a **Title**.

**Roles** apply at the **Title** level. If you have five **Titles**, and you wish a given **User** to have the same **Role** for each **Title**, you must give the **User** that **Role** for each **Title**.

This gives you the most flexibility. Under this system, a given **User** could be a **Title Admin** for one **Title**, a **Product Manager** for another, and a **Customer Service Rep** for a third, all under the same **Studio**.

Here are the steps to assign a **Role**:

1. [Login to PlayFab](https://developer.playfab.com/) with your **Developer Account**. As mentioned previously, make sure you are a (**Studio Admin**.
2. Select **Users and Roles** from the list of options. You will see a list of **Users** for your **Studio**.
3. Select **Settings** for the **User** for whom you wish to assign **Roles**.
4. Select the **Roles** tab. You will see a list of all **Titles** in your **Studio**, and any **Roles** that **User** already has for each **Title**.
5. Select **Assign Roles** for each **Title** for which you wish to give the **User** a **Role**. You will see a list of your **Roles**. Check off any **Role** you wish to give the **User** on that **Title**.
6. After you have assigned **Roles**, be sure to select **Save User**, otherwise your **Role** assignments will be lost.

## Migrating to the new Roles system

If you have an existing **Title**, and you have already given **Users Custom Permissions**, we will automatically create new **Roles** for these **Users**. After a **User** has been migrated to their new **Custom Role**, you can rename the **Role**.

Because **Studio Admin** is a new **Permission** level, this will automatically be granted to **Users** who have **Title Admin** on all **Titles** in a **Studio**.

## Conclusion

**Roles** are a powerful and flexible new way to determine who can do what in **Game Manager**.

Going forward, you should use **Roles** to assign **Permissions**. Existing **Custom Permissions** will continue to function, but you *cannot change* the **Permissions** without migrating over to the new **Roles** system.
