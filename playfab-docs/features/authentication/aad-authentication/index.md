---
title: Microsoft Accounts Authentication for PlayFab
author: joannaleecy
description: Provides an introduction to Microsoft Account authentication and steps for how to create a user with this auth method
ms.author: joanlee
ms.date: 11/11/2019
ms.topic: article
ms.service: playfab
keywords: playfab, analytics, metrics, webhooks, events
ms.localizationpriority: medium
---

# Microsoft Authentication for Playfab Game Manager

PlayFab now supports two methods of user authentication. The first is the original PlayFab user authentication system. The second is Microsoft's authentication services 'Microsoft Account' and 'Microsoft Entra ID (formerly known as Azure Active Directory)'.

### To create a new Microsoft Authenicated user

1. Navigate to your studio's users section.

    ![Studio Users](media/AADDoc1.png)

2. Select **Add User** and select **Microsoft** as the authentication provider.

    ![Select Microsoft Authentication](media/AADDoc2.png)

3. Assign roles as normal and send an invite. The user has the option to sign in via a Microsoft Account.

    ![Sign in with Microsoft](media/AADDoc3.png )

### Sign-up with a Microsoft Authenticated Account

You can start a new PlayFab studio using a Microsoft Account.

1. Navigate to [developer.microsoft.com](https://developer.playfab.com/en-US/sign-up).
2. Select **Sign up with Microsoft**.

### Microsoft Account Limitations

Microsoft Account authentication is functional for individual users, including Microsoft Account token exchange for programmatic authentication. It doesn't support groups or graph.
