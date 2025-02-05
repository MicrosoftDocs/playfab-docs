---
title: Source code and best practices - Winter Starfall
author: natashaorie
description: Tutorial for downloading Winter Starfall source code and best practices for login and purchase scenarios.
ms.author: norie
ms.date: 09/26/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, gaming, sample, demo
ms.localizationpriority: medium
---

# Source code and scenarios in Winter Starfall

This tutorial contains instructions for downloading and running the source code for Winter Starfall, and a walkthrough of the code samples demonstrating best practices for login and purchase scenarios.

## Source code download

### Prerequisites

- Install Node JS
- Install Visual Studio Code

### Setup for local development

1. Download the source code from [GitHub](https://github.com/PlayFab/winter-starfall).
1. In VS Code, open the `/website` folder and opt to install all the extensions it recommends.
1. In the `/website` directory, run npm install to install all dependencies.
1. Use `npm run dev` to start the site. Click on the link it offers to view the site.

### Azure credentials

To update the AZURE_CREDENTIALS secrets, run this command in the Azure Portal shell:

`az ad sp create-for-rbac --name "VanguardOutrider2" --role contributor --scopes /subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/YOUR_RESOURCE_GROUP_NAME --json-auth`

## Login flow

The player authentication flow in Winter Starfall has two steps: the login call and post-login functions that are used get the player's information from the service and load them into the correct location in the story.

### Player authentication

For the login portion, the file [use-login.tsx](https://github.com/PlayFab/winter-starfall/blob/main/website/src/hooks/use-login.ts) defines a TypeScript wrapper function that handles the multiple authentication methods available to players.

Lines 144 -169 defines the callback function for login in with an email address, and calls the post-login functions if login suceeds.

```typescript
const onLogin = useCallback(() => {
	setIsLoading(true);
	setLoginMethodInProgress("email");

	dispatch(siteSlice.actions.loginSteps(loginEventCount));

	ClientLoginWithEmailAddress({ Email: data.email, Password: data.password })
		.then(result => {
			dispatch(siteSlice.actions.login(result));
			dispatch(siteSlice.actions.loginStepsAdvance());
			// Track logins from returning users
			trackEvent({ name: "Returning User", properties: {} });
		})
		.then(() => {
			return postLoginFunctions();
		})
		.then(() => {
			setIsLoading(false);
			navigate(routes.Explore());
		})
		.catch(problem => {
			dispatch(siteSlice.actions.loginStepsReset());
			onError(problem);
		})
		.finally(() => dispatch(siteSlice.actions.loginStepsReset()));
}, [ClientLoginWithEmailAddress, data.email, data.password, dispatch, navigate, onError, postLoginFunctions]);
```

The game offers 3 recoverable methods for player authentication: email, Google, and Facebook, so that player accounts will never be lost. For more information, see [Login best practices](../features/authentication/login/login-basics-best-practices.md).

### Post login: Getting player data

Once the security token has been retrieved, it is used to run the post login functions to get the saved game state.

Lines 340 - 378 defines **postLoginFunctions**, which calls various Economy and PlayFab Services APIs to load the correct story location, inventory items, currency, etc based on the player.

```typescript
return new Promise<void>((resolve, reject) => {
	ClientGetTitleData({ Keys: TITLE_DATA_KEYS_ALL })
		.then(result => {
			dispatch(siteSlice.actions.titleData(result));
			dispatch(siteSlice.actions.loginStepsAdvance());
			loadScripts();
		})
		.then(() =>
			EconomySearchItems({
				Count: SEARCH_ITEMS_MAX_COUNT,
				Filter: "type eq 'currency' or type eq 'catalogItem'",
			})
		)
		.then(result => {
			dispatch(siteSlice.actions.catalog(result.Items));
			dispatch(siteSlice.actions.loginStepsAdvance());
		})
		.then(() => EconomyGetInventoryItems({ Count: SEARCH_ITEMS_MAX_COUNT }))
		.then(result => {
			dispatch(siteSlice.actions.inventory(result.Items));
			dispatch(siteSlice.actions.loginStepsAdvance());
		})
		.then(() => ClientGetUserData({ Keys: USER_DATA_KEYS_PLAYER_ALL }))
		.then(result => {
			dispatch(siteSlice.actions.userDataPlayer(result));
			dispatch(siteSlice.actions.loginStepsAdvance());
		})
		.then(() => ClientGetUserReadOnlyData({ Keys: USER_DATA_KEYS_READONLY_ALL }))
		.then(result => {
			dispatch(siteSlice.actions.userDataReadOnly(result));
			dispatch(siteSlice.actions.loginStepsAdvance());
		})
		.then(() => {
			resolve();
		})
		.catch(problem => {
			dispatch(siteSlice.actions.loginStepsReset());
			reject(problem);
		});
});
```

- First `ClientGetTitleData` gets the secret key needed for all API calls
- Then `EconomySearchItems` searches the catalog for currency and item types
- Which is used as input to `EconomyGetInventoryItems` to return the player's inventory items
- Then `ClientGetUserData` retrieves the value that stores the story location as part of a player's data.

## Purchase flow

At certain points in the game, the player has the option to purchase and sell inventory items from the store. The purchase flow is implemented in another wrapper function. In the file [use-store.tx](https://github.com/PlayFab/winter-starfall/blob/main/website/src/hooks/use-store.ts) lines 40 - 69 brings up the correct store that the player encounters at a specific location and populates the items for sale by searching the catalog.

```typescript
export function useEconomyStoreSingle(storeName: string): IEconomyStoreSingleResults {
	const dispatch = useDispatch();
	const store = useSelector((state: AppState) => state.site.stores).find(store =>
		store.AlternateIds?.find(friendlyId => friendlyId.Type === FRIENDLYID && friendlyId.Value === storeName)
	);
	const { isLoading, error, setError, EconomyGetItem } = usePlayFab();

	useEffect(() => {
		if (!is.null(store) || isStoreLoading) {
			return;
		}

		isStoreLoading = true;

		EconomyGetItem({
			AlternateId: { Type: FRIENDLYID, Value: storeName },
		})
			.then(results => {
				dispatch(siteSlice.actions.storeAdd(results.Item as PlayFabEconomyModels.CatalogItem));
			})
			.catch(setError)
			.finally(() => {
				isStoreLoading = false;
			});
	}, [EconomyGetItem, dispatch, setError, store, storeName]);

	return {
		error,
		isLoading,
		store,
	};
}
```
`EconomyGetItem` is defined in [use-playfab.tsx](https://github.com/PlayFab/winter-starfall/blob/main/website/src/hooks/use-playfab.ts) at lines 423 - 446, within which the PlayFab Economy API `GetItems` is used to search the catalog and return items.

```typescript
const EconomyGetItems = useCallback(
		(request: PlayFabEconomyModels.GetItemsRequest): Promise<PlayFabEconomyModels.GetItemsResponse> => {
			const date = startRequest("EconomyApi", "GetItems", request);

			return new Promise((resolve, reject) => {
				PlayFab.EconomyApi.GetItems(request, (result, problem) => {
					endRequest(date, problem, result);

					if (!is.null(problem)) {
						return reject(problem);
					}

					if (result.code !== 200) {
						return reject(formatPlayFabNon200Error(result));
					}

					return resolve(result.data);
				}).catch(reason => {
					catchRequest(reject, reason);
				});
			});
		},
		[catchRequest, endRequest, startRequest]
	);
```

When a purchase is conducted, a call to the `PurchaseInventoryItems` API is made. This is defined in [use-playfab.tsx](https://github.com/PlayFab/winter-starfall/blob/main/website/src/hooks/use-playfab.ts) at lines 540 - 565.

### Selling items

The selling flow is an example of how to use Azure Functions driven CloudScript to extend the functionality of Economy system.

[SellItem.cs](https://github.com/PlayFab/winter-starfall/blob/main/azure-functions/SellItem.cs) defines the CloudScript function that executes when selling an item.

Line 49 - 61 is where PlayFab's `GetTitleData API` is used to return the store multiplier and calculate the sale price.

```csharp
 // Get your sell multiplier
var titleData = await PlayFabFunctions.GetTitleDataAsync(player, new List<string> { TitleDataKeys.Multipliers }, log);
var sellMultiplier = JsonConvert.DeserializeObject<Multipliers>(titleData[TitleDataKeys.Multipliers])?.sell ?? 1;
```
The CloudScript function then gets called in lines 161- 187 of [use-store.ts](https://github.com/PlayFab/winter-starfall/blob/main/website/src/hooks/use-store.ts).

```typescript
export function useEconomyStoreSell(): IEconomyStoreSellItemResults {
	const { isLoading, error, setError, CloudScriptExecuteFunction, EconomyGetInventoryItems } = usePlayFab();
	const dispatch = useDispatch();

	const onSell = useCallback(
		(itemId: string, amount: number) => {
			return new Promise<void>((resolve, reject) => {
				CloudScriptExecuteFunction({
					FunctionName: "SellItem",
					FunctionParameter: {
						ItemId: itemId,
						Amount: amount,
					},
				})
					.then(() => EconomyGetInventoryItems({ Count: SEARCH_ITEMS_MAX_COUNT }))
					.then(data => {
						dispatch(siteSlice.actions.inventory(data.Items));
						resolve();
					})
					.catch(issue => {
						setError(issue);
						reject(issue);
					});
			});
		},
		[CloudScriptExecuteFunction, EconomyGetInventoryItems, dispatch, setError]
	);
```

> [!NOTE]
> To run Winter Starfall locally you'll need an Azure account to support the CloudScript functions. You can [sign up for a free Azure account](https://azure.microsoft.com/pricing/purchase-options/azure-account?msockid=1dec68fa155462cb2baa7ca6147963d7) and then follow the instructions above to reset the Azure credentials correctly.

## See also

- Login flow
	- [Player login documentation](../features/authentication/login/index.md)
- Purchase flow
	- [Economy V2 documentation](../features/economy-v2/overview.md)
	- Another good next step to learning more about Economy V2 is to try out the [crafting game tutorial](../features/economy-v2/tutorials/craftingGame/game-context.md), which focuses on building a sample game using the store and inventory functions.