---
title: AAD
author: johsmi
description: Provides an introduction to AAD authentication and steps for how to create a user with this auth method
ms.author: johsmi
ms.date: 11/11/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, webhooks, events
ms.localizationpriority: medium
---

# Azure Active Directory Authentication for Playfab Game Manager

PlayFab now supports two methods of user authentication. The first is the original PlayFab user authentication system. The second is now Azure Active Directory (AAD).

### To Create a New AAD User
1. Navigate to your studio's users section (picture 1)
2. Click to add a new users and select "Microsoft" as the authentication provider (picture 2)
3. Assign roles as normal and send invite. The user will have the option to login with microsoft (picture 3)

### Sign-Up with AAD
You can start a new PlayFab studio with AAD.
1. Navigate to https://developer.playfab.com/en-US/sign-up
2. Click to "Sign in with Microsoft"

### PlayFab AAD Limitations
Please note that while AAD authentication is functional for individual users, including AAD token exchange for programmtic authentication, we do not currently support groups or graph.