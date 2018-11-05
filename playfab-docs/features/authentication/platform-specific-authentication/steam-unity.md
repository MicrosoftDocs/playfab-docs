# Setting up PlayFab authentication using Steam and Unity

This tutorial guides you through an example of how to log into PlayFab using Steam through SteamWorks and Unity.

## Prerequisites

- Unity project with imported PlayFab SDK and configured title ID
- Steam Application with:
  - AppID set up. The AppID is usually acquired through the [Steam Direct (Formerly Greenlight)](https://partner.steamgames.com/steamdirect) process.
  - Steam Publisher Web API key. Follow [Creating a Publisher Web API Key](https://partner.steamgames.com/doc/webapi_overview/auth#create_publisher_key) in the Steamworks Documentation to generate a Publisher Key.
- Familiarity with [Login basics and Best Practices](../../authentication/platform-specific-authentication/login-basics-best-practices.md)

## Setting up a PlayFab title

To enable support for Steam authorization, PlayFab requires you to enable the Steam add-on. On your title Game Manager page, navigate to the "Add-ons" tab **(1)**. In the list of available Add-ons, locate Steam and click the title **(2)**:

![Game Manager Add-ons tab](media/tutorials/steam-unity/game-manager-addons-tab-steam.png)  

Enter your App ID **(1)**, Web API Key **(2)** and click "Install Steam" **(3)**:  

![Game Manager install Steam Add-on](media/tutorials/steam-unity/game-manager-install-steam-addon.png)  

This concludes setting up a PlayFab title for Steam integration.

## Setting up a Unity project

Start by downloading the latest release of Steamworks.NET from the [Releases page](https://github.com/rlabrecque/Steamworks.NET/releases). Get the Unity Package version of the release and import it into the project. Once you import the package, close Unity and navigate to the project root folder. Locate the "steam_appid.txt" file. Open it, and replace the App ID value with your own:

![Unity project - Update AppId](media/tutorials/steam-unity/unity-project-update-appid.png)  

Open Unity back up and create a new scene. Inside that scene create a new gameobject called "Steam".
- Add a "SteamManager" component to the gameobject **(1)**. This component is part of Steamworks.Net
- Create and add a "SteamScript" component to the gameobject **(2)**. 

![Unity project - Add Steam object](media/tutorials/steam-unity/unity-project-add-steam-object.png)  

The following example shows the code for the "SteamScript" component. [Thanks to Dylan Hunt for this example](https://community.playfab.com/answers/8875/view.html):

```csharp
// Import all the necessary namespaces
using System;
using System.Text;
using PlayFab;
using PlayFab.ClientModels;
using Steamworks;
using UnityEngine;

public class SteamScript : MonoBehaviour {
    //This method returns
    public string GetSteamAuthTicket() {
        byte[] ticketBlob = new byte[1024];
        uint ticketSize;

        // Retrieve ticket; hTicket should be a field in the class so you can use it to cancel the ticket later
        // When you pass an object, the object can be modified by the callee. This function modifies the byte array you've passed to it.
        HAuthTicket hTicket = SteamUser.GetAuthSessionTicket(ticketBlob, ticketBlob.Length, out ticketSize);

        // Resize the buffer to actual length
        Array.Resize(ref ticketBlob, (int)ticketSize);

        // Convert bytes to string
        StringBuilder sb = new StringBuilder();
        foreach (byte b in ticketBlob) {
            sb.AppendFormat("{0:x2}", b);
        }
        return sb.ToString();
    }

    public void OnGUI() {
        if (GUILayout.Button("Log In")) {
            if (SteamManager.Initialized) {
                // Execute PlayFab API call to log in with steam ticket
                PlayFabClientAPI.LoginWithSteam(new LoginWithSteamRequest {
                    CreateAccount = true,
                    SteamTicket = GetSteamAuthTicket()
                }, OnComplete,OnFailed);
            }
        }
    }

    // Utility callbacks to log the result
    private void OnComplete(LoginResult obj) {
        Debug.Log("Success!");
    }

    private void OnFailed(PlayFabError error) {
        Debug.Log("Failed: " + error.GenerateErrorReport());
    }
}
```

## Testing

You may test right inside the editor. Run the scene and click the "Log In" button in the top left corner **(1)**. The console message should appear soon, indicating the authentication result **(2)**:

![Unity test PlayFab login with Steam](media/tutorials/steam-unity/unity-test-playfab-login-with-steam.png)