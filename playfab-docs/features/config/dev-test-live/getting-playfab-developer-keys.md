---
title: Getting PlayFab Developer Keys
author: v-thopra
description: Describes how to acquire a PlayFab Developer Key that is used to authorize an application to use PlayFab Admin and Server APIs for a specific title.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, development, keys, api access
ms.localizationpriority: medium
---

# Getting PlayFab Developer Keys

A **PlayFab Developer Key** is used to authorize an application to use **PlayFab Admin** and **Server APIs** for a specific **Title**. A **Developer Key** is strongly coupled with a **PlayFab Title**.

## Acquiring a Developer Key

In **Game Manager**:

- Navigate to your **Title**.

- Select **Settings** on the menu to the left **(1)**.
- Then select the **Secret Keys** tab **(2)**.
- Locate the **Default Key (3)** in the field under the **Secret Key** column on the screen.

![Game Manager - Secret Keys - Default Key](media/tutorials/game-manager-secret-keys-default-key.png)  

## Multiple Keys

Generally, the **Default Key** is sufficient to authorize your application for **Admin** and **Server API** calls. However, you may also select the **New Secret Key** button **(1)**.

![Game Manager - Secret Keys - New Secret Key Button](media/tutorials/game-manager-new-secret-key-button.png)  

- Fill in the **Title** for your **New Key** in the **Name** field provided **(1)**.

- Enter an optional **Expiration Date (2)**.
- Select the **Save Secret Key** button **(3)**.

![Game Manager - Secret Keys - Save New Secret Key](media/tutorials/game-manager-save-new-secret-key.png)  

This will create a **New Key** that you may use to authorize **Admin** and **Server API** calls.

### Use case for multiple keys

You may need **Temporary Keys** if you are outsourcing some work to another company. You may also need to revoke a **Key** that has accidentally been made public. You can create new **keys** and revoke **keys** as needed.