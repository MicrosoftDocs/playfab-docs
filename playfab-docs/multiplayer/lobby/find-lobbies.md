---
title: Find lobbies
author: joannaleecy
description: Learn how to search for lobbies.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, find lobbies
ms.localizationpriority: medium
---

# Find lobbies
 

It's often useful for titles to let players find lobbies that meet a particular set of criteria like map and difficulty level among other in-game qualities. This search functionality enables players to find the game sessions they want with the people they want.

This article explains how to use __FindLobbies__ to enable players to find lobbies. To see how to find lobbies can be used in game titles, see [Common Scenarios](#common-scenarios).

> [!NOTE]
> It is not recommended to use __FindLobbies__ to implement background matchmaking.
> We highly recommend using the [matchmaking feature](../matchmaking/index.md) in that scenario. Otherwise you must
> handle the collisions of players all trying to join the same lobbies through filtering, sorting, and other techniques such as using randomization values in your search data fields.

## Understanding the relationship between lobby search properties and finding lobbies

Players make their lobbies discoverable by defining search properties. Players find these discoverable lobbies by calling __FindLobbies__ with query strings to filter and sort their search results based on the search properties defined across the currently active lobbies. Lobbies that match these queries are returned to the calling player.

For more information on defining search properties, checkout [Creating searchable lobbies](define-search-keywords.md)

## How to use FindLobbies

When calling __FindLobbies__, you can use the filter parameter to restrict your query to only return search results matching some set of criteria based on the lobby's custom search properties.

Additionally, you can use the sorting parameter to sort the results you get back from the service based on the search properties. This is useful since the service only returns a limited number of search results. Sorting ensures you see the most relevant search results.

### Common Scenarios

Here are a few common ways the __FindLobbies__ functionality is used in titles.

* Finding lobbies for game sessions for a specific game mode in your title
* Finding lobbies for game sessions your friends are hosting
* Finding lobbies for game sessions with enough players for all local players
* Finding lobbies you're already in to recover a connection after an unexpected game client or game server crash.

### Supported search keys

Only a restricted set of keys are allowed to be used when defining custom search properties.

* For string properties, the following keys are supported: string_key1, string_key2, [...] string_key30
* For numeric properties, the following keys are supported: number_key1, number_key2, [...] number_key30

### Constructing query strings for FindLobbies

Query strings for the __FindLobbies__ APIs are structured in an OData-like syntax. The maximum size for the filter string is 600 characters. 

These OData operators can be used to compose query strings. The operators are case sensitive. 

| Operators  | Meaning                  | Example                                               |
|------------|--------------------------|-------------------------------------------------------|
| eq         | equal to                 | string_key1 eq 'CaptureTheFlag'                       |
| lt         | less than                | number_key2 lt 10                                     |
| le         | less than or equal to    | number_key2 le 10                                     |
| gt         | greater than             | number_key3 gt 100                                    |
| ge         | greater than or equal to | number_key3 ge 100                                    |
| ne         | ne                       | string_key1 ne 'CaptureTheFlag'                       |
| and        | and                      | string_key1 eq 'CaptureTheFlag' and number_key2 lt 10 |


> [!NOTE]
> When comparing string properties, be sure to wrap the compared value in single quotes. For example, "string_key1 eq **'SOME STRING VALUE'**". Numeric properties don't need to be wrapped.

There are also predefined operators available to use. They must be prefixed by "lobby/" when specifying. 

| Operators            | Meaning                                                                              | Example                            |
|----------------------|--------------------------------------------------------------------------------------|------------------------------------|
| memberCount          | number of players in a lobby                                                         | lobby/memberCount eq 5             |
| maxMemberCount       | maximum number of players allowed in a lobby                                         | lobby/maxMemberCount gt 10         |
| memberCountRemaining | remaining number of players who can join the lobby                                   | lobby/memberCountRemaining gt 0    |
| membershipLock       | lock status of lobbies, must equal 'Unlocked' or 'Locked'                            | lobby/membershipLock eq 'Unlocked' |
| amOwner              | lobbies which you are the owner, required to equal 'true'                            | lobby/amOwner eq 'true'            |
| amMember             | lobbies which you are a member, required to equal 'true'                             | lobby/amMember eq 'true'           |
| amServer             | lobbies which the server has joined client-owned lobbies, required to equal 'true'   | lobby/amServer eq 'true'           |

The SDK definition for these constants is documented [here](playfabmultiplayerreference-cpp/pflobby/constants/pflobbysearchkeys.md). 

### Sorting 
	
OData style string that contains sorting for this query in either ascending ("asc") or descending ("desc") order. OrderBy clauses can be used for any of the search number keys or the predefined search keys that are numeric. To sort by closest to a number, a moniker distance can be used to sort by distance from the given number search key. You cannot use ascending or descending with the distance sort. This field only supports either one sort clause or one distance clause. If no sort is provided or if a tiebreak is needed for the given sort, the default sort would be descending based on creation time.

| Example                     | Meaning                                           |
|-----------------------------|---------------------------------------------------|
| number_key1 asc             | order by number search key ascending              |
| lobby/memberCount desc      | order by number search key descending             |
| distance(number_key1 = 5)   | sort on distance from the given number            |
| *default*                   | order by creation time descending                 |



## Example finding lobbies using the Lobby and Matchmaking SDK 

In this example, the player wants to find all lobbies with the following requirements:

* The game-mode is "DeathMatch"
* The competition style is "Ranked"
* The player's skill level is within the lobby's minimum and maximum skill limits.

Additionally, the player wants the results sorted with the following guidelines:

* Lobbies with optimal skill levels closest to the player's skill level should sort higher

```cpp
static PFMultiplayerHandle g_pfmHandle = nullptr;

#define SUPPORT_XBL_CROSSPLAY

#define PFLOBBY_SEARCH_KEY_GAME_MODE "string_key1"
#define PFLOBBY_SEARCH_KEY_COMPETITION_STYLE "string_key2"
#define PFLOBBY_SEARCH_KEY_SKILL "number_key1"

#define GAME_MODE_DEATH_MATCH "DeathMatch"
#define COMPETITION_STYLE_RANKED "Ranked"

// Find lobbies based on player's search criteria.
void FindGamesWithRuntimeQuery(
    uint32_t minimumSkill,
    uint32_t maximumSkill,
    uint32_t optimalSkill)
{
    PFLobbySearchFriendsFilter friendsFilter;
    friendsFilter.includeSteamFriends = true;
#ifdef SUPPORT_XBL_CROSSPLAY
    friendsFilter.includeXboxFriendsToken = MyGame::GetLocalUserXboxToken();
#endif // SUPPORT_XBL_CROSSPLAY

    // Limit results based on friend's filter.
    PFLobbySearchConfiguration searchConfiguration = { 0 };
    searchConfiguration.friendsFilter = &friendsFilter;

    // Create filter string based on player's search parameters.
    std::string filterString;
    filterString += PFLOBBY_SEARCH_KEY_GAME_MODE + std::string(" eq ") + "'" + GAME_MODE_DEATH_MATCH + "'";
    filterString += " and ";
    filterString += PFLOBBY_SEARCH_KEY_COMPETITION_STYLE + std::string(" eq ") + "'" + COMPETITION_STYLE_RANKED + "'";
    filterString += " and ";
    filterString += PFLOBBY_SEARCH_KEY_SKILL + std::string(" -ge ") + std::to_string(minimumSkill);
    filterString += " and ";
    filterString += PFLOBBY_SEARCH_KEY_SKILL + std::string(" -le ") + std::to_string(maximumSkill);

    // Create sort string based on player's sort preference.
    std::string sortString;
    sortString += std::string("distance{") + PFLOBBY_SEARCH_KEY_SKILL + "=" + std::to_string(optimalSkill) + "}";

    searchConfiguration.filterString = filterString.c_str();
    searchConfiguration.sortString = sortString.c_str();

    HRESULT hr = PFMultiplayerFindLobbies(g_pfmHandle, &m_localUser, &searchConfiguration, nullptr);
}

void ProcessStateChanges()
{
    while (true)
    {
        uint32_t stateChangeCount;
        const PFLobbyStateChange* const* stateChanges;
        RETURN_VOID_IF_FAILED(PFMultiplayerStartProcessingLobbyStateChanges(
            g_pfmHandle,
            &stateChangeCount,
            &stateChanges));

        for (uint32_t i = 0; i < stateChangeCount; ++i)
        {
            const PFLobbyStateChange* stateChange = stateChanges[i];
            switch (stateChange->stateChangeType)
            {
                case PFLobbyStateChangeType::FindLobbiesCompleted:
                {
                    GuiPostCurrentLobbySearchResults(
                        static_cast<const PFLobbyFindLobbiesCompletedStateChange&>(*stateChange));
                    break;
                }
                default:
                {
                    break;
                }
            }
        }

        RETURN_VOID_IF_FAILED(PFMultiplayerFinishProcessingLobbyStateChanges(
            g_pfmHandle,
            stateChangeCount,
            stateChanges));
    }
}

// Update game UI to display search results when a list of matching lobbies is returned.
void GuiPostCurrentLobbySearchResults(
    const PFLobbyFindLobbiesCompletedStateChange& stateChange)
{
    if (FAILED(stateChange.result))
    {
        GuiToastErrorAndExitScreen();
        return;
    }

    for (uint32_t i = 0; i < stateChange.searchResultCount; ++i)
    {
        const PFLobbySearchResult& searchResult = stateChange.searchResults[i];
        GuiPostLobbySearchResultRow(searchResult); // defined elsewhere
    }
}
```

## See also

* [Create searchable lobbies](define-search-keywords.md)
* [Join lobbies](join-lobbies.md)
* [Lobby and matchmaking](lobby-and-matchmaking.md)
* [Lobby properties](lobby-properties.md)
* [Create a lobby](create-a-lobby.md)

