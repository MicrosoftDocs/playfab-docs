---
title: Email messaging quickstart
author: joannaleecy
description: Quickstart for email messaging.
ms.author: joanlee
ms.date: 06/12/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, engagement, email, servers, smtp, messaging
ms.localizationpriority: medium
---

# Email messaging quickstart

To send emails from PlayFab, you will need to have your own external SMTP server with a username and password. Once you have an SMTP server available, check out [Setting up an SMTP server with add-ons](../../engagement/emails/setting-up-an-smtp-server-with-add-ons.md) to configure your title to send emails.

> [!NOTE]
> You can use Gmail as an SMTP server for testing - but with Gmail, you are limited to 2,000 emails per day.

Once your SMTP Server is set up and configured in PlayFab, you can follow our tutorials for [Using a rule to verify a contact email address](using-a-rule-to-verify-a-contact-email-address.md) or [Using email templates](using-email-templates-to-send-an-account-recovery-email.md)

You can also use the following APIs to manage player contact information and email functionality:

- [AddorUpdateContactEmail](xref:titleid.playfabapi.com.client.accountmanagement.addorupdatecontactemail) - Updates or adds a contact email to the player’s profile.
- [RemoveContactEmail](xref:titleid.playfabapi.com.client.accountmanagement.removecontactemail) - Deletes a contact email from the player’s profile.
- [SendEmailFromTemplate](xref:titleid.playfabapi.com.server.accountmanagement.sendemailfromtemplate) - Sends a template email to a player’s primary contact email.
- [SendAccountRecoveryEmail](xref:titleid.playfabapi.com.admin.accountmanagement.sendaccountrecoveryemail) - Sends an Account Recovery email to the specified player.
- [ResetPassword](xref:titleid.playfabapi.com.admin.accountmanagement.resetpassword) - Resets the player’s password for a given title.
- [GetPlayerIdFromAuthToken](xref:titleid.playfabapi.com.admin.accountmanagement.getplayeridfromauthtoken) - Gets a player’s ID from an authorization token.
