---
title: Getting started with Economy v2, Unity IAP, and Android
author: cybtachyon
description: How to set up In-App Purchasing (IAP) using PlayFab Economy v2, Unity, and Android.
ms.author: derekreese
ms.date: 09/07/2022
ms.topic: tutorial
ms.prod: playfab
keywords: playfab, economy, settings
ms.localizationpriority: medium
---

# Getting Started with Economy v2, Unity, and Android

[!INCLUDE [notice](../../../includes/_economy-release.md)]

This tutorial shows you how to set up In-App Purchasing (IAP) using PlayFab, the Unity + IAP Service, and the Android Billing API.

## Before we start

The Android Billing API and PlayFab work together to provide an IAP experience for your client:

![PlayFab Economy v2 - Redemption Timeline](../media/playfab-economyv2-redemption-timeline.png)

Start by setting up your **Product IDs** and **Prices** via PlayMarket. Initially, all the products are _faceless_ - digital entities your player is able to purchase - but no meaning to PlayFab players.

To make those entities useful, we need to mirror them in the PlayFab item catalogs. PlayFab turns faceless entities into bundles, containers, and individual items.

Each will have their own unique face, with:

* **Titles**
* **Descriptions**
* **Tags**
* **Types**
* **Images**
* **Behaviors**

All items are linked to market products by sharing IDs.

The best way to access real money items available for purchase is to use [GetItems](/rest/api/playfab/economy/catalog/get-items).

The ID of the item is the link between PlayFab and any external IAP system. So we pass the item ID to the IAP service.

At this point, the purchase process begins. The player interacts with the IAP interface and - if the purchase is successful - you obtain a receipt.

PlayFab will validate the receipt and register the purchase, granting the PlayFab player the items that they just bought.

## Setting up a client application

This section shows you how to configure an application to test IAP using PlayFab, UnityIAP, and the Android Billing API.

Prerequisites:

* A Unity project.
* The PlayFab SDK imported and configured to work with your title.

Our first step is setting up UnityIAP:

1. Navigate to **Services**.
2. Make sure the **Services** tab is selected.
3. Select your **Unity Services** profile or organization.
4. Select the **Create** button.

![Setting up UnityIAP service](../media/tutorials/unity-android-setting-up-service.png)  

1. Next, navigate to the **In-App Purchasing (IAP)** service.

![Navigate to UnityIAP service](../media/tutorials/unity-android-navigate-to-service.png)  

1. Make sure to enable the **Service**, by setting the **Simplify cross-platform IAP** toggle.

2. Then select the **Continue** button.

![Enable UnityIAP service](../media/tutorials/unity-android-enable-service.png)  

A page with a list of plugins will appear.

1. Select the **Import** button.

![UnityIAP service - Import plugins](../media/tutorials/unity-android-import-plugins.png)  

Continue the Unity install, and import procedure up to the point where it has imported all the plugins.

1. Verify that the plugins are in place.
2. Then create a new script, called **AndroidIAPExample.cs**.

![UnityIAP Create new script](../media/tutorials/unity-android-create-new-script.png)  

`AndroidIAPExample.cs` will contain the code shown below (refer to the code comments for further explanation).

