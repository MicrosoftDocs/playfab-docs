---
title: Quickstart
author: cybtachyon
description: Get started with the new Economy v2 features.
ms.author: derekreese
ms.date: 07/27/2023
ms.topic: quickstart
ms.service: azure-playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Catalog v2 quickstart

[!INCLUDE [notice](../../includes/_economy-release.md)]

After becoming familiar with Game Manager, you can:

1. Set up a v2 Catalog's permissions, settings, and items.
1. Set up Receipt Validation
1. Walk through purchasing an item

See the [Unity-specific Tutorial](tutorials/getting-started-with-unity-and-android.md) for a detailed walkthrough in Unity.

## Part 1: Catalog overview

### Step 1 – Get permissions

The first step is to enable the catalog in the settings page in the Game Manager UI under ⚙️ **Title Settings** > **Economy (V2)**. You can use the `UpdateCatalogConfig` API and set the `IsCatalogEnabled` flag to true.

To interact with the Catalog, you either need to Log into GameManger and use the site tools, or get an Entity Token for using the APIs. The easiest way to get an entity token is with the [GetEntityToken](/rest/api/playfab/authentication/authentication/get-entity-token) API.

> [!NOTE]
> To call the API as an admin or authoritative service, which you will need to do before you create your first Catalog item, you’ll need to include an X-SecretKey header with a title secret key. You can create title secret keys in the Game Manager UI under ⚙️ **Title Settings** > **Secret Keys**.

#### [API](#tab/secret-key-api)

```bash
curl \
  -H "X-SecretKey: {{SecretKey}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{titleId}}.playfabapi.com/Authentication/GetEntityToken \
  -d "{\"CustomTags\": {\"user\": \"{{email}}\"}}"
```

#### [C# SDK](#tab/secret-key-csharp)

```csharp
// ENABLE_PLAYFABSERVER_API symbol denotes this is an admin-level game server and not a game client.
private static async Task PlayFabEconomyv2QuickStart()
{
#if ENABLE_PLAYFABSERVER_API
    string systemGUID = Environment.GetEnvironmentVariable("SYSTEM_GUID", EnvironmentVariableTarget.Process);
    PlayFabSettings.staticSettings.DeveloperSecretKey =
        Environment.GetEnvironmentVariable("PLAYFAB_SECRET_KEY", EnvironmentVariableTarget.Process);

#endif
    PlayFabSettings.staticSettings.TitleId =
        Environment.GetEnvironmentVariable("PLAYFAB_TITLE_ID", EnvironmentVariableTarget.Process);
    PlayFab.EconomyModels.EntityKey gameEntityKey = new()
    {
        Type = "title",
        Id = PlayFabSettings.staticSettings.TitleId
    };

    PlayFabResult<GetEntityTokenResponse> gameTokenRequest = null;
    try
    {
        gameTokenRequest = await PlayFabAuthenticationAPI.GetEntityTokenAsync(new GetEntityTokenRequest()
        {
            CustomTags = new Dictionary<string, string>
            {
#if ENABLE_PLAYFABSERVER_API
                { "server", systemGUID }
#endif
            }
        });
        if (gameTokenRequest.Error != null)
        {
            throw new Exception(gameTokenRequest.Error.GenerateErrorReport());
        }
    }
    catch (Exception e)
    {
        Console.WriteLine(string.Format("PlayFab Auth Error: {0}", e));
        return;
    }

    PlayFabAuthenticationContext gameAuthContext = new()
    {
        EntityToken = gameTokenRequest.Result.EntityToken,
    };
}
```

***

> [!TIP]
> It's best practice when calling as an Admin for a Title, a.k.a. without a [SessionTicket](/rest/api/playfab/server/authentication/authenticate-session-ticket) from a user login, to include a _CustomTags_ entry logging who is making the call - whether it's you, a server, or an automated script. This makes it easier to trace changes and identify issues when querying your PlayFab logs.

### Step 2 - Configure your Catalog Settings

[Catalog Settings](settings.md) include many different configurations, from Content Types to User-Generated Content. You can update and retrieve them all through the API, and easily visualize many of them in Game Manager.

#### [Game Manager](#tab/catalog-settings-game-manager)

