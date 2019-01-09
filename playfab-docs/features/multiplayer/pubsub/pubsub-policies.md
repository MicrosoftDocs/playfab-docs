---
title: PubSub policies
author: MarcoWilliamsPF
description: Describes how to manage policies for your PubSub subscriptions.
ms.author: mawillia
ms.date: 12/21/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, pubsub, policies
ms.localizationpriority: medium
---

# PubSub policies

## Overview

PubSub events are governed by a set of policies which control who is allowed to publish to and subscribe to each topic. You can use these policies to ensure that only authorized clients are able to receive or send each type of event. Each policy specifies permissions for one set of topics (combination of event namespace, event name, and entity type), including which entities are allowed to subscribe to the specified events. By default, all event subscriptions are disallowed, so prior to setting up policies here, clients will not be able to subscribe to any events.

## Configuring policies

For your clients to receive any events via PubSub, you must first configure the appropriate policies on the PubSub Policy page within Game Manager. Open **Game Manager** and navigate to the **Settings** tab on the left, and then to the **PubSub** tab on the top.

![Screenshot of PubSub Policy configuration page.](images/pubsub-policy-list-ui.png)

If you are using a title with access to PubSub, this page provides you with a list of any existing PubSub policies configured for your title as well as the ability to modify those policies or create new ones.

### New policy

To create a new PubSub policy, click on the **NEW POLICY** button at the top right of the page. This opens up a new page which should look like the following screenshot:

![Screen shot of the new PubSub policy configuration page](images/new-pubsub-policy.png)

For standard PlayFab events, select a **Namespace** and **Event Name** from the dropdowns to indicate what sort of event you wish to configure (standard events are under the `com.playfab` namespace). Then choose the type of entity which will be subscribing to the desired event in the **Target Entity** dropdown. Check the appropriate boxes under **SUBSCRIBE** to control who is allowed to receive these events. For now, ignore the check boxes under **PUBLISH** as they currently have no effect.

For custom events the process is largely the same, the big difference being that you need to select "Custom" for the namespace and then type in the full namespace (beginning with `com.playfab.events`) and name of the event into the text boxes which show up.

![Screen shot of the new custom PubSub policy configuration page](images/new-custom-policy.png)

For now, ignore the check boxes under **PUBLISH** as they currently have no effect.

When you are ready, click **SAVE** to store and enable your new policy. 

## Edit policy

To edit a policy later, click on its **Event Name** in the list of policies. When editing a policy, you cannot change any of the fields which make up the topic of the event. If you wish to change the topic, create a new policy and delete the old one.

![Screenshot of the event name link.](images/click-to-edit.png)