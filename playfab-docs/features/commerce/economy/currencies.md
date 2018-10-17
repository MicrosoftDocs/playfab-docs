# Currencies

This tutorial describes the **Currencies** tab in the **Economy** section in Game Manager. Virtual Currencies are the foundation of in-game economies. Players and Characters can be granted these currencies, which can then be used to buy or trade items. Items can have a cost in either a Virtual Currency or real money. It's exactly like real life, except its virtual! Economic regulation in-game is up to you.

## What is Virtual Currency?

Virtual Currencies provide a medium of exchange for players to purchase virtual items and services from within a title.

Each title can support multiple arbitrary virtual currencies. This provides flexibility for your game to implement whatever medium of exchange you desire (e.g. Gold, Gems, Hearts or Interstellar Credits).

After the initial setup, Store and Catalog items can now be assigned prices corresponding to the virtual currencies.

Our Game Manager provides tools to make managing your virtual economy straightforward and reliable.

## Field Reference

This section describes each field you see in the **Game Manager Economy Currencies** tab. All fields are required, however both **Currency Code** and **Display Name** are not pre-populated with default values. Leaving Recharge Rate and Recharge Max set to zero (default) will specify that this currency amount will not auto-regenerate.

### Currency Code

Currency Code is a required field. It represents the currency and will be used in the other **Economy** sections. It must be a two-character code and convention is all upper-case, although a two-digit number is also allowed. **RM** is reserved for **Real Money** and cannot be used as a currency code.

### Display Name

Display Name is a required field. It represents the name that is attached to the currency and that is typically displayed to the user in your game. The only restriction is that it must be at least one letter long. Common examples include “Gold” or “Space Bux”.

### Initial Deposit

Initial Deposit represents how much of this virtual currency is given to each player when they first sign-up for a playfab account. This is often the first time they play your game.

### Recharge Rate (Units/Day)

Recharge Rate is an optional field. It specifies how much of this virtual currency is granted to each player per day. Virtual Currency that is granted to the player via a Recharge Rate is granted to them gradually and is evenly distributed over a 24 hour period.

## Example

To create a virtual currency, perform the following steps:

1. Select your game in Game Manager.
2. Click **Economy**.
3. Click **Currencies**.
4. Click **Add Currency**.
5. Set the **Currency Code**. We'll use **GO** in this example.
6. Set the **Display Name**. We'll use **Gold** in this example.
7. Set the **Initial Deposit**. We'll use **1000** in this example. This gives new players 1,000 units of this virtual currency when they start the game.
8. We don't give them any additional virtual currency every day, so we're done.
9. Click **Save**.
10. Refresh the page.

Your new virtual currency is now added. The greyed out Currency Code means your new currency has been saved. Don't be confused by the persistent **SAVE** button. It is necessary for subsequent operations on your currency such as deleting or renaming.