1. In [Game Manager](../../gamemanager/index.md), navigate to ⚙️ **Title Settings** > **Economy**.
1. Under the **Catalog (V2)** tab, go to **Catalog Settings**
1. Create a default _Content Type_ (creating a "Game Item" type is a good place to start).

#### [API](#tab/catalog-settings-api)

Call the [Catalog/GetCatalogConfig](/rest/api/playfab/economy/catalog/get-catalog-config) method, and then [UpdateCatalogConfig](/rest/api/playfab/economy/catalog/update-catalog-config) the Catalog ContentTypes array with a Catalog Type.  

```bash
curl \
  -H "X-SecretKey: {{SecretKey}}" \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/GetCatalogConfig \
  -d "{\"CustomTags\": {\"user\": \"{{Email}}\"}}"

curl \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/UpdateCatalogConfig \
  -d "{\"Config\": {{{CatalogConfig}}}, \"CustomTags\": {\"user\": \"{{Email}}\"}}"
```

Example return payload for a title with some content types for Catalog and UGC:

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "Config": {
            "IsCatalogEnabled": true,
            "AdminEntities": [...],
            "Catalog": {
                "ContentTypes": [
                    "gameitem",
                    "enemy",
                    "weapon",
                    "armor",
                    "levelupstats"
                ],
                "Tags": [...]
            },
            "DeepLinkFormats": [],
            "DisplayPropertyIndexInfos": [
                {
                    "Name": "TestSearchable",
                    "Type": "SearchString"
                }
            ],
            "ReviewerEntities": [],
            "UserGeneratedContent": {
                "ContentTypes": [
                    "weapon",
                    "armor"
                ],
                "Tags": [...]
            },
            ...
        }
    }
}
```

***

### Step 3 - Publish an Item to the Catalog

#### [GameManager](#tab/publish-item-game-manager)

Navigate to **Economy** > **Catalog (V2)**.

Under the **Items** tab, select **New Item**.

Fill in the required metadata – there are only four required properties (_Creator Type_, _Title_, _Start date_, and _Content type_). Select **Publish**.

> [!TIP]
> Creator Type defaults to "title" - although there may be instances where Players are creating items for your game. In that case, you would select "title_player_account".
> Fields with the _Edit JSON_ option are keyed by metadata such as the localization language which defaults to "neutral".
> All dates are UTC.

```json
{
  "NEUTRAL": "My Game Item",
  "en-US": "My Game Item"
}
```

#### [API](#tab/publish-item-api)

Create a "Draft" Catalog Item by calling the [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item) endpoint:

* The EntityToken (from GetEntityToken or other PlayFab `login` call) in the X-EntityToken header
* The Playfab Title ID in the item’s CreatorEntity.Id

```bash
curl \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/CreateDraftItem \
  -d "{{Data}}"