```csharp
using PlayFab;
using PlayFab.ClientModels;
using PlayFab.Json;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Purchasing;

public class AndroidIAPExample : MonoBehaviour, IStoreListener {
    // Items list, configurable via inspector
    private List<CatalogItem> Catalog;

    // The Unity Purchasing system
    private static IStoreController m_StoreController;

    // Bootstrap the whole thing
    public void Start() {
        // Make PlayFab log in
        Login();
    }

    public void OnGUI() {
        // This line just scales the UI up for high-res devices
        // Comment it out if you find the UI too large.
        GUI.matrix = Matrix4x4.TRS(new Vector3(0, 0, 0), Quaternion.identity, new Vector3(3, 3, 3));

        // if we are not initialized, only draw a message
        if (!IsInitialized) {
            GUILayout.Label("Initializing IAP and logging in...");
            return;
        }

        // Draw menu to purchase items
        foreach (var item in Catalog) {
            if (GUILayout.Button("Buy " + item.DisplayName)) {
                // On button click buy a product
                BuyProductID(item.ItemId);
            }
        }
    }

    // This is invoked manually on Start to initiate login ops
    private void Login() {
        // Login with Android ID
        PlayFabClientAPI.LoginWithAndroidDeviceID(new LoginWithAndroidDeviceIDRequest() {
            CreateAccount = true,
            AndroidDeviceId = SystemInfo.deviceUniqueIdentifier
        }, result => {
            Debug.Log("Logged in");
            // Refresh available items
            RefreshIAPItems();
        }, error => Debug.LogError(error.GenerateErrorReport()));
    }

    private void RefreshIAPItems() {
        PlayFabClientAPI.GetCatalogItems(new GetCatalogItemsRequest(), result => {
            Catalog = result.Catalog;

            // Make UnityIAP initialize
            InitializePurchasing();
        }, error => Debug.LogError(error.GenerateErrorReport()));
    }

    // This is invoked manually on Start to initialize UnityIAP
    public void InitializePurchasing() {
        // If IAP is already initialized, return gently
        if (IsInitialized) return;

        // Create a builder for IAP service
        var builder = ConfigurationBuilder.Instance(StandardPurchasingModule.Instance(AppStore.GooglePlay));

        // Register each item from the catalog
        foreach (var item in Catalog) {
            builder.AddProduct(item.ItemId, ProductType.Consumable);
        }

        // Trigger IAP service initialization
        UnityPurchasing.Initialize(this, builder);
    }

    // We are initialized when StoreController and Extensions are set and we are logged in
    public bool IsInitialized {
        get {
            return m_StoreController != null && Catalog != null;
        }
    }

    // This is automatically invoked automatically when IAP service is initialized
    public void OnInitialized(IStoreController controller, IExtensionProvider extensions) {
        m_StoreController = controller;
    }

    // This is automatically invoked automatically when IAP service failed to initialized
    public void OnInitializeFailed(InitializationFailureReason error) {
        Debug.Log("OnInitializeFailed InitializationFailureReason:" + error);
    }

    // This is automatically invoked automatically when purchase failed
    public void OnPurchaseFailed(Product product, PurchaseFailureReason failureReason) {
        Debug.Log(string.Format("OnPurchaseFailed: FAIL. Product: '{0}', PurchaseFailureReason: {1}", product.definition.storeSpecificId, failureReason));
    }

    // This is invoked automatically when successful purchase is ready to be processed
    public PurchaseProcessingResult ProcessPurchase(PurchaseEventArgs e) {
        // NOTE: this code does not account for purchases that were pending and are
        // delivered on application start.
        // Production code should account for such case:
        // More: https://docs.unity3d.com/ScriptReference/Purchasing.PurchaseProcessingResult.Pending.html

        if (!IsInitialized) {
            return PurchaseProcessingResult.Complete;
        }

        // Test edge case where product is unknown
        if (e.purchasedProduct == null) {
            Debug.LogWarning("Attempted to process purchase with unknown product. Ignoring");
            return PurchaseProcessingResult.Complete;
        }

        // Test edge case where purchase has no receipt
        if (string.IsNullOrEmpty(e.purchasedProduct.receipt)) {
            Debug.LogWarning("Attempted to process purchase with no receipt: ignoring");
            return PurchaseProcessingResult.Complete;
        }

        Debug.Log("Processing transaction: " + e.purchasedProduct.transactionID);

        // Deserialize receipt
        var googleReceipt = GooglePurchase.FromJson(e.purchasedProduct.receipt);

        // Invoke receipt validation
        // This will not only validate a receipt, but will also grant player corresponding items
        // only if receipt is valid.
        PlayFabClientAPI.ValidateGooglePlayPurchase(new ValidateGooglePlayPurchaseRequest() {
            // Pass in currency code in ISO format
            CurrencyCode = e.purchasedProduct.metadata.isoCurrencyCode,
            // Convert and set Purchase price
            PurchasePrice = (uint)(e.purchasedProduct.metadata.localizedPrice * 100),
            // Pass in the receipt
            ReceiptJson = googleReceipt.PayloadData.json,
            // Pass in the signature
            Signature = googleReceipt.PayloadData.signature
        }, result => Debug.Log("Validation successful!"),
           error => Debug.Log("Validation failed: " + error.GenerateErrorReport())
        );

        return PurchaseProcessingResult.Complete;
    }

    // This is invoked manually to initiate purchase
    void BuyProductID(string productId) {
        // If IAP service has not been initialized, fail hard
        if (!IsInitialized) throw new Exception("IAP Service is not initialized!");

        // Pass in the product id to initiate purchase
        m_StoreController.InitiatePurchase(productId);
    }
}

// The following classes are used to deserialize JSON results provided by IAP Service
// Please, note that JSON fields are case-sensitive and should remain fields to support Unity Deserialization via JsonUtilities
public class JsonData {
    // JSON Fields, ! Case-sensitive

    public string orderId;
    public string packageName;
    public string productId;
    public long purchaseTime;
    public int purchaseState;
    public string purchaseToken;
}

public class PayloadData {
    public JsonData JsonData;

    // JSON Fields, ! Case-sensitive
    public string signature;
    public string json;

    public static PayloadData FromJson(string json) {
        var payload = JsonUtility.FromJson<PayloadData>(json);
        payload.JsonData = JsonUtility.FromJson<JsonData>(payload.json);
        return payload;
    }
}

public class GooglePurchase {
    public PayloadData PayloadData;

    // JSON Fields, ! Case-sensitive
    public string Store;
    public string TransactionID;
    public string Payload;

    public static GooglePurchase FromJson(string json) {
        var purchase = JsonUtility.FromJson<GooglePurchase>(json);
        purchase.PayloadData = PayloadData.FromJson(purchase.Payload);
        return purchase;
    }
}
```

1. Create a new **Game** object called **Code**.
1. Add the `AndroidIAPExample` component to it (two-step process).
1. Add the `AndroidIAPExample` component to it.
1. Make sure to **Save** the scene.

![UnityIAP create example game object](../media/tutorials/unity-android-create-example-game-object.png)  

Finally, navigate to **Build Settings**.

1. Verify that your scene has been added to the **Scenes In Build** area.
2. Make sure that the **Android** platform has been selected.
3. Move to the **Player Settings** area.
4. Assign your **Package Name**.

> [!NOTE]
> Make sure to come up with your _own_ package name to avoid any **PlayMarket** collisions.

![UnityIAP add example game object](../media/tutorials/unity-android-add-example-game-object.png)  

Finally, build the application as usual, and ensure there's an APK.

In order to test, we need to configure PlayMarket and PlayFab.

## Setting up a PlayMarket application for IAP

This section describes the specifics of how to enable IAP for your PlayMarket application.

> [!NOTE]
> Setting up the application itself is beyond the scope of this tutorial. We assume you already _have_ an application, and that is configured to publish at least Alpha releases.

![Enable PlayMarket Application](../media/tutorials/unity-android-enable-playmarket-application.png)  

Useful notes:

* Getting to that point will require you to have an APK uploaded. Use the APK we constructed in the previous section.
* Upload the APK as an _Alpha_ or _Beta_ Application to enable the IAP sandbox.
* Configuring **Content Rating** will include questions about how IAP is enabled in the application.
* PlayMarket _doesn't_ allow Publishers to use or test IAP. Pick _another_ Google account for testing purposes, and add it as a tester for your Alpha/Beta build.

1. Publish the application build.
1. Select `In-app products` from the menu.
    * If you're asked for a **Merchant Account**, link or create one.
1. Select the `Add New Product` button.

![PlayMarket add new product](../media/tutorials/unity-android-playmarket-add-new-product.png)  

