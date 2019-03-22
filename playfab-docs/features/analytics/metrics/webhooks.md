---
title: Webhooks
author: v-thopra
description: Provides an overview of the Webhook panel in Game Manager, and describes how to access and configure a Webhook.
ms.author: v-thopra
ms.date: 10/31/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, webhooks, events
ms.localizationpriority: medium
---

# Webhooks

In complex systems you may want to provide additional event handling on your custom server.

PlayFab offers Webhooks to achieve this. Whenever a new event is emitted, it can be forwarded to your server by making a POST request to your custom web endpoint, and the event data is passed as the JSON body of the request.

## Accessing Webhooks

To access the **Webhooks** panel in the PlayFab **Game Manager** screen:

- Select **Analytics (1)** in the sidebar menu.
- Then select the **Webhooks** tab **(2)**.

![Game Manager - Analytics - Webhooks](media/tutorials/game-manager-analytics-webhooks.png)  

## Overview of the Webhooks panel

The image shown below provides an overview of the **Webhooks** panel.

- The **New Webhook** button **(1)** allows you to create and configure a new Webhook.
- The **Webhook Name** area **(2)** can be used to access and configure the Webhook.
- The **Status** area **(3)** shows whether a Webhook is currently **enabled**.
- The **Failing Since** area **(4)** shows when a Webhook endpoint stopped returning **OK** responses.
- When one or more Webhooks are selected, you can use the **Delete** button to permanently remove them.

![Game Manager - Analytics - Webhooks panel](media/tutorials/game-manager-analytics-webhooks-panel.png)  

## Configuring a Webhook

The image shown below describes the options for configuring a Webhook.

- Use the **Name** field **(1)** to create a Webhook name that will uniquely identify the Webhook.
- Set up the **Endpoint URI (2)**. This **URI** will be hit when the **Event** occurs.
- You may set the **Webhook** as **Enabled** - **true** or **false (3)**. This allows you to temporarily suspend a **Webhook** without completely removing (deleting) it from the system.
- Set up the **Filters** to only process the **Events** you need **(4)**. You can **Filter** by **Event Name**, **Event Source**, and **PlayerID**.

> [!NOTE]
> You can have several **Filters** per **Group**, but each **Filter** setting must be matched for the event to fall into the **Filter Group**.

- You may define several **Filter Groups** to include different **Filters (5)**. **Events** must fall into at least *one* group to be passed to the **Webhook**.

![Game Manager - Analytics - Webhooks - Webhook Configuration](media/tutorials/game-manager-analytics-webhook-configuration.png)  