```

Data:

```json
{
  "Item": {
    "CreatorEntity": {
      "Id": "{{TitleID}}",
      "Type": "title"
    },
    "Type": "catalogItem",
    "ContentType": "gameitem",
    "Title": {
      "NEUTRAL": "My Amazing Fire Sword",
      "en-US": "My Lit Lit Sword"
    },
    "StartDate": "2023-07-27T00:00:00.000Z",
    "Tags": [
      "weapon"
    ]
  },
  "Publish": true,
  "CustomTags": {
    "user": "{{Email}}"
  }
}
```

#### [C# SDK](#tab/publish-item-cssdk)

```csharp
private static async Task PlayFabEconomyv2QuickStart()
{
    // Continued from above example...
    CreateDraftItemRequest gameFireItem = new()
    {
        AuthenticationContext = gameAuthContext,
        Item = new CatalogItem()
        {
            CreatorEntity = gameEntityKey,
            Type = "catalogItem",
            ContentType = "gameitem",
            Title = new Dictionary<string, string>
            {
                { "NEUTRAL", "My Amazing Fire Sword" },
                { "en-US", "My Lit Lit Sword" }
            },
            StartDate = DateTime.Now,
            Tags = new List<string>
            {
              "weapon"
            }
        },
        Publish = true,
        CustomTags = new Dictionary<string, string>
        {
            { "server", systemGUID }
        }
    };
    PlayFabResult<CreateDraftItemResponse> gameDraftItemResponse = null;
    try
    {
        gameDraftItemResponse = await PlayFabEconomyAPI.CreateDraftItemAsync(gameFireItem);
        if (gameDraftItemResponse.Error != null)
        {
            throw new Exception(gameDraftItemResponse.Error.GenerateErrorReport());
        }
    }
    catch (Exception e)
    {
        Console.WriteLine(string.Format("PlayFab CreateDraftItem Error: {0}", e));
        return;
    }
    Console.WriteLine(string.Format("PlayFab CreateDraftItem Success: {0}",
        JsonConvert.SerializeObject(gameDraftItemResponse.Result, Formatting.Indented)));
}
```

***

> [!NOTE]
> Putting the item into a Draft state is not required – Draft is meant for when you expect to iterate on the metadata for some period of time. We support the parameter "publish”, that when set to "true" will publish the item immediately. This could save you some call volume depending on your pattern.

Once an Item is in Draft, you can then push it to a ‘Published’ state using the [PublishDraftItem](/rest/api/playfab/economy/catalog/publish-draft-item) endpoint (this step is handled invisibly in GameManager). Once an item is Published, it's searchable and available publicly. You need to use the ItemId returned from the CreateDraftItem response in order to publish.

### Step 4 - Do a search

Once the Publish call succeeds, the Item can be searched for using the previously published ItemId and [SearchItems](/rest/api/playfab/economy/catalog/search-items) endpoint. The Catalog/Search API executes a search against the published catalog using a set of parameters provided to the API, returning a set of paginated results.

#### [Game Manager](#tab/search-game-manager)

Game Manager search is self-explanatory and exists on each Catalog v2 page. _Published_ and _Draft_ filters are at the top. Select the _Filters (Funnel)_ icon next to the _Search_ button to see the list of filters. Select `Enter ODATA filter` to add an OData filter.

#### [API](#tab/search-api)

```bash
curl \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/SearchItems \
  -d "{{Data}}"
```

```json
{
  "Search": "Fire",
  "Filter": "tags/any(t:t eq 'desert') and contentType eq 'gameitem'",
  "OrderBy": "lastModifiedDate asc",
  "ContinuationToken": "abc=",
  "Count": 2
}
```

Save the ID returned for later in this Quickstart.

***

> [!NOTE]
> Catalog/search filter, orderBy, and select fields use [OData](/odata/concepts/queryoptions-overview) as the query standard.

## Part 2: Inventory and Virtual Currencies overview

Inventory Items and Virtual Currencies are the two in-game ‘buckets’ of virtual goods that PlayFab supports for Player Entities. The process is:

1. Set up an initial Virtual Currency
1. Create an Item with a Virtual Currency Cost
1. Add the item to a player's Inventory

### Step 1: Creating a Currency

Virtual currencies are the foundation of in-game economies. Players and characters can be granted these currencies, which can then be used to buy or trade items.

Items can have a cost in either a virtual currency or real money. Each title can support multiple arbitrary virtual currencies. Currencies provide flexibility for your game to implement whatever medium of exchange you desire (for example, gold, gems, hearts, or interstellar credits).

#### [Game Manager](#tab/virtual-currency-game-manager)

1. Open Game Manager and go to **Economy** > **Catalog (V2)**.
2. Select the **Currency** tab.
3. Choose **New Currency**, setting the _Start date_, a human-readable _Title_ for the "neutral" key, and in the _Friendly ID_ field, enter a unique currency code for this currency.
4. Select **Save as draft**. The Item ID is used as a draft currency code.
5. View your new currency by clicking selecting the **Draft** filter in the currency list.
6. Edit the currency again and select **Save and publish**. The Friendly ID is used as a published currency code.

#### [API](#tab/virtual-currency-api)

Create a Draft Currency Catalog Item by calling the [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item) endpoint with type set to "currency" using:

* An EntityToken with Catalog Permissions  
* The Entity.Id as the item ‘Creator’  
* The Playfab Title ID
* The Item should be a Bundle of type ‘Currency’ and contain a Title and Description

Call PublishItem with the ItemId returned from the CreateDraftItem.

```bash
curl \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/CreateDraftItem \
  -d "{{Data}}"
