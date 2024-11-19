---
title: Login basics and best Practices
author: antnguyen
description: Describes the basics and Best Practices for login and authentication of players in PlayFab.
ms.author: antnguyen
ms.date: 09/05/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, authentication
ms.localizationpriority: medium
---

# Login basics and best practices

## Platform-specific authentication tutorials

While all of the platform-specific authentication tutorials demonstrate logging in with [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid), the uses for this login in a published game are limited to pairing a PlayFab account to a pre-existing database, or another back-end system.

Otherwise, it's rare for a published title to use a custom ID for a primary login, since in most cases you want to capture additional information on the player's platform.

### Why we demonstrate this first

Bluntly - because it's the easiest. A custom ID can be anything, and it makes it easier to call your first API. Once you get serious about developing and releasing your title, it's likely you'll switch to another login mechanism.

### Best practice

Unless you know *exactly* why you want `LoginWithCustomId` in your released title, you should migrate to another login mechanism before you launch.

## Anonymous login mechanisms

Anonymous login mechanisms are the simplest to use. They require *zero* input from the player, so there's no friction to the first time user experience - and the result is a unique account in PlayFab for each player. *This is the most common login mechanism*.

These logins include:

- [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
- [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
- [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)

Since they're anonymous, these methods can uniquely identify a device, *but contain no recoverable information about the player*. If the player loses or breaks their device, the account is lost, and may be difficult to recover. In most cases the account is simply orphaned and not retrievable.

So why use it? Because it's the lowest possible barrier to entry for the player, requiring no interaction. It gets the player trying your game with minimal effort, while creating an account they can get back to for continuity (as long as they have that device).

### Best practice

Your game should use an *anonymous* login for creating a new account and linking new devices to an existing account. We recommend this because some players may abandon a game that asks for an e-mail or identifiable information.

However, once the anonymous login is complete, you should provide the option to add *recoverable* login credentials, and provide some explanation regarding the benefits.

In particular, you should make sure that paying customers are guided to the *recoverable* login systems, to prevent loss of their accounts. A free account lost forever is a disappointment...

A paid account lost forever affects revenue.

### iOS devices

For iOS devices, the player ID changes if they uninstall your game, and then *re*-install it. One way to make sure you have a consistent ID on iOS is to save the device ID for the player to the iTunes KeyChain, so that you can read it from there on game start, and use it to sign in.

You must determine how to generate unique custom IDs for any other device or platform. Custom IDs are an effective alternative for other platforms or devices, but you must generate your custom IDs with care. If they're too simple, you risk hackers stealing the accounts of others.

### android devices

For latest best practices, see [Google's guidelines on user data IDs](https://developer.android.com/training/articles/user-data-ids).

> [!NOTE]
> Binding a recoverable login is only required *once* per device. Once bound, the game can continue to use the anonymous login with no drawbacks. See the next section.

An anonymous login is convenient for the player, but it *isn't* required. Your game can rely exclusively on a recoverable login mechanism. However, your players are happier if they *don't* have to type a password every time they log in.

## Recoverable login mechanisms

A *recoverable* login mechanism requires some identity information from the player. As described above, it can be paired with an anonymous login for the best player experience.

### Pure PlayFab options

The simplest options are:

- [LoginWithPlayFab](xref:titleid.playfabapi.com.client.authentication.loginwithplayfab)
- [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)

If used, the e-mail or username-plus-password are authenticated directly by PlayFab. The account is recoverable by the e-mail or username, *even* if the user forgets their password. The login is generally secure (you can implement your own password strength check into your game to improve this).

### Third party API options

These require separate API calls to another service, but do not require additional SDK installations:

- [LoginWithKongregate](xref:titleid.playfabapi.com.client.authentication.loginwithkongregate)
- [LoginWithSteam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam)
- [LoginWithTwitch](xref:titleid.playfabapi.com.client.authentication.loginwithtwitch)
- [LoginWithGameCenter](xref:titleid.playfabapi.com.client.authentication.loginwithgamecenter) (iOS only, and provided you require secure authentication.)

Secure authentication happens between your user, and the 3rd party service API call.

### Third party SDK options

These require a separate SDK installed into your game. Secure authentication happens within the 3rd party SDK.

- [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
- [LoginWithGoogleAccount](xref:titleid.playfabapi.com.client.authentication.loginwithgoogleaccount)

In all 3rd party options, those services process the login credentials, and you pass a secure token to the appropriate PlayFab login method. PlayFab remains unaware of the login credentials for those services.

### More best practices

Use an appropriate anonymous login for a basic login, and encourage your player to link to a recoverable login. You should pick any one or more of the recoverable mechanisms with which you're comfortable and familiar.

> [!TIP]
> Account recovery only requires *one* recoverable login, so don't pressure your player to use all of them.

## Insecure login mechanisms

One benefit of recoverable login mechanisms is they're more secure than logging in with a custom ID, as they require verified authentication with a third party rather than relying on a user's custom ID remaining a shared secret.

## Conclusion

Anonymous login is great, and it provides the user with a fully automated login process. The downside is account recovery, which is sometimes impossible without a recoverable login.

The following flow chart describes anonymous login followed by adding a recoverable login mechanism.

![PayFab anonymous login and recoverable login mechanism](../media/tutorials/playfab-anonymous-login-and-recoverable-login.png)  

### Best practice

Use the appropriate anonymous login for your device, paired with one or more options for account recovery.
