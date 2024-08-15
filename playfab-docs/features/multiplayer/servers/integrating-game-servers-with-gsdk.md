---
title: Integrating game servers with the PlayFab Game Server SDK (GSDK)
author: joannaleecy
description: Describes how to integrate PlayFab multiplayer game servers with the PlayFab Game Server SDK (GSDK).  
ms.author: joanlee
ms.date: 01/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, debugging, integration, thunderhead, playfab game server sdk
ms.localizationpriority: medium
---

# Integrating game servers with the PlayFab Game Server SDK (GSDK)

## Overview

The PlayFab Game Server SDK (GSDK) is provided in C++, C#, and Java versions. The GSDK connects your game server to the PlayFab agent installed on the VM. This agent facilitates key server interactions with the PlayFab Multiplayer platform.

## Basic integration

For your game server to be able to communicate with the PlayFab multiplayer platform, you need to integrate with the GSDK. At a minimum, you must implement the `Start` and `ReadyForPlayers` methods in your game server.

```cpp
int main()
{
    // Call this while your game is initializing; it will start sending a heartbeat to our agent and put the game server in an Initializing state
    Microsoft::Azure::Gaming::GSDK::start();

    /* Add any other initialization code your game server needs before players can connect */

    // Call this when your game is done initializing and players can connect
    // Note: This is a blocking call, and will return when this game server is either allocated or terminated
    if (Microsoft::Azure::Gaming::GSDK::readyForPlayers())
    {
        // readyForPlayers returns true when an allocation call has been done, a player is about to connect!
    }
    else
    {
        // readyForPlayers returns false when the server is being terminated
    }

}
```
```csharp
static void Main(string[] args)
{
    // Call this while your game is initializing; it will start sending a heartbeat to our agent and put the game server in an Initializing state
    GameserverSDK.Start();

    /* Add any other initializion code your game server needs before players can connect */

    // Call this when your game is done initializing and players can connect
    // Note: This is a blocking call, and will return when this game server is either allocated or terminated
    if (GameserverSDK.ReadyForPlayers())
    {
        // readyForPlayers returns true when an allocation call has been done, a player is about to connect!
    }
    else
    {
        // readyForPlayers returns false when the server is being terminated
    }

}
```
```java
public static void main(String[] args)
{
    // Call this while your game is initializing; it will start sending a heartbeat to our agent and put the game server in an Initializing state
    GameserverSDK.start();

    /* Add any other initializion code your game server needs before players can connect */

    // Call this when your game is done initializing and players can connect
    // Note: This is a blocking call, and will return when this game server is either allocated or terminated
    if (GameserverSDK.readyForPlayers())
    {
        // readyForPlayers returns true when an allocation call has been done, a player is about to connect!
    }
    else
    {
        // readyForPlayers returns false when the server is being terminated
    }

}
```

## Logging with the GSDK

When your game server ends, the PlayFab VM agent will zip any log files, and make them available to you.  <!--via the [GetMultiplayerServerLogs](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.getmultiplayerserverlogs) API.-->

There are two ways to add log files from your game:

1. Use the GSDK's `Log` method - It will add your own log lines to the GSDK log file.
2. Write your own log file in the appropriate log directory that the PlayFab VM agent will zip up and upload.



```cpp
// This will add your log line to the GSDK log file, alongside other information logged by the GSDK
Microsoft::Azure::Gaming::GSDK::logMessage("Here is a sample log");

// Alternatively, you can log your own files to the log directory
std::string logFolder = Microsoft::Azure::Gaming::GSDK::getLogsDirectory();
```
```csharp
// This will add your log line to the GSDK log file, alongside other information logged by the GSDK
GameserverSDK.LogMessage("Here is a sample log");

// Alternatively, you can log your own files to the log directory
string logFolder = GameserverSDK.GetLogsDirectory();
```
```java
// This will add your log line to the GSDK log file, alongside other information logged by the GSDK
GameserverSDK.log("Here is a sample log");

// Alternatively, you can log your own files to the log directory
String logFolder = GameserverSDK.getLogsDirectory();
```

## Gracefully shutting down your game server

There are three scenarios in which your game server will end:

1. Your game server application exits.

2. PlayFab terminates your game server because there are more game servers available than is necessary for the current player load.

> [!NOTE]
> PlayFab will *only* terminate game servers that are not currently active.

3. Azure will perform required maintenance on the virtual machine that is hosting your game server.

For **(1)** above: You control when it happens, and can perform any necessary cleanup before your application exits.

For **(2)** and **(3)** above: The GSDK provides a way for you to know when they will occur, by specifying a callback method.