1. On this screen shown below, select `Managed Product`.
1. Give it a descriptive `Product ID`.
1. Select `Continue`.

![PlayMarket add product ID](../media/tutorials/unity-android-playmarket-add-product-id.png)  

PlayMarket requires you to fill in a **Title (1)** and a **Description (2)**.

**Data Item** data comes exclusively from the PlayFab service, and only requires IDs to match.

![PlayMarket add product title description](../media/tutorials/unity-android-playmarket-add-product-title-description.png)  

1. Scroll further and select the **Add a price** button.

![PlayMarket add product price](../media/tutorials/unity-android-playmarket-add-product-price.png)  

1. Enter a valid price (notice how price is converted for each country/region independently).
1. Select the **Apply** button.

![PlayMarket add product apply local prices](../media/tutorials/unity-android-playmarket-add-product-apply-local-prices.png)

1. Finally, scroll back to the top of your screen, and change the status of the item to **Active**.

![PlayMarket make product active](../media/tutorials/unity-android-playmarket-make-product-active.png)  

1. Save the **Licensing Key** to link PlayFab with PlayMarket.
1. Navigate to **Services & APIs** in the menu.
1. Then locate and save the **Base64** version of the **Key**.

![PlayMarket save product licensing key](../media/tutorials/unity-android-playmarket-save-product-licensing-key.png)

The next step is enabling IAP testing. While sandbox is automatically enabled for Alpha and Beta builds, we need to set up accounts that are authorized to test the app:

1. Navigate to **Home**.
1. Locate and select the **Account details** in the menu to the left.
1. Locate the **License Testing** area.
1. Verify that your **Test Accounts** are in the list.
1. Make sure the **License Test Response** is set to **RESPOND_NORMALLY**.

Don't forget to apply the settings!

![PlayMarket enable IAP testing](../media/tutorials/unity-android-playmarket-enable-iap-testing.png)  

The Play Market side of the integration should be set up at this point.

## Setting up a PlayFab title

Our last step is configuring a PlayFab title to reflect our products, and integrate with the Google Billing API.

1. Select **Add-ons**.
1. Then, select the **Google** add-on.

![PlayFab open Google Add-on](../../authentication/platform-specific-authentication/media/tutorials/google-html5/open-google-add-on.png)  

1. Fill in your **Package ID**.
1. Fill in the **Google App License Key** that you acquired in the previous section.
1. Commit your changes by selecting the **Install Google** button.

Our next step is reflecting our Golden Sword item in PlayFab:

1. Create a new item and edit the **Item ID** to match the ID in PlayMarket.
2. Edit the **Display name** and add a  **Description**.

  > [!NOTE]
  > Keep in mind that this data has _nothing to do_ with the **Play Market Item Title** and **Description** - it is independent.

1. Assign a **Price** to your **Item**.
1. Select **Save Item** to commit your changes.

    > [!NOTE]
    > In this tutorial, IAP mainly refers to purchases for real money. That's why we use **RM** - special Real Money currency. The PlayFab amount is defined in US Cents.  

1. Observe your item in the **Item ID** list.

We've concluded the setup for your PlayFab title.

## Testing

For testing purposes, download the app using the Alpha/Beta release.

* Make sure to use a test account and a real Android device.
* Once you start the app, you should see IAP initialized, and _one button_ representing your item.
* Select that button.

![Test app - Buy Golden Sword button](../media/tutorials/unity-android-test-app-buy-golden-sword-button.png)  

The IAP purchase will be initiated. Follow the Google Play instruction up to the point where purchase is successful.

![Test app - Google Play - payment successful](../media/tutorials/unity-android-test-app-google-play-payment-successful.png)  

Finally, navigate to your title in the PlayFab **Game Manager** dashboard and locate **New Events**.

Verify the purchase was provided, validated, and piped to the PlayFab ecosystem.

You have successfully integrated UnityIAP and the Android Billing API into your PlayFab application!
