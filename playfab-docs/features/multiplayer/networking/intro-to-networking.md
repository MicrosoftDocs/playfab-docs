# Introduction to PlayFab Multiplayer Networking and Chat
PlayFab Multiplayer Networking and Chat is a set of libraries and services for easily adding multiplayer real-time networking and chat communication to your game. 

Concepts
The networking service is oriented around a few key concepts:

- `Network` - A logical representation of a set of interconnected devices participating in a particular multiplayer experience, as well as basic state describing that collection. 
- `Endpoint` - A facility associated with a device that can recieve data from other devices and is the source for sending data to other devices.
- `Network_state_change` - A structure representing a notification to the local device regarding an asynchronous change in some aspect of the network.
- `StartProcessingStateChanges` and `FinishProcessingStateChanges` - The pair of methods called by the app every UI frame to perform asynchronous operations, to retrieve results to be handled in the form of state_change structures, and then to free the associated resources when finished.

At a very high level, the game application uses the  PlayFab networking library to configure a set of users signed-in on the local device to be moved into a PlayFab network. The app calls `StartProcessingStateChanges()` and `FinishProcessingStateChanges()` every UI frame. As app instances on remote devices add their users into a network, every participating instance is provided state_change updates describing the local and remote devices joining that  network. When a player stops participating in the  network (gracefully or due to network connectivity problems), state_change updates are provided to all app instances indicating the user and associated endpoints have  left.

As opposed to a client-server model, a PlayFab network is logically a fully-connected mesh of peer devices. As described in the section of this document, any player can send directly to any other through the API. 

Features

|-|Run-time management|Networking|
|-|-|-|
|Available Now| - Create a network descriptor<br>Join network via descriptor<br> - Read & Write shared network properties<br>Add/remove users to access control list <br> - Modify joinability policy| - Create endpoints for sending/receiving data<br> - Reliable and unreliable send options <br> - Message colescing and queue flushing <br> - Encryption | 
|Coming Soon|-| - Xbox Live authentication <br> - Steam authentication| - Coordinate host state with the authority object|


|-|Chat|Performance|Service administration|
|-|-|-|-|
|Available Now| - Activate voice chat <br> - Interrogate audio device <br> - Per-user mute/unmute controls  | - All async processing conveniently handled via state changes <br> - Custom memory allocator  |
|Coming Soon| - Text Chat <br> - Speech to Text transcription<br>| - Hardware chat acceleration (Xbox)| - Region configuration via Game Manager|