```cpp
// This method will be called in case #2, when PlayFab terminates the game server
void onShutdown()
{
    printf("GSDK is shutting me down!!!\n");
    /* Perform any necessary cleanup and end the program */
    std::exit(0);
}

// This method will be called in case #3, when Azure will perform maintenance on the virtual machine
void onMaintenanceScheduled(tm t)
{
#ifdef WINDOWS
    time_t local = _mkgmtime(&t);
    double delta = difftime(local, time(NULL));
    struct tm buf;
    char str[26];
    gmtime_s(&buf, &local);
    asctime_s(str, sizeof str, &buf);
    printf("UTC:   %s", str);
    localtime_s(&buf, &local);
    asctime_s(str, sizeof str, &buf);
    printf("local: %s", str);
    printf("delta: %f", delta);
#else // Linux
    time_t local = timegm(&t);
    double delta = difftime(local, time(NULL));
    printf("UTC:   %s\n", asctime(gmtime(&local)));
    printf("local: %s\n", asctime(localtime(&local)));
    printf("delta: %f\n", delta);
#endif

    /* Perform any necessary cleanup, notify your players, etc. */
}

int main()
{
        Microsoft::Azure::Gaming::GSDK::start();
        Microsoft::Azure::Gaming::GSDK::registerShutdownCallback(&onShutdown);
        Microsoft::Azure::Gaming::GSDK::registerMaintenanceCallback(&onMaintenanceScheduled);

        // Continue initializing your game
}
```
```csharp
// This method will be called in case #2, when PlayFab terminates the game server
static void OnShutdown()
{
    GameserverSDK.LogMessage("Shutting down...");
    /* Perform any necessary cleanup and end the program */
}

// This method will be called in case #3, when Azure will perform maintenance on the virtual machine
static void OnMaintenanceScheduled(DateTimeOffset time)
{
    /* Perform any necessary cleanup, notify your players, etc. */
}

static void Main(string[] args)
{
    GameserverSDK.Start();
    GameserverSDK.RegisterShutdownCallback(OnShutdown);
    GameserverSDK.RegisterMaintenanceCallback(OnMaintenanceScheduled);

    // Continue initializing your game
}
```
```java
// This method will be called in case #2, when PlayFab terminates the game server
private static void onShutdown()
{
    System.out.println("Shutting down...");
    /* Perform any necessary cleanup and end the program */
}

// This method will be called in case #3, when Azure will perform maintenance on the virtual machine
private static void onMaintenanceScheduled(ZonedDateTime time)
{
    /* Perform any necessary cleanup, notify your players, etc. */
}

static void Main(string[] args)
{
    GameserverSDK.start();
    GameserverSDK.registerShutdownCallback(Main::onShutdown);
    GameserverSDK.registerMaintenanceCallback(Main::onMaintenanceScheduled);

    // Continue initializing your game
}
```

## Giving PlayFab information about your game server

Currently there are two things you can communicate to PlayFab using the GSDK:

1. Your game server's current health status.
2. A list of players that are currently connected to your game server.

These two pieces of information will be transmitted to PlayFab in the next heartbeat, and can currently be used for reporting.

```cpp
static std::vector<Microsoft::Azure::Gaming::ConnectedPlayer> players;

void playerConnected()
{
    // When a new player connects, you can let PlayFab know by adding it to the vector of players and calling updateConnectedPlayers
    players.push_back(Microsoft::Azure::Gaming::ConnectedPlayer("player_tag"));
    Microsoft::Azure::Gaming::GSDK::updateConnectedPlayers(players);
}

// This method will be called on every heartbeat to check if your game is healthy, as such, it should return very quickly
bool isHealthy()
{
    // Return whether your game server should be considered healthy
    return true;
}

int main()
{
        Microsoft::Azure::Gaming::GSDK::start();
        Microsoft::Azure::Gaming::GSDK::registerHealthCallback(&isHealthy);

        // Continue initializing your game
}
```
```csharp
static private List<ConnectedPlayer> players = new List<ConnectedPlayer>();

static void OnPlayerConnected()
{
    // When a new player connects, you can let PlayFab know by adding it to the vector of players and calling updateConnectedPlayers
    players.Add(new ConnectedPlayer("player_tag"));
    GameserverSDK.UpdateConnectedPlayers(players);
}

// This method will be called on every heartbeat to check if your game is healthy, as such, it should return very quickly
static bool IsHealthy()
{
    // Return whether your game server should be considered healthy
    return true;
}

static void Main(string[] args)
{
    GameserverSDK.Start();
    GameserverSDK.RegisterHealthCallback(IsHealthy);

    // Continue initializing your game
}
```
```java
private static ArrayList<ConnectedPlayer> players = new ArrayList<ConnectedPlayer>();

private static void onPlayerConnected()
{
    // When a new player connects, you can let PlayFab know by adding it to the vector of players and calling updateConnectedPlayers
    players.add(new ConnectedPlayer("player_tag"));
    GameserverSDK.updateConnectedPlayers(players);
}

// This method will be called on every heartbeat to check if your game is healthy, as such, it should return very quickly
private static GameHostHealth getGameHealth()
{
    // Return whether your game server should be considered healthy
    return GameHostHealth.Healthy;
}

static void Main(string[] args)
{
    GameserverSDK.start();
    GameserverSDK.registerHealthCallback(Main::getGameHealth);

    // Continue initializing your game
}
```

