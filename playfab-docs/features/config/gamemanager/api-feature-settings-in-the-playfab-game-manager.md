---
title: API Feature Settings in the PlayFab Game Manager
author: v-thopra
description: Describes the options in the PlayFab Game Manager for managing the behavior of PlayFab APIs.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, game manager, api access, privacy
ms.localizationpriority: medium
---

# API Feature Settings in the PlayFab Game Manager

The **API Features** in the **PlayFab Game Manager** are a handful of options for managing the behavior of **PlayFab APIs** for your **Title**.

These options give you the tools for managing access, privacy, and other features.

To find the screen for configuring these options:

- Go to the **Game Manager**.
- Select **Settings** from the menu to your left.
- Select the **API Features** tab.

![Game Manager - Settings - API Features](media/tutorials/game-manager-settings-api-features-full.png)  

Some of these check-boxes are obvious, and some not so much. In this tutorial, we will go into detail about several of them.

> [!NOTE]
> Several screenshots and demonstrations in this tutorial utilize [Postman](../dev-test-live/executing-the-playfab-api-via-postman.md).

## Requiring valid JSON for custom data values

Hacked **Clients** can cause *some serious* problems for games. Rogue **API** callers posting badly formatted data can produce noise, bugs, and issues for developers. **Players** who have poorly formatted data will often require manual intervention to cleanup.

Requiring valid **JSON** for custom data values will perform basic content type validation *before* data is saved to the database. Catching these problems early prevents these issues from lingering on, and stops hackers from interfering with normal development.

When this flag is set, it forces **Clients** to pass in valid **JSON** for each **Key** of their custom data. Simple **JSON** validation by itself won't prevent *all* issues, but can help weed out some bad behavior.

Checking this option will require that each **Key** saved across all custom data, including **Player**, **Publisher**, **Character**, **Title**, and **Item data** must be valid **JSON**.

> [!NOTE]
> This flag can be toggled **on** or **off** at any time. But, it’s *not retroactive*. So existing values will *not* be affected. *Only newly written values will be validated.*

If you attempt to pass invalid **JSON** as a value, it will reject the request with an **HTTP Status Code 400 *Bad Request***.

![Postman - Sending invalid JSON](media/tutorials/postman-sending-invalid-json.png)  

## Disabling all API request access

Surprisingly, it can be useful to disable all **API** access to your **Titles**.

If, for example, you are performing a sensitive migration with downtime, stray **API** requests could cause serious interruptions. If you are retiring your game, this will guarantee your game really is off.

> [!WARNING]
> Keep in mind, that marking this checkbox will **LITERALLY BREAK YOUR GAME**, so use it with caution!

Once you have decided you need to turn **API** access off, and you check the box, all **API** requests will begin to fail within a few minutes. 

**PlayFab** will return an **HTTP Status Code 400 "Bad Request"** indicating that the **Title** has disabled such usage.

![Postman - Accessing a disabled API](media/tutorials/postman-accessing-a-disabled-api.png)  

These **HTTP Status Code 400** responses will persist until you un-check the box. Again, un-checking may take a few minutes to have effect.

## Enabling player IP address obfuscation

For many **Studios**, owning **Personally Identifiable Information (PII)** is a liability best avoided. One common (and useful) form of **PII** is **IP Address**.

**IP Address** is useful for a handful of reasons, including geo-location. However, the *full* accuracy of the **IP** is often considered **PII**.

**PlayFab** can help limit this is by obfuscating parts of the **IP** addresses. Now, by checking a box, you can stop gathering this sensitive data.

After you check this box, **PlayFab** will always record **0** for the last octet of a **Player's IP**. You can verify this is working by checking the login history for **Players** in the **Players** tab.

You should see that every **IP** ends in **.0**. Note that any **IPs** that were recorded before **IP** address obfuscation was enabled will retain their full detail. So if your game is **PII** sensitive, set this checkbox before you launch.

> [!NOTE]
> Enabling obfuscation will impact *other* features that use the IP address. In particular, **IP**-based geo-location and **Player Bans** by **IP** are the two most directly impacted.

**PlayFab** automatically performs **IP**-based geo-location on logins. This helps you automatically determine where on earth your **Players** come from.

However, you may experience reduced accuracy, *particularly* at the city level, when using obfuscated **IPs**. This is intentional, as the goal of obfuscating **IPs** is to avoid recording **PII**, including exact locations.

Additionally, obfuscating **IPs** can affect **Bans**. When adding a **Ban**, you can optionally ban an **IP** as well. Often banning by **IP** is more practical than banning one account at a time, because the bad actor can just make new accounts.

Banning an **IP** prevents the bad actor from making new accounts from the same internet connection. In many cases, this is an effective tool.

However, with obfuscated **IPs**, banning an exact **IP** cannot work. Instead, you must use a **Ban** on an **IP** with **.0** as the final octet.

![Game Manager - Players - Add Ban](media/tutorials/game-manager-players-add-ban.png)  

However, keep in mind this will effectively **Ban** an *entire* **IP** range.

This will still **Ban** the bad actor, but other innocent **Players** with similar **IP** addresses may be affected. Furthermore, existing precise **IP Bans** will cease to be effective.
