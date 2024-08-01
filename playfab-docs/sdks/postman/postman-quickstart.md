---
title: Quickstart PlayFab REST API collection for Postman
author: nathankong-microsoft
description: This guide helps you make your first PlayFab API call using Postman.
ms.author: timcra
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, postman, ssl/tls protocols, chrome, google, rest, sdk, api
ms.localizationpriority: medium
---

# Quickstart: PlayFab REST API collection for Postman

Get started with the PlayFab REST API collection for Postman. Follow steps to install the package and try out example code for basic tasks. PlayFab is a complete backend platform for live games. Use the PlayFab REST API collection for Postman to:

- Get an entity token
- Add/modify/delete entities in a title
- Configure title content

[API reference documentation](../../api-references/index.md) | [PlayFab Postman Collection GitHub repository](https://github.com/PlayFab/PostmanCollection)

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/sign-up)
- The [Postman native app](https://www.getpostman.com/)
- An OS running [TLS](/windows/win32/secauthn/transport-layer-security-protocol) 1.2 or higher ([Windows support for TLS 1.2](/dotnet/framework/network-programming/tls#support-for-tls-12))

### Adding PlayFab Collections

- Create Workspace

  > [!div class="mx-imgBorder"]
  > ![Postman Select Create Workspace](./media/tutorials/postman-new-create-workspace.png "Postman Select Create Workspace")

  > [!div class="mx-imgBorder"]
  > ![Postman Create Workspace](./media/tutorials/postman-new-create-workspace2.png "Postman Create Workspace")

- Select **Import** *(top left of the window)*

  > [!div class="mx-imgBorder"]
  > ![Postman Import](./media/tutorials/postman-new-import.png "Postman Import")

- Select **Link**

  > [!div class="mx-imgBorder"]
  > ![Postman Select Import From Link](./media/tutorials/postman-new-import-from-link.png "Postman Select Import From Link")

  > [!div class="mx-imgBorder"]
  > ![Postman Import From Link](./media/tutorials/postman-new-import-from-link2.png "Postman Import From Link")

- Paste the following link into the URL text box and select **Continue** and **Import**

    https://raw.githubusercontent.com/PlayFab/PostmanCollection/master/playfabV2.json

  - If you're trying to download the beta SDK, go to the playfabV2.json file in the [Postman Beta GitHub repository](https://github.com/PlayFab/PostmanCollection/blob/master/playfabV2.json)
  - Select **View Raw**

    > [!div class="mx-imgBorder"]
    > ![Postman View Raw Beta JSON](./media/tutorials/postman-new-view-raw-beta.png "Postman View Raw Beta JSON")
  - Copy the URL from the browser, paste the link into the URL text box and select **Continue** and **Import**

- You should now see the PlayFab Postman SDK under the Collections tab *(top left of the window)*

  > [!div class="mx-imgBorder"]
  > ![Postman PlayFab Collection](./media/tutorials/postman-new-playfab-collection.png "Postman PlayFab Collection")

### Adding Environment Variables

- Select **Environments** and **Create Environment** to create a new environment

  > [!div class="mx-imgBorder"]
  > ![Postman Manage Environments](./media/tutorials/postman-new-manage-environments.png "Postman Manage Environments")

- Name your environment - we recommend "[titleId] - Test Environment"

> [!NOTE]
> You can find your title id by logging into [Game Manager](https://developer.playfab.com/en-us/my-games) and copying the hex value below your title name on the **My Studios and Titles** main page.

- Add the following 3 variables to the environment:

  | Variable    | Initial Value  | Current Value |
  | ----------- | -------------- | ------------- |
  | TitleId     | [titleId]      | [titleId]     |
  | SecretKey   | [secretKey]    | [secretKey]   |
  | EntityToken |                |               |

> [!NOTE]
> You can learn more about title secret keys and where to find them in the [Secret Key Management](../../gamemanager/secret-key-management.md) documentation.

  > [!div class="mx-imgBorder"]
  > ![Postman Create Environment](./media/tutorials/postman-new-create-environment.png "Postman Create Environment")

- When finished, select **Save** to save your new environment
- Select the environment dropdown to switch to your new environment *(top right of the window)*

  > [!div class="mx-imgBorder"]
  > ![Postman Select Environment](./media/tutorials/postman-new-select-environment.png "Postman Select Environment")

### Getting a Title Entity Token

One way to interact with PlayFab's [Entity Programming Model](../../features/data/entities/index.md) is to get a Title Entity Token. This can be useful if you want to make changes to title config data, or if you want to make adjustments to a large number of players:

- Under the **PlayFab Collections** folder, expand the **Authentication** namespace and select `GetEntityToken`
- Under **Headers**, uncheck `X-Authorization`
  
  > [!div class="mx-imgBorder"]
  > ![Postman Get Entity Token Header](./media/tutorials/postman-new-get-entity-token-header.png "Postman Get Entity Token Header")
- Select **Send**
- Set the returned entity token to your `EntityToken` environment variable
  - In the response, highlight the `EntityToken` string
  - Right-click and select **Set: [Environment]** for your new environment
  - Select **EntityToken**
  
    > [!div class="mx-imgBorder"]
    > ![Postman Set Entity Token Variable](./media/tutorials/postman-new-set-entity-token-variable.png "Postman Set Entity Token Variable")

> [!NOTE]
> Entity tokens expire after **24 hours**. Afterwards, you need to re-run `GetEntityToken` to get a new entity token and update your environment variable

### Getting a Title_Player_Account Entity Token

Another way to interact with PlayFab's [Entity Programming Model](../../features/data/entities/index.md) is to get a Title_Player_Account Entity Token. This is useful if you want to make changes to a single player:

- Under the **PlayFab Collections** folder, expand the **Client** namespace and select `LoginWithCustomID`
- Under **Body**, change the `CreateAccount` value from `false` to `true`
- Select **Send**
- Set the returned entity token to your `EntityToken` environment variable
  - In the response, highlight the `EntityToken` string
  - Right-click and select **Set: [Environment]** for your new environment
  - Select **EntityToken**

    > [!div class="mx-imgBorder"]
    > ![Postman Get Title_Player_Account Entity Token](./media/tutorials/postman-new-get-title_player_account-entity-token.png "Postman Get Title_Player_Account Entity Token")

## Troubleshooting

- Title ID / secret key mismatch
  - If you're trying to get a title entity token and receiving a `401: Unauthorized` error, make sure the title ID and secret keys are correct by logging into [Game Manager](https://developer.playfab.com/en-us/my-games)
- Expired entity token
  - If you previously obtained an entity token and are unsuccessfully attempting to call other APIs, your entity token might be expired. Get another entity token, save it into the `EntityToken` environment variable, and attempt to call the previous API again
- Incorrect entity token type
  - There are different types of entities (see [Available built-in entity types](../../features/data/entities/available-built-in-entity-types.md)). Different APIs allow different entity types - for example, you might be attempting to call `GetLanguageList` with a title_player_account entity token instead of a title entity token 
- Incorrect environment:
  - Make sure you're using the proper environment by checking the environment dropdown *(top right of the window)*

## Next Steps

You now have an entity token to pass into other API calls to start setting up your PlayFab title.

> [!div class="nextstepaction"]
> [PlayFab Quickstarts >](/gaming/playfab/gamemanager/quickstart)
> [!div class="nextstepaction"]
> [API References >](../../api-references/index.md)
