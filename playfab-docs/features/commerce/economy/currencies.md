---
title: Currencies
author: v-thopra
description: Describes the Currencies tab in the Economy section in Game Manager, and how to configure Virtual Currency.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, currency, virtual currency
ms.localizationpriority: medium
---

# Currencies

This tutorial describes the function of the **Currencies** tab in the **Economy** section in **Game Manager**. 

**Virtual Currencies** are the foundation of in-**Game** economies. **Players** and **Characters** can be granted these **Currencies**, which can then be used to buy or trade **Items**. **Items** can have a cost in either a **Virtual Currency** or **Real Money**. 

It's *exactly* like real life - except its *virtual*! Economic regulation in-**Game** is up to *you*.

## What is Virtual Currency?

**Virtual Currencies** provide a medium of exchange for **Players** to purchase **Virtual Items** and **Services** from within a **Title**.

Each **Title** can support multiple arbitrary **Virtual Currencies**. This provides flexibility for your **Game** to implement whatever medium of exchange you desire (e.g. **Gold**, **Gems**, **Hearts** or **Interstellar Credits**).

After the initial setup, **Store** and **Catalog Items** can now be assigned prices corresponding to the **Virtual Currencies**.

Our **Game Manager** provides tools to make managing your virtual economy straightforward and reliable.

## Field Reference

This section describes each **Field** you see in the **Game Manager Economy Currencies** tab. 

All **Fields** are required - however both **Currency Code** and **Display Name** are not pre-populated with default **Values**.

Leaving **Recharge Rate** and **Recharge Max** set to **zero** (default) will specify that this **Currency** amount will not auto-regenerate.

### Currency Code

**Currency Code** is a required **Field**. It represents the **Currency**, and will be used in the other **Economy** sections.

It *must be* a two-character code and convention is *all upper-case* (although a two-digit number is also allowed).

> [!NOTE]
> **RM** is reserved for **Real Money** and cannot be used as a **Currency Code**.

### Display Name

**Display Name** is a required **Field**. It represents the **Name** that is attached to the **Currency** that is typically displayed to the **User** in your **Game**.

The only restriction is that it must be *at least one letter long*. Common examples include **Gold** or **Space Bux**.

### Initial Deposit

**Initial Deposit** represents how much of this **Virtual Currency** is given to each **Player** when they first sign-up for a **PlayFab** account. This is often the first time they play your **Game**.

### Recharge Rate (Units/Day)

**Recharge Rate** is an *optional* **Field**. It specifies how much of this **Virtual Currency** is granted to each **Player** per day.

**Virtual Currency** that is granted to the **Player** via a **Recharge Rate** is granted to them gradually, and is evenly distributed over a 24 hour period.

## Example

To create a **Virtual Currency**, you should use the following steps:

1. Select your **Game** in **Game Manager**.
2. Choose **Economy**.
3. Select **Currencies**.
4. Choose **Add Currency**.
5. Set the **Currency Code**. We'll use **GO** in this example.
6. Set the **Display Name**. We'll use **Gold** in this example.
7. Set the **Initial Deposit**. We'll use **1000** in this example. This gives new **Players** some **1,000 units** of this **Virtual Currency** when they begin the **Game**.
8. We don't give them any additional **Virtual Currency** every day, so we're done.
9. Select **Save**.
10. Refresh the page.

Your new **Virtual Currency** is now added. The greyed-out **Currency Code** means your new **Currency** has been saved.

Don't be confused by the persistent **SAVE** button. It is necessary for subsequent operations on your **Currency**, such as deleting or renaming.
