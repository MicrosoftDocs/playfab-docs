# Login basics and Best Practices

## Platform-specific authentication tutorials

While all of the Platform-specific authentication tutorials demonstrate logging in with [LoginWithCustomId](https://api.playfab.com/documentation/client/method/LoginWithCustomID), the uses for this login in a published game are limited: Pairing a PlayFab account to a pre-existing database or other back-end system. Otherwise, it is very rare for a published title to use a Custom ID for a primary login since in most cases, you want to capture additional information on the player's platform.

**Why we demonstrate this first**: Because it's the easiest. A Custom ID can be anything and it makes the "call your first API" step easier. Once you get serious about developing and releasing your title, it is very likely you will switch to another login mechanism.

**Best Practice**: Unless you know exactly why you want LoginWithCustomId in your released title, you should migrate to another login mechanism before you launch.

## Anonymous login mechanisms

The anonymous login mechanisms are the simplest to use. They require zero input from the player so that there's no friction to the first time user experience, and they create a unique account in PlayFab for each player. This is the most common login mechanism. These logins include: [LoginWithIOSDeviceID](https://api.playfab.com/documentation/client/method/LoginWithIOSDeviceID), [LoginWithAndroidDeviceID](https://api.playfab.com/documentation/client/method/LoginWithAndroidDeviceID), and [LoginWithCustomId](https://api.playfab.com/documentation/client/method/LoginWithCustomID).

Being anonymous, these methods can uniquely identify a device, but contain no recoverable information about the player. If the player loses or breaks their device, the account is lost, and may be very difficult to recover. It is not impossible, but in most cases the account will simply be orphaned and irretrievable.

So why use it? It's the lowest possible barrier to entry for the player, requiring no interaction. It gets the player trying your game with minimal effort, while creating an account they can get back to for continuity (as long as they have that device).

**Best Practice**: Your game should use anonymous login for creating a new account, and linking new devices to an existing account. Some players may abandon a game that asks for an email, or identifiable information. However, once the anonymous login is complete, you should provide the option to add recoverable login credentials, and provide some explanation regarding the benefits. In particular, you should make sure that paying customers are guided to the recoverable login systems, to prevent loss of their accounts. A free account lost forever is a bummer. A paid account lost forever is a revenue problem.

**Best Practice**: For iOS devices, the player's ID changes if they uninstall your games and then re-install. One way to make sure you have a consistent ID on iOS is to save the Device ID for the player to the iTunes KeyChain, so that you can read it from there on game start, and use it to sign in.
You must determine how to generate unique Custom IDs for any other device or platform. Custom ID is an effective alternative for other platforms or devices, but you must generate your Custom IDs with care. Too simple, and you risk hackers stealing the accounts of others.

> ![NOTE]  
> Binding a recoverable login is only required once per device. Once bound, the game can continue to use the anonymous login with no drawbacks. See the next section.

> ![NOTE]  
> Anonymous login is convenient for the player, but it is not required. Your game can rely exclusively on a recoverable login mechanism. However, your players will be happier if they don't have to type a password every time they log in.

## Recoverable login mechanisms

The recoverable login mechanisms require some identity information from the player. As described above, it can be paired with an anonymous login for the best player experience.

### Pure PlayFab options

The simplest options are: [LoginWithPlayFab](https://api.playfab.com/documentation/client/method/LoginWithPlayFab) and [LoginWithEmailAddress](https://api.playfab.com/documentation/client/method/LoginWithEmailAddress). If used, the email or username plus password are authenticated directly by PlayFab. The account is recoverable by the email or username, even if the user forgets their password. The login is generally secure (you can implement your own "password strength check" into your game to improve this).

### Third party API options

These require separate API calls to another service (but do not require additional SDK installations): [LoginWithKongregate](https://api.playfab.com/documentation/client/method/LoginWithKongregate), [LoginWithSteam](https://api.playfab.com/documentation/client/method/LoginWithSteam), [LoginWithTwitch](https://api.playfab.com/documentation/client/method/LoginWithTwitch). Secure authentication happens between your user, and the 3rd party service API call.

### Third party SDK options

[LoginWithFacebook](https://api.playfab.com/documentation/client/method/LoginWithFacebook), [LoginWithGoogleAccount](https://api.playfab.com/documentation/client/method/LoginWithGoogleAccount), [LoginWithWindowsHello](https://api.playfab.com/documentation/client/method/LoginWithWindowsHello). These require a separate SDK installed into your game. Secure authentication happens within the 3rd party SDK.

In all 3rd party options, those services process the login credentials, and you pass a secure token to the appropriate PlayFab login method. PlayFab remains unaware of the login credentials for those services.

**Best Practice**: You should use an appropriate anonymous login for basic login, and encourage your players to link a recoverable login. You should pick any one or more of the recoverable mechanisms with which you are comfortable and familiar. Account recovery only requires one recoverable login, so don't pressure your players to use all of them.

## Insecure recoverable login Mechanisms

Yes, this is indeed a thing, and it has a legitimate (if limited) purpose.

Specifically, [LoginWithGameCenter](https://api.playfab.com/documentation/client/method/LoginWithGameCenter) is considered an insecure login mechanism, and you should use it with extreme care (or not at all).

GameCenter is a secure login specifically between an iOS device and the GameCenter service, but unlike Apple's identity verification service, there is no secure authentication option for a 3rd party service like PlayFab. Even so, some developers are very familiar with GameCenter and wish to use it as their recoverable login mechanism.

**Good Practice**: The only "safe" usage of this mechanism is for client-authoritative games with no multiplayer capability. PlayFab can be a useful cloud-save option for this type of game using this mechanism. All other uses of LoginWithGameCenter should be considered unsafe. Do not use this login for any kind of game with any kind of multiplayer interaction.

**Best Practice**: Do not use. Use a secure recoverable mechanism described in the previous section. Even if your game is "safe" today, you may add a feature tomorrow like chat or trading which seem innocuous, but open up your players to theft, cheating, and malicious user activity.

## Conclusion

Anonymous login is great, and it provides the user with a fully automated login process. The downside is account recovery, which is sometimes impossible without a recoverable login.

The following flow-chart describes anonymous login followed by adding a recoverable login mechanism.

![PayFab anonymous login and recoverable login mechanism](../media/tutorials/playfab-anonymous-login-and-recoverable-login.png)  

**Best Practice**: Use the appropriate anonymous login for your device, paired with one or more options for account recovery.