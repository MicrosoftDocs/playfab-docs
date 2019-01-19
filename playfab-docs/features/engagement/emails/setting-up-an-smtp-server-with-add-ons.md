---
title: Setting up an SMTP server with Add-ons
author: v-thopra
description: Describes how to set up an SMTP add-on to support sending custom emails through PlayFab.
ms.author: v-thopra
ms.date: 08/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, engagement, email, servers, smtp
ms.localizationpriority: medium
---

# Setting up an SMTP server with Add-ons

This tutorial walks you through how to set up an **SMTP Add-on** to support sending custom emails through **PlayFab**.

## Requirements

- **Game Manager** will be required, as a **Title's SMTP** server is set up using an **Add-on**. Read our [Game Manager Quickstart](../../config/gamemanager/quickstart.md) if you are unfamiliar with it.

## Go to the add-on page and install SMTP

In **Game Manager**:

- Go to **Add-ons**.
- Under the **Marketing** section, there will be an **SMTP Add-on**.
- Select the **Add-on**. It should look like the example shown below.

![Marketing-SMTP Add-On button](media/tutorials/marketing-smtp-add-on-button.png)  

- This will redirect you to the **Add-on** page.
- Select the **INSTALL SMTP** button.

![Game Manager-Add-ons-SMTP-page](media/tutorials/game-manager-add-ons-smtp-page.png)  

## Configure SMTP

A form should appear with the **Host name**, **Port number**, **Username**, and **Password** fields.

![Game Manager-Add-ons-Install SMTP form](media/tutorials/game-manager-add-ons-install-smtp-form.png)  

- Fill out the form with **Host name**, **Port number**, **Username**, and **Password** for your **SMTP** server.
- Select the **SAVE SETTINGS** button, and the **Add-on** should now be installed.

> [!NOTE]
> If your **SMTP** server requires **SSL/TLS**, use **port 587**.

## Testing

For **Testing** this feature, you can use the **Gmail SMTP** server, provided you have a **Gmail** account. To use **Gmail**, fill in the fields as follows:

- Host name: **smtp.gmail.com**
- Port number: **587**
- Username: (**your gmail address**. E.g., "support@playfab.com")
- Password: (**your password**)

> [!NOTE]
> If you have 2-factor authentication enabled, you will need to create an **App Password**. See [Sign in using an App password](https://support.google.com/accounts/answer/185833?hl=en) for more information.

The **SMTP Add-on** is now installed, and will show a green check and message indicating success.

![Game Manager-Add-ons-SMTP-Installed](media/tutorials/game-manager-add-ons-smtp-installed.png)  
