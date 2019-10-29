A key benefit of using PlayFab multiplayer servers or other orchestrators is fulfilling player demand efficiently. Ideally you would only consume as much cloud compute as necessary to power active player activity. The reality is that  multiplayer servers spend some time in the following non-active states:

- **Pre-propping**. Azure and PlayFab must create the virtual machine, initialize its operating system, and configure its environment. PlayFab drives this pre-propping activity before the virtual machine is assigned to a customer and billed.
- **Propping**. The game servers assets must be loaded, and the game server application itself often need some time to prepare for players. 
- **Standing by**. In order to immediately fulfill demand for a multiplayer server, some servers are kept idle ready for players constantly.

Servers in the propping and standing-by states are billed to your title, and you will want to optimize these processes to reduce costs. You configure standing-by targets on a per build and per region basis. Typically you should set the standing-by level proportionally to the propping time and target allocation rate:

```
Propping Time (Seconds) * Target Allocation Rate (Servers / Seconds) = Standing By Target (Servers)
```

Let's take an example of a Linux server that takes 100 seconds to prop, and a game that is expected up to 1 server allocated every 5 seconds (0.2 Servers / Second). A standing by pool of 100 * 0.2 = 20 servers will stably support this build. After 100 seconds, 20 servers will be expended but there will have been time to build another 20. 

When calling the `RequestMultiplayerServer` API, it is important to indicate all of the regions that are acceptable to the player experience. If region #1 does not have standing by servers available, than region #2 will be requested and so on. 

## Dynamic Pool Starvation Prevention (Auto On-Call)
In some situations it is difficult to estimate the target allocation rate. Even if you have a good bead on your game's steady state, marketing events and other community drivers can cause player activity to significantly burst server demand to 2x or even 10x the average allocation rate.

Auto on-call is a set of PlayFab features that allows you to configure low standing-by targets but enjoy some resiliency to burst events. When activated on a build, auto on-call monitors for allocation rates that will starve the standing-by pool. When high allocation rates are detected, auto on-call will increase the standing-by target automatically.

When allocation rates fall to a supportable rate, auto on-call will revert the build to your configured standing-by target. 