```

Data:

```json
{ 
  "Item": {
    "CreatorEntity": {
      "Id": "{{TitleID}}",
      "Type": "title"
    },
    "Type": "currency",
    "ContentType": "gameitem",
    "AlternateIds": [
      { 
        "Type": "FriendlyId",
        "Value": "TC"
      } 
    ],
    "Title": {
      "NEUTRAL": "My Amazing Test Currency",
      "en-US": "My Test Coin"
    },
    "StartDate": "2023-07-27T00:00:00.000Z"
  },
  "Publish": true,
  "CustomTags": {
    "user": "{{Email}}"
  }
}
```

***

> [!TIP]
> A Catalog/Search for type 'currency' will return all of the currencies you have defined.

### Step 2 - Granting Currencies

#### [Game Manager](#tab/grant-currency-game-manager)

Your entity player needs virtual currency in order to make a Purchase.  

1. Open GameManager, navigate to Players, and select **Search** to retrieve the list of players.
2. Select the Player ID you wish to grant currency to.
3. Select the **Inventory (V2)** tab.
4. Filter to "Currency" **Type** and select **Pick multiple items** to view the full list of currencies.
5. Choose the _Currency_ you created and enter a new amount for the Entity _Player_.
6. Select **Save**.

> [!WARNING]
> The pages exposing player Currency Grants are not in GameManager today. See the [Roadmap](../../roadmap/index.md).

#### [API](#tab/grant-currency-api)

You can call [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items) to add currency to an Entity Wallet. By default, you need to use Title Level Entity Auth to arbitrarily add virtual currencies to a player’s inventory.

***

> [!NOTE]
> _AddInventoryItems_ is considered a Title admin call, and is normally not something called directly by the game client.

### Step 3 - Update a Catalog Item

An item must have a currency value in order for it to be purchasable with virtual currency.

#### [GameManager](#tab/create-catalog-item-game-manager)

1. Open Game Manager and navigate to **Economy**.
1. Select the **Catalog (V2)** tab and ensure you're filtered to **Published** items.
1. Select the title of the item you created earlier.
1. Select **Edit draft item**.
1. Select **➕ Add new price** and set an _Amount_ by selecting the Currency item you created. Select **Add** to finish.
1. Select **Save and Publish**.

#### [API](#tab/create-catalog-item-api)

Get the draft of your Catalog Item by calling the [GetDraftItem](/rest/api/playfab/economy/catalog/get-draft-item) endpoint. Then update the draft with the [UpdateDraftItem](/rest/api/playfab/economy/catalog/update-draft-item) endpoint using:

* The EntityToken (from GetEntityToken or other PlayFab `login` call) in the X-EntityToken header
* The Entity.Id from the previous call in the item’s EntityKey.Id

```bash
curl \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/GetDraftItem \
  -d "{{Data}}"
```

Data:

```json
{
  "Id": "{{EntityID}}",
  "CustomTags": {
    "user": "{{Email}}"
  }
}
```

```bash
curl \
  -H "X-EntityToken: {{EntityToken}}" \
  -H "Content-Type: application/json" \
  -X POST https://{{TitleId}}.playfabapi.com/Catalog/UpdateDraftItem \
  -d "{{Data}}"
```

```json
{
  "Item": {
    "Id": "{{EntityID}}",
    "CreatorEntity": {
      "Id": "{{TitleID}}",
      "Type": "title"
    },
    "Type": "catalogItem",
    "ContentType": "gameitem",
    "Title": {
      "NEUTRAL": "My Amazing Fire Sword",
      "en-US": "My Lit Lit Sword"
    },
    "StartDate": "2023-07-27T00:00:00.000Z",
    "Tags": [
      "weapon"
    ]
    "PriceOptions": {
      "Prices": [
        {
          "Amounts": [
            {
              "ItemId": "{{CurrencyID}}",
              "Amount": 15
            }
          ]
        }
      ]
    }
  },
  "Publish": true,
  "CustomTags": {
    "user": "{{Email}}"
  }
}
```

If you don't set `Publish` to `true`, then you must push it to the published state using [PublishDraftItem](/rest/api/playfab/economy/catalog/publish-draft-item). Once an Item is published, it's searchable and available publicly. You need to use the "itemId" returned from the GetDraftItem response in order to publish.

## See also

* [Economy v2 overview](overview.md)
* [Settings](settings.md)
* [Stores](stores.md)
