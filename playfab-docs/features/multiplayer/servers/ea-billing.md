---
title: Azure Enterprise Agreement (EA) billing for PlayFab services
author: v-thopra
description: Describes the Azure Enterprise Agreement (EA) billing for PlayFab services and how to sign up for it.
ms.author: v-thopra
ms.date: 05/08/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, azure, billing, pricing, enterprise agreement
ms.localizationpriority: medium
---

# Azure Enterprise Agreement (EA) billing for PlayFab services

If you are interested in very high usage of PlayFab services ($500,000.00+ per year) including PlayFab Essentials, Multiplayer Servers, Insights, Party, User Generated Content and Pub Sub, we may be able to bill you through an **Azure Enterprise Agreement (EA)**. If you are an existing EA customer this requires Microsoft to amend the terms of your EA to include PlayFab pricing details. If you are not an existing EA customer please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com) to learn more about this billing option.

To start the EA billing process, contact your Azure solutions specialist and work with them to provide PlayFab Sales:

- Azure enterprise agreement (enrollment id) to govern PlayFab usage
- Mapping of PlayFab Title IDs to Azure subscriptions for billing

PlayFab will emit multiplayer server consumption via an Azure SKU called PlayFab Multiplayer Servers. Each PlayFab title will emit to the Azure subscription provided, and you will get a monthly bill through the EA portal.

This single Azure SKU for PlayFab Multiplayer Servers will be measured in dollars, without a break-down of cost by resource (e.g. Fv2 compute, Zone 2 network egress, etc.). [Use Game Manager to see a break-down of costs by resource.](tracking-consumption.md)