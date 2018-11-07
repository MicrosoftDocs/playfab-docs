# PlayFab Release Notes 2018

## 181105

Date: 2018-11-05

**API Changes:**

* PlayFab now supports login and account-linking with OpenID
* Additional XboxLive ID support, and enabling Xbox login via server

In preparation for wider release of the service, we are rolling out PlayFab Multiplayer Servers 2.0 APIs. See http://aka.ms/PlayFabMultiplayer for more information

## 181001

Date: 2018-10-01

**API Changes:**

* A variety of deprecations have taken effect, and those elements have been removed from SDKs and documentation
    * Some Admin API methods related to unreleased features have been hidden
    * server.DeleteUsers deprecation has taken effect
    * A field deprecation for "ServerHostname", spread across a variety of matchmaking related calls in admin, client, matchmaker, and server APIs has taken effect. "ServerIPV4Address" is the replacement.
    
**UnitySdk Changes:**

* Minor fixes/improvements to ScreenTime analytics

**All SDKs:**

* The automated-build branch structure for GitHub repos is changing
    * The normal customer facing branches, "versioned" and "master" will be unchanged
