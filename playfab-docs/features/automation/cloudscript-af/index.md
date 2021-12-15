---
title: CloudScript using Azure Functions
author: williacj
description: Overview of the PlayFab CloudScript using Azure Functions
ms.author: cjwill
ms.date: 09/22/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, cloudscript, azure functions
ms.localizationpriority: medium
---

# PlayFab CloudScript using Azure Functions

PlayFab CloudScript using Azure Functions is a new feature that enables serverless compute on demand in the language of your choice.  In order to do this we leverage Azure Functions and provide you with a tight integration via Visual Studio Code.  

Using Azure Functions to run cloud code that is bound to a PlayFab title gives you the power of C# and strongly typed code. It also gives you the ability to leverage any number of Azure features such as CosmosDB.

Basing CloudScript to be based on Azure Functions brings a few key improvements:

1)	Ability to write Cloudscript in C# as well as Javascript and the [other supported Azure Functions languages](https://docs.microsoft.com/azure/azure-functions/supported-languages)
2)	Ability to locally debug Cloudscript using [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/).
3)	Ability to write queued Cloudscript functions that can run for extended periods of time since we asynchronously wait for it to complete.
4)  No limits to the number of API calls within the Azure Function code.  


### Type of Cloud Script using Azure Functions
One of the major new capabilities of CloudScript is the ability to have long running CloudScript.  This is introduced by having a new type of Cloud Script based on Azure Functions queued storage triggered Cloud Script.  With this new type of CloudScript, you will need to decide the type of CloudScript to use for each CloudScript you create. 

For more information about the advantages and limitations of each type of function you can read the Azure documentation of each:
* [HTTP Triggered Cloud Script](https://docs.microsoft.com/azure/azure-functions/functions-bindings-http-webhook?tabs=csharp)

* [Queued Triggered Cloud Script](https://docs.microsoft.com/azure/azure-functions/functions-bindings-storage-queue)

### Pricing

To use this feature, you **must** bring your own Azure subscription. This means that usage charges will apply to your Azure subscription the same as if you used Azure Functions without a PlayFab integration. For more information about pricing, see [Azure Function pricing](https://azure.microsoft.com/pricing/details/functions/) on the Azure site.

### Getting Started
To get started with Azure Functions using read our [quickstart guide](quickstart.md) and watch our [getting started video](https://youtu.be/apQbkDn1lNo).
