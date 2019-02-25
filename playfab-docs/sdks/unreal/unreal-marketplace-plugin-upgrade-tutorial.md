---
title: Unreal Marketplace Plugin - Upgrade Tutorial
author: v-thopra
description: Steps you through upgrading your project from either the PlayFab Unreal C++ SDK or the PlayFab Unreal Blueprint SDK, to the new PlayFab Unreal Marketplace Plugin.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, unreal, playfab marketplace plugin, c++, blueprint
ms.localizationpriority: medium
---

# Unreal Marketplace Plugin - upgrade tutorial

This tutorial will step you through upgrading your project from either the PlayFab **Unreal C++ SDK**, or the PlayFab **Unreal Blueprint SDK**, to the new PlayFab **Unreal Marketplace** plugin.

The new **Marketplace** plugin covers the interface for both of our earlier **SDKs**:

- The **Direct C++ interface**
- The **Blueprint interface**

We merged the **Blueprint interface** into the **Marketplace** plugin without causing any breaking changes. However, to accomplish this, some minor changes were required to the **C++ SDK** elements.

## General upgrade instructions

1. Remove the old PlayFab **C++** or **Blueprint Project SDK**/Plugin from your project(s).
2. See the [Unreal Engine quickstart](quickstart.md), specifically the [Unreal Project Setup](quickstart.md#unreal-project-setup) section for instructions on downloading the new **Marketplace** plugin, and adding it to your project.

## Upgrading from the Blueprint SDK to the Marketplace plugin

We are confident that **Blueprint** users who upgrade a project from the **Blueprint SDK** to the **Marketplace** plugin should not require any additional steps beyond replacing the plugin itself.

If you have any issues, please report them to our [Forums](https://community.playfab.com/index.html).

## Upgrading from the C++ SDK to the Marketplace plugin
  
1. Find your **.Build.cs** file(s).
    - Find the **PlayFab** dependency.
      - It may look like this:
  
        ```cpp
        PublicDependencyModuleNames.AddRange(new string[] { "PlayFab" });
        ```
    - Remove **PlayFab**, and replace it with **PlayFabCommon** and **PlayFabCpp**.
      - The new line will look something like this:
  
        ```cpp
        PublicDependencyModuleNames.AddRange(new string[] { "PlayFabCommon", "PlayFabCpp" });
        ```
  
2. A few classes have been renamed.
    - Most users have used *error callbacks*, so you likely used a PlayFab class named **FPlayFabError**. You will need to find *all* instances of this class, and rename them to **FPlayFabCppError**.
    - It is unlikely - but if you ever used **FPlayFabBaseModel**, you will need to rename that to **FPlayFabCppBaseModel**.
    - In the unlikely scenario that you’ve been using the **LogPlayFab** object for debug logging, please switch over to your *own* log definition. If you need an immediate solution, **LogPlayFab** has been renamed **LogPlayFabCpp**.

If you have additional issues, please report them to our [Forums](https://community.playfab.com/index.html).
