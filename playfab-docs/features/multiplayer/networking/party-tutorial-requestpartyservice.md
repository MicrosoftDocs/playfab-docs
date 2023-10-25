---
title: Request Parties from Your Own Services using RequestPartyService 
author: rachelwu
description: Guide to help you use the RequestPartyService API to Request Parties from Your Own Services
ms.author: rachelwu
ms.date: 10/09/2023
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, party, networking, communication // need some help with this LOL
ms.localizationpriority: medium // yeah what does this even mean
---

# Request Parties from Your Own Services

This tutorial describes the steps to request parties from your own services using the RequestPartyService API, giving you more flexibility and control over how you intergrate PlayFab Party into your game. 

This can be useful for several reasons:

* It allows you to use your own authentication and authorization mechanisms, or customize the user interface and user experience of party creation and joining.
* It enables you to allocate PlayFab Party strictly on your own terms. By restricting relay network allocation to the service side, powerful multi-network topologies can be fully and reliably orchestrated exclusively from your own service or through the use of [PlayStream and CloudScript](https://learn.microsoft.com/en-us/gaming/playfab/data-analytics/acting-data/action-rules-using-cloudscript-actions-with-playstream).
* It adds additional defense against abuse by clients by giving you the power to restrict Party creation to services only.

For a deeper understanding, consult the linked references and conceptual documentation.

## Prerequisites

You need a PlayFab account and have the Party feature enabled. Follow [Party Quickstart](quickstart.md) to intergrate PlayFab Party's core functionalities. 

## Steps

### 1. Gather your PlayFab title secret key from GameManager.
Refer to [Secret Key Management](../../../gamemanager/secret-key-management.md) for more information. 

### 2. Obtain a PlayFab entity token.
Use the [GetEntityToken](https://learn.microsoft.com/en-us/rest/api/playfab/authentication/authentication/get-entity-token?view=playfab-rest) REST API from your service to exchange the title SecretKey for an Entity Token. 

### 3. Make a POST request
Use the retrieved entity token to make a POST request to the [RequestPartyService](https://learn.microsoft.com/en-us/rest/api/playfab/multiplayer/multiplayer-server/request-party-service?view=playfab-rest) endpoint with the desired parameters for the party. 

### 4. Receive a response 
After making the POST request, you will receive a response containing a [network descriptor](https://learn.microsoft.com/en-us/rest/api/playfab/multiplayer/multiplayer-server/request-party-service?view=playfab-rest#requestpartyserviceresponse), which contains all the details necessary for clients connecting to the party server.

### 5. Share the network descriptor
Share the network descriptor with any would-be participants of your network.

### 6. Connect to the Party server
Clients use the network descriptor to connect to the Party server using the native SDKs.

## See also
* [PlayFab Party Just Got More Flexible: Request Parties from Your Own Services](https://developer.microsoft.com/en-us/games/articles/2023/10/playfab-party-request-party-service-launch/)
* [Party features](party-features.md)
* [Party samples](party-samples.md)
* [Multiplayer Services](../mpintro.md)
* [Party invitations and the security model](concepts-invitations-security-model.md)
* [Party API reference documentation](reference/party_members.md)
