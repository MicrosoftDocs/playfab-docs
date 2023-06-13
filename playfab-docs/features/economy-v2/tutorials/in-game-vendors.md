---
title: Economy v2 Multiple In-Game Vendors
author: thomg
description: Set up multiple in-game vendors for your PlayFab catalog in Unity
ms.author: thomg
ms.date: 6/15/2023
ms.topic: tutorial
ms.service: playfab
keywords: playfab, commerce, economy, currency, virtual currency, catalog, Unity
ms.localizationpriority: medium
---

One of the first scenarios we wanted to cover with the Economy V2 Catalog was managing multiple in-game vendors. The inspiration here was Sea of Thieves, and the way they build engagement with various characters and factions within the game representing different shops and characters you can interact with. In this article, I will show you how to use PlayFab's catalog, Game Manager, the PlayFab SDK, Tags, and the search API to create multiple in-game vendor displays.

<div align="center">
    <img src="../media/tutorials/in-game-vendor-sot-hero-image.png">
</div>

## Setting up your Catalog items using Game Manager
This first step is relatively simple and can be done using Game Manager. Navigate to your Title Settings in Game Manager, then to the Economy V2 tab.

Under Economy V2, we will create a set of Tags for our In-Game Vendors. These can be whatever you want but in our case we are going to have an Item, Sword, and Pistol vendor, so those are also the names of the tags we will use.

Save your configuration, then Navigate to Economy -> Catalog V2 -> Currency, click the New Currency button and use the form to create a new currency. You can name the currency whatever you want (we are calling ours Gold) but take note of your Currency ID because we will be using that later.   

Now you can create items using both the Currency and the Tags. 
Navigate to Economy -> Catalog V2 -> Items. 

From here you can create new items using both the Gold Currency and the various search Tags. We are also adding small, 100x100 pixel Thumbnail images to the item for display in game. You also can specify various metadata here such as type, localized title and description, content type, or customized display properties. You can also upload other images or content for your items. 
For the purposes of this demo and testing, we created 2 items of each type.

## Using the PlayFab Unity SDK to make a Client Call
We will be building from the instructions and code sample here [Unity3D quickstart - PlayFab | Microsoft Learn]. You will want to follow these steps closely to:

•	Download and install the PlayFab SDK
•	Set your initial title settings in your Unity client
•	Make your first API call

After you are able to install and set up your first client call into PlayFab move onto the next set of steps.

## Fetching catalog items using a Seach query
We are going to create a new script to queue up our calls to our Catalog. I’m calling this CatalogCaller.cs. After creating the script I’ll attach it to an empty GameObject (calling this PlayFabManager) in my Unity scene to make it available to the UX when I need it. This is also where I placed the PlayFabLogin script.

We need to add some libraries to CatalogCaller so that we can understand PlayFab’s native Economy Models, and leverage Unity’s lists, UI (user interfaces), TextMeshPro and network calling library.

We also want to make some declarations at the top of the class – two unity GameObject arrays for holding images and text, and a placeholder to help us hold onto the Item price. 

In Unity we want to create a vendor store view with Sea of Thieves as the inspiration.

This is a fairly clean interface with a set of thumbnail images and prices. To replicate this, I’ve created a Unity Prefab item called ‘StoreListing’ which is a simple Canvas Panel with a Button/Raw Image component and a Text (TextMeshPro) component.

In the main scene I set up a Unity Canvas with a Panel that holds a set of these StoreListing prefabs. I then populate my custom script arrays (GUI Thumbs and GUI Prices) with each StoreListing’s RawImage and Text objects so that we will have them at runtime to populate.

We will also add some simple buttons to use for calling the catalog functions, one for each type (Items, Swords, and Pistols).

With all of this in place we can now do some real coding. We need a public function for calling the catalog, se create a SwordCatalogCaller() function. We set up a new SearchItemsRequest using Filter to look solely for items with the sword Tag inside this function. We will also add ordering this by Last Modified date so that we get the most recent items first and limit the count to 10. 
We then then a search call items with this request and call with new custom methods for success and failure.

## Parsing the Catalog Search Call
So now we can call search and get a result. We need to parse that result by making updates to OnCatalogFetchRequestSuccess. First, we will create a list to hold our CatalogItems, explicitly using EconomyModels so that we don’t conflict with Legacy V1:

Then we will loop through that list.

Within our loop, we want to double check that any given item has both an image and a price before we proceed.

If an item gets this far, we want to get the actual price. Since Items in PlayFab can have multiple prices, the object model holds them within their own class and a nested list. This can be tricky to parse in the SDK. We do it here using nested loops. We are also only grabbing the “Gold” prices referencing the ItemID from our Currency definition we grabbed earlier when creating the currency in Game Manager. We assign the price to our Price List in this iteration of our for loop.

Now that we have a price we need the image. We follow a similar pattern by pulling the images into a list:

Then we double check that we are dealing with a Thumbnail URL and if so, call a Coroutine that will fetch the image and populate the UX (we will put together the Coroutine in the next section). 

Altogether OnCatalogFetchRequest now looks like this:

## Fetching the Thumbnails and Populating the Unity UI

The final part of this is to use Unity’s IEnumerator coroutine to download the actual Thumbnail images and populate our UI. We start with a method declaration that gets the Thumbnail URL, Price as a string, and an integer that marks the item placement from the caller. We declare a texture to use and make a get texture request using the URL.

Then we move to a SendWebRequest and look for failures in the result. If everything works out, we grab the content and push it into the Item using the arrays we initially declared and the item’s position in them. 

Now we just need to add the function to one of our buttons. Drag the PlayFabManager onto the the button runtime only field, and choose the ItemCatalogCaller function. 

We now have a button that will pull the content for our Item vendor into our Canvas for display. 

To update this to work for a different vendor we just need change our SearchItemsRequest. I can create a couple new search queries with copy past to look for different tags:

When its done our CatalogCaller script now looks like this:









