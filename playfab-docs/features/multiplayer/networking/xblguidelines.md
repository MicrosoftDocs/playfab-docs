## Recommendations for Xbox Live games building multiplayer experiences 

This tutorial provides recommendations for Xbox Live games interested in using PlayFab services to accomplish multiplayer scenarios. 

PlayFab has partnered with Xbox Live to allow game studios leveraging the Xbox Live gamer network to enjoy certain PlayFab services for free on Xbox One and PC. This includes matchmaking and Parties, as well as other services (TBD link). If you would like to take advantage of this Xbox Live subsidy, Microsoft recommends the following multiplayer design:

1.	Use the Xbox Live SDK to interface with Xbox Live social capabilities like Presence, Profile Cards, and game invites. 
2.	Use PlayFab Matchmaking to match players.
3.	Use PlayFab Parties to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, PlayStation, etc. for those platforms. However you can use the same matchmaking, networking, and chat technologies on all platforms. Usage associated with Xbox Live logged-in players will be zero-rated (see [LoginWithXbox()](https://api.playfab.com/documentation/client/method/LoginWithXbox))

Xbox Live does not recommend new titles use Xbox Live SmartMatch, Game Chat 2, or Xbox Integrated Multiplayer (XIM). These products receive limited support, discourage cross-network play, and may be deprecated in the future.
