---
title: Request Parties from your own services using RequestPartyService 
author: rachelwu
description: Guide to help you use the RequestPartyService API to Request Parties from your own services
ms.author: rachelwu
ms.date: 10/09/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, communication 
ms.localizationpriority: medium 
---

# Request parties from your own services

This tutorial describes the steps to request parties from your own services rather than strictly from the client using the ***RequestPartyService API***, giving you more flexibility and control over how you integrate PlayFab Party into your game through a HTTP call. 

* It allows you to use your own authentication and authorization mechanisms, or customize the user interface and user experience of party creation and joining.
* It enables you to allocate PlayFab Party strictly on your own terms. By managing the relay network from the service side, you can effectively and reliably set up complex network topologies using your own service or with the help of [PlayStream and CloudScript](../../../data-analytics/acting-data/action-rules-using-cloudscript-actions-with-playstream.md).
* It adds additional defense against abuse by clients by giving you the power to restrict Party creation to services only.

## Prerequisites

You need a PlayFab account and have enabled the Party feature. 

1. Create or sign in to your [PlayFab account](https://playfab.com). 
2. [Enable Party feature via Game Manager](enable-party.md) from your PlayFab account.
3. Download and set up Party SDK. For download links, see [Party SDKs](party-sdks.md).

> [!Note]
> This tutorial is an alternative process to some of the steps in the more comprehensive [Party Quickstart](quickstart.md) article. 

### 1. Gather your PlayFab title secret key from GameManager

1. Sign in to **[Game Manager](https://developer.playfab.com/)**.
2. Select your Title.
3. In the upper-right corner, select the gear icon.
4. Select **Title settings**, then select the **Secret Keys** tab.
   
For more information, see [Secret Key Management](../../../gamemanager/secret-key-management.md). 

### 2. Obtain a PlayFab entity token

Use the [GetEntityToken](/rest/api/playfab/authentication/authentication/get-entity-token) REST API from your service to exchange the title SecretKey for an Entity Token.

```js
async function getEntityToken(titleId, secretKey) {
  try {

    // Construct the request URL
    const requestUrl =
      `https://${titleId}.playfabapi.com/Authentication/GetEntityToken`;

    // Create headers with your secret key and content type
    const headers = {
      'X-SecretKey': secretKey,
      'Content-Type': 'application/json', // Add this line
    };

    // Make the POST request
    const response = await fetch(requestUrl, {
      method: 'POST',
      headers: headers,
    });

    // Check if the response is successful
    if (response.ok) {
      const responseBody = await response.json();
      console.log(`Entity Token: ${responseBody.data.EntityToken}`);
      return responseBody.data.EntityToken;
    } else {
      console.error(`Error: ${response.status}`);
    }
  } catch (error) {
    console.error(`Exception: ${error.message}`);
  }
}
```

### 3. Make a POST request

Use the retrieved entity token to make a POST request to the [RequestPartyService](/rest/api/playfab/multiplayer/multiplayer-server/request-party-service) endpoint with the desired parameters for the party. 

```js
async function requestPartyService(titleId, entityToken) {
  try {

    // Construct the request URL
    const requestUrl = `https://${titleId}.playfabapi.com/Party/RequestPartyService`;

    // Create headers with the entity token and content type
    const headers = {
      'X-EntityToken': entityToken,
      'Content-Type': 'application/json',
    };

    // Create the request body with PartyNetworkConfiguration and PreferredRegions
    const requestBody = {
      NetworkConfiguration: {
        MaxUsers: 4,
        MaxDevices: 4,
        MaxDevicesPerUser: 1,
        MaxUsersPerDevice: 1,
      },
      PreferredRegions: ['WestUs'],
    };

    // Make the POST request
    const response = await fetch(requestUrl, {
      method: 'POST',
      headers: headers,
      body: JSON.stringify(requestBody),
    });

    // Check if the response is successful
    if (response.ok) {
      const responseBody = await response.json();
      console.log('Party service response:', responseBody);
    } else {
      console.error(`Error: ${response.status}`);
    }
  } catch (error) {
    console.error(`Exception: ${error.message}`);
  }
  return null;
}
```

### 4. Receive a response

After making the POST request, you'll receive a response containing a [network descriptor](/rest/api/playfab/multiplayer/multiplayer-server/request-party-service#requestpartyserviceresponse), which contains all the details necessary for clients connecting to the party server.

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "PartyId": "0543645b-9004-4784-95d7-459cef4a23fa",
        "SerializedNetworkDescriptor": "AwBnP28mW2RDBQSQhEeV10Wc70oj+ldlc3RVcwAAAAAAAAAAAAAAAAAAPXqiEpapxSC+Owo1h8qJ5NuEOmtS0oeJqq8h6q5ybZZrbktkbnMtaXIwLTgxZTUtNTI3MWZiZDYtMmMyYS00NGE0LThhNjAtNmZlZjI4ZDAzMjc5Lndlc3R1cy5jbG91ZGFwcC5henVyZS5jb20=",
        "InvitationId": "e95366d4-c9ed-4a6e-94f6-215c1d69d467"
    }
}
```

### 5. Share the network descriptor

Share the network descriptor with any would-be participants of your network. There are a variety of ways to do this.  Clients using PlayFab Lobby should follow guidance in [Integrate Party with Lobby](party-lobby-integration.md). You may also [manually share](quickstart.md#manually-share-party-network-descriptor) the Party network descriptor for quick testing purposes or use your own lobby service and invites based on the needs of your game.

### 6. Connect to the Party server

Clients can use the network descriptor to connect to the Party server using the native SDKs as usual. If this is your first time connecting to a Party network, see [Connect to a Party network](quickstart.md#connect-to-a-party-network) section of the Quickstart guide. 

## See also

* [Party quickstart](quickstart.md)
* [Party features](party-features.md)
* [Party samples](party-samples.md)
* [Multiplayer services](../mpintro.md)
* [Party invitations and the security model](concepts-invitations-security-model.md)
* [Party API reference documentation](reference/party_members.md)
