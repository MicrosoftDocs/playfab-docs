## Communication Fabric (Bumblelion)
This is the homepage for the Bumblelion 1PP Preview. Properly called "PlayFab Multiplayer Communication Fabric," this relay service creates secure, ultra low-latency device-to-device networks. You can use these networks for game data or voice and text chat.

Here are current docs:
- [Private Preview libraries and release notes](./bmbquickstart.md)
- [Stub conceptual introduction](./intro-to-networking.md)

Got questions? Email [Bumblelion Overhead](mailto:bumblelionoverhead@microsoft.com)

Artifacts that are coming soon with the (driver) and (ETA):
- Reference documentation (Marco)(1901)
- Legit conceptual documentation (Chris) (Starting December 1 and improving)
- BumbleRumble (a sample)(Jason Kepner)(December 1)
- Unreal Engine 4 (UE4), socket sub-system plug-in (Deb)(Pending)


## Roadmap
|-|1PP Private Preview (1810)|3PP Private Preivew (1902)|3PP Public Preview (1904)|
|-|-|-|-|
|Players|32 max|-|-|
|Chat|Voice; Speech to text|Text; Text to Speech||
|Identity|PlayFab custom identity; XBL identity|Steam Identity|Steam Compliance; XBL Compliance|
|Network|-|DTLS Security; Datacenter selection|-|
|Administration|-|Game Manager UX | Billing & Consumption analytics|

Backlog (dates TBD):
- Client Audio manipulation (post-decode)
- Client Audio manipulation (pre-encode)
- Speech to Text translation 
- Text to Text translation
- Increaseing player maximum
- PLayFab Multiplayer Server library
- Server Mixing
- Peer-to-peer transport (reduces network egress cost)


## Inital SDK Availability
Table below indicates our confidence level for providing an SDK for the specified platform on that date. We intend to support every platform on this list it's simply a matter of time.

|-|1PP Private Preview (1810)|3PP Private Preivew (1902)|3PP Public Preview 1904|
|-|-|-|-|
|Win32/Win10|Done|-|-|
|Xbox ERA|Available today without hardware acceleration|-|High|
|Win32/Win7|-|High||
|PlayStation|-|-|Medium|
|Android|Unplanned|
|Switch|Unplanned|
|iOS|-|-|Low|
|GameCore/Win10|-|High|-|
|GameCore/Xbox|-|High|-|
