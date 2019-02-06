---
title: PHP quickstart
author: v-kciril
description: Quickstart for the PlayFab PHP SDK.
ms.author: v-kciril
ms.date: 01/22/22
ms.topic: article
ms.prod: playfab
keywords: playfab, php, playfab php sdk
ms.localizationpriority: medium
---

# PHP quickstart

This quickstart will get you up and running with the PHP SDK.

> [!Note]
> This SDK is currently in Beta, so please let us know if you run into any issues.

## PHP project setup

* Install PHP 7.1
* Install Apache 2.4
* Setup SSL on both. Enable the SSL modules on both, and link PHP and Apache together.
* Set up a ca-bundle.crt file in your PHP installation:
  * Although not the best solution long-term, when hosting or testing on localhost, the easiest way is to just get one online: https://github.com/bagder/ca-bundle/
  * Otherwise, the recommended way is to get one from the certificate authority where you purchased your website SSL certificate.
* Copy the contents of our SDK into your ./Apache24/htdocs folder.
* Run Apache.

## Finish and execute

If you set up everything correctly, this page should work: https://localhost/ExampleProject/gui.php

* Set your PlayFab TitleId at the top.
* Select Client, and LoginWithCustomID
* Put this in JsonRequest:
  * {"CustomID":"GettingStartedGuide", "CreateAccount": true}
* Press "Send"

## Pending changes

This guide and example describe using the Client API via your PHP server. This is not a best practice. Your game should use the JavaScriptSdk for client calls, from the client HTML. Your server logic should make server API calls as needed, and you should implement your own server logic between your client and our server API.