## Getting configuration settings within your game server

There are several PlayFab settings related to your game server that you can retrieve using the GSDK.

> [!NOTE]
> Two of these settings are *actually* passed in to PlayFab by your clients, as part of the call to request a multiplayer server. So those settings will *not* be available to your game server until it is allocated.

```cpp
// Get all the configuration values
std::unordered_map<std::string, std::string> config = Microsoft::Azure::Gaming::GSDK::getConfigSettings();

// Retrieve a particular configuration value
auto it = config.find(Microsoft::Azure::Gaming::GSDK::SESSION_COOKIE_KEY);

if (it != config.end())
{
    std::string sessionCookie = config[Microsoft::Azure::Gaming::GSDK::SESSION_COOKIE_KEY];
}

// Here some other useful configuration keys (the full list is in gsdk.h)
static constexpr const char* SERVER_ID_KEY; // ID given to your game server upon creation
static constexpr const char* LOG_FOLDER_KEY; // Path to the folder that should contain all log files
static constexpr const char* CERTIFICATE_FOLDER_KEY; // Path to the folder that contains any game certificate files
static constexpr const char* TITLE_ID_KEY; // PlayFab Title ID for this game server
static constexpr const char* BUILD_ID_KEY; // PlayFab Build ID for this game server
static constexpr const char* REGION_KEY; // Azure Region this server is running in

// These two keys are only available after allocation (once readyForPlayers returns true)
static constexpr const char* SESSION_COOKIE_KEY; // The Session Cookie you passed into the allocation call when you requested a server
static constexpr const char* SESSION_ID_KEY; // The Session ID you specified in the allocation call when you requested a server
```
```csharp
// Get all the configuration values
IDictionary<string, string> config = GameserverSDK.getConfigSettings();

// Retrieve a particular configuration value
if (config.TryGetValue(GameserverSDK.SessionCookieKey, out string sessionCookie))
{
    // sessionCookie contains the value
}

// Here are some other useful configuration keys (the full list is in the GameserverSDK class)
public static string ServerIdKey; // ID given to your game server upon creation
public static string LogFolderKey; // Path to the folder that should contain all log files
public static string CertificateFolderKey; // Path to the folder that contains any game certificate files
public static string TitleIdKey; // PlayFab Title ID for this game server
public static string BuildIdKey; // PlayFab Build ID for this game server
public static string RegionKey; // Azure Region this server is running in

// These two keys are only available after allocation (once readyForPlayers returns true)
public static string SessionCookieKey; // The Session Cookie you passed into the allocation call when you requested a server
public static string SessionIdKey; // The Session ID you specified in the allocation call when you requested a server
```
```java
// Get all the configuration values
Map<String, String> config = GameserverSDK.getConfigSettings();

// Retrieve a particular configuration value
if (config.containsKey(GameserverSDK.SESSION_COOKIE_KEY))
{
    String sessionCookie = config.get(GameserverSDK.SESSION_COOKIE_KEY);
}

// Here are some other useful configuration keys (the full list is in the GameserverSDK class)
public static final String SERVER_ID_KEY; // ID given to your game server upon creation
public static final String LOG_FOLDER_KEY; // Path to the folder that should contain all log files
public static final String CERTIFICATE_FOLDER_KEY; // Path to the folder that contains any game certificate files
public static final String TITLE_ID_KEY; // PlayFab Title ID for this game server
public static final String BUILD_ID_KEY; // PlayFab Build ID for this game server
public static final String REGION_KEY; // Azure Region this server is running in

// These two keys are only available after allocation (once readyForPlayers returns true)
public static final String SESSION_COOKIE_KEY; // The Session Cookie you passed into the allocation call when you requested a server
public static final String SESSION_ID_KEY; // The Session ID you specified in the allocation call when you requested a server
```
