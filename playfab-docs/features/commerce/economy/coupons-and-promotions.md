# Coupons and Promotions

Coupons are string tokens you generate, and your customers use to redeem inventory items in their game. Combined with bundles or CloudScript, these coupons could be used to trigger almost any functionality in your game.

**Requirements**:

- Familiarity with [Catalogs](../items/catalogs.md), Bundles, and Containers
- Familiarity with [Game Manager](../../config/gamemanager/game-manager-tour)
- Familiarity with [Player Inventory](../../data/playerdata/player-inventory.md)

## Generate and Redeem Coupon Instructions

All of the examples below share the first basic step of generating a coupon. This is done in Game Manager.

Game Manager: Navigate to your title -> Economy -> {your primary catalog}

For any of the three tab-sections: Items, Bundles, and Containers, you will find a "Coupons" button.

![Game Manager - Economy - Catalog Items - Coupons button](media/tutorials/game-manager-catalog-items-coupon-button.png)  

This pops up a window which lets you generate coupons for any of the items in the section. If you wish to create coupons for a specific item, click "Coupons" in the Items tab, Bundle Coupons under Bundles, and Container Coupons under Containers.

The popup window looks like the following image (your list of items will match your title, the displayed items are described in our [Drop Tables](../items/drop-tables.md) tutorial):

![Game Manager - Generate Coupons](media/tutorials/game-manager-generate-coupons.png)  

To complete the coupon generation, select a quantity of coupons to generate, and click the item the coupons should generate.  This will download a CSV text file with a list of coupons.

Clicking one of the links in the example generates the following ten comma-separated coupons:

```xml
65g-d4q5-zph,ahs-aofk-5ip,rqp-pk6c-yuu,58d-64h9-a6q,zxk-jtmi-5a1,oeu-6e4z-365,mfy-euhb-qj3,ru9-r1ux-wzy,shj-54cm-5oh,719-7hxc-pzz
```

Finally, the customer can redeem a coupon if you provide a GUI which lets them input the code, which then calls [RedeemCoupon](https://api.playfab.com/documentation/client/method/RedeemCoupon).

```csharp
// Unity/C#
void UseCoupon(string couponCode)
{
    var primaryCatalogName = "TestCatalog-001"; // In your game, this should just be a constant matching your primary catalog
    var request = new RedeemCouponRequest
    {
        CatalogVersion = primaryCatalogName,
        CouponCode = couponCode // This comes from player input, in this case, one of the coupon codes generated above
    };
    PlayFabClientAPI.RedeemCoupon(request, LogSuccess, LogFailure);
}
```

### Example Case: Inventory Item Coupon

The most straightforward way to use coupons is gifting an inventory item. Once you have created your catalog, you can generate coupons for regular items by following the instructions above. There are no other special steps for this case.

### Example Case: Virtual Currency Coupon -OR- Multiple-item Coupon

Coupons cannot grant [Virtual Currency](currencies.md) directly, and they can only grant a single item. However, bundles can be used to convert inventory items seamlessly into groups of items or Virtual Currency. In the VC example, you should create a new bundle item, with VC contents.  Set the bundle to expire in 15 seconds.  This way, the player will immediately see the VC as soon as they open the bundle, and they won't see the intermediate item:

![Game Manager - Economy - Edit Catalog Bundle](media/tutorials/game-manager-economy-edit-catalog-bundle.png)  

Multiple items work the same way. Create a bundle, with multiple items, or even [Drop Tables](../items/drop-tables.md), and set it to expire in 15 seconds. The coupon can generate the bundle, the bundle is converted to multiple items, and the intermediate bundle item disappears.

## Usage Scenarios

- Physical rewards at conventions
  - Print out your list of coupon codes, and hand them out as swag at conventions
- Out-of-Game communication such as Forums, [Push Notifications](../../engagement/push-notifications/push-notification-basics.md) & Email
  - Send your players coupon codes directly as part of re-acquisition campaigns or other community outreach
- Tournaments
  - Send coupons to the top ranked players when using [Resettable Leaderboards](../../social/tournaments-leaderboards/using-resettable-statistics-and-leaderboards.md).
    > [!NOTE]
    > You can also give out inventory items directly in this case, so pick whichever is more relevant to your game.

## Best Practices

Using the PlayFab inventory, you should keep inventory sizes relatively small, less than 100 items total per player. A bundle which grants too many items may be throttled or rate-limited.