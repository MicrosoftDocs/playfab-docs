---
title: LiveOps Techniques
author: v-kciril
description: Techniques for using LiveOps with PlayFab.
ms.author: v-kciril
ms.date: 01/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, real-time analytics, PlayStream, live operations, player behaviors, event archiving, data export, player data, webhooks, analytic reporting, reports
ms.localizationpriority: medium
---

# LiveOps Techniques

In the previous section we went through a high-level overview of why LiveOps is a key success driver for today’s top games. Now, we’re going to get into the details of the disciplines that make up the LiveOps toolkit, with examples from folks in the trenches and their best practices.

Topics include:

- Analytics and segmentation
- Launching with a LiveOps team
- Running live events
- Tournaments, multiplayer and guilds
- Content
- Localization
- Running experiments
- Community
- Moderation
- Monetization - advertising and IAP best practices
- User acquisition
- Retention
- Engagement
- Support
- Plateau and sunset

## Analytics for LiveOps

Measuring and analyzing your game’s performance is critical for improving that performance and increasing your revenues. If you haven’t already become familiar with key performance indicators (KPIs) like ARPU (average revenue per user), ARPPU (average revenue per paid user), ARPDAU (average revenue per daily active user), Day One Retention (the proportion of of players that return one day after downloading your game), or Conversion, you’ll want these elements and more in your daily dashboard to monitor your game performance. But you also need to be tracking these in real time.

The importance of real-time access to data in a world where customers respond instantaneously to changes in your gameplay or errors that your game throws off cannot be overstated. Waiting 24 hours or more to learn how players react to a change or to discover issues like fraud can be a crippling blow to your game. Notes Renee Ya, Founder at Tiger Byte Studios, “I believe it's important to stay nimble in a constantly changing environment where you are willing to pivot to a new strategy at a moment's notice based off of rigorous data analysis.” She advocates for deep-diving into a game’s stats at least twice a week with key stakeholders, “reviewing metrics and creating hypotheses with action items and checking back often to see how we moved the needle based off of feedback.”  

When Fluffy Fairy Games launched its hit game Idle Miner Tycoon, the team made the decision to launch a lightweight version of the game as quickly as possible and iterate, rather than building out a fully-featured game. This Minimum Viable Product (MVP) model is becoming popular with cutting-edge game developers. “The old game development mode was to lock yourself in for 5 years before going to the public - some developers still prefer to work that way. But these days, more and more developers use the MVP approach,” says growth and strategy consultant Sebastian Knopp. “You don't need a full featured game to start and to see if there is traction from its unique combination of category, artistic style, and fiction.” Define the core loop, and “if there is traction, then you take this MVP and develop it further, always developing very close to the customer.” 

Fluffy Fairy took this approach to heart; rather than focusing on growing player numbers through user acquisition or being featured in an app store, they focused on building traction, focusing tightly on key metrics like early retention signals, number of sessions, DAU (Daily Active Users), and ad monetization. In the game’s early days, before there were large numbers of players, Fluffy Fairy’s Marketing Director Volkmar Reinerth relied heavily on “player feedback, following the company spirit to be player-centric.” Then, as the game found and began to grow an audience of players, who in turn began to generate more data, the company prioritized collecting more data for analytics.

![Rank History](media/ranker-history1.png)
*Idle Miner Tycoon*: focusing on customer traction pays off in the long run.

At PlayFab, we’ve found the following to be a good basic set of KPIs for all games to track over time:

- New players - as a measure of acquisition effectiveness
- Unique logins over time (daily and monthly active users) - to track engagement
- Total game sessions over time (most importantly, sessions per DAU) - to track engagement
- Total payers and conversion rate (% of payers) - to monitor monetization effectiveness
- Revenue - monetization measure
- Errors - ultimately, these will impact player satisfaction
- ARPU - monetization tracking
- ARPPU - to track monetization

Most analytics solutions provide at-a-glance reporting for these key KPIs, but for in-depth analysis, you’ll likely want the ability to run custom queries across your full data set as well. This requires the ability to store and access your raw game data through a data warehouse. You’ll also want to slice these KPIs into cohorts based on when a player first started; this will give you insight into how the game is performing for longstanding players vs. newer ones. 

Data visualization is an important tool for understanding the story your data is telling you. Look for cyclical trends like weekday vs. weekend, track performance over time, and get a feel for the impact that major changes - whether that’s your live events or error spikes - have on your game in the short and longer term. 

![Logins](media/logins-purchases2.png)

![Calls and Errors](media/calls-errors3.png) 

You’ll also want to be able to drill into your event history across preset or custom event queries as a way to help you track and optimize performance and monetization of your live events and benchmark your performance vs. past initiatives.

![Event History](media/event-history4.png)

Not all players are created equal, and one important tactic for making your game successful is segmenting your players and finding ways to stimulate each segment to behave in a way that benefits your game. Marketers need the ability to create custom segments and then treat those segments differently (e.g. customize messaging, events, inventory, stores, and more by segment). That’s because every game is different - for some games, it’s critical to track which players spend early (in their first few sessions) because players who spend early, spend often. Other games report that one of their most important metrics is total spend by Day 7, because this is a marker for long-term engagement and spend. And obviously no matter what, you’ll want to be able to track ongoing spend patterns of your players to make sure that changes you make to the game don’t have unforeseen impacts. Finally, if you plan on using A/B testing to validate elements of your game play, you will need to manage each group in your test as a segment.

As you think about analytics, avoid the trap of focusing on headline metrics and use your data to try to dig into specific problems and solve them. It’s useful to know that a first day retention rate for idle games is typically over 50%, vs. over 30% for strategy games, so you can benchmark yourself against the norms (though bear in mind that metrics will vary from country to country). But while tracking retention is important, it’s not actually an actionable metric in itself. Segmentation helps you turn a question like “why is retention stuck at 20%? What can I do about that?” into a more actionable question like "how are my players who reached level 50 different from players who left before level 10? What are the behaviors that differentiate the two groups? And is there something I can do to encourage the players who left to act more like the players who stuck around?” This will help you design and test hypotheses - for example, perhaps players are dropping off when they fail to complete an especially hard level. If the data bears that theory out, you can test potential solutions - e.g. offering one-off boosts or other help targeted only to players who are getting stuck, to encourage them to keep going while avoiding impacts to the difficulty curve for the other players who found the difficulty of that level just right.

### Analytics best practices

- Monitor your key stats daily or even hourly to ensure things are running smoothly. A real-time visualization of the data pipeline can be very helpful here.
- Review key reports at least weekly with your team members. Ideally, you should be able to access high-level overview and drill-down detailed reports on-demand and send them automatically to interested parties via a regular email cadence.
- Be inquisitive - run queries against your data warehouse to figure out what’s going on inside your game, and to help design new features.
- When customers have problems, analyze their event history to see what happened.
- Think about the right “funnel” progression for players in your game, and design segments to track players as they move along this funnel.
- Experiment with how to motivate players to move through your funnel - in-game messaging, external marketing, email, etc.
- Compare behavior differences in players in segments you’re happy with, e.g. “players who got to level 50” to players in segments you don’t like, e.g. “players who quit before level 10.” Are there things you can do to encourage one to act more like the other?

### Segmentation

As your game gains traction, you’ll start to see player segments form naturally, and your analytics toolset should make it easy for you to define custom segments in a way that makes sense for your game (e.g. high XP players, currently active players, lapsed players, players who have made purchases, whales…). Then, as you run experiments and test your ideas, you can track how players in your key segments react. When you do something that stimulates the behavior you want to see in a key segment (such as a particular kind of promotion or event), make a note of it and try other similar tactics to see if you can get that effect consistently. Of course, you need to be thoughtful about going to the same well too often or you can burn players out.

![Segments](media/segments5.png)
![Segments](media/segments6.png)

At a minimum, games should think about the basic "funnel" in their game. For example, you can define some simple segments as follows:

- "new players" - anyone up to level 10
- "non-spenders" - over level 10, LTV = 0
- "spenders" - where LTV > 0 but < $100
- "whales" - where LTV > $100

Once you do this, it’s easy to track your progress getting players to move up the value chain from one segment to the next through various tactics you try out. Other common player segments can include your early adopters (players who participated in your beta, perhaps), by platform (e.g., console versus mobile), by country (especially if you think you need to tune your game differently in different countries).

Once you have defined the segments you care about, you will want to be able to treat players in each of those segments differently. For example, you might want to show different tips and tricks to each funnel segment to encourage them to move up to the next segment, or only show in-game ads to non-payers, or tune your game mechanics differently in certain countries.

“Following the machine learning trends, we are quickly getting to a world in which we can't keep track of all the player segments treated differently. While in the past modelling a user journey around 20-50 key points in the game (leveling up, unlocking specific content, taking part in game modes for the first time, etc.) and putting some additional segmenting properties on top - total revenue from a player, total engagement from a player, number of friends, etc. was enough, it's happening already, but will happen even more in the future that we just define a lot of promotions and let the machine learning handle the segmentation.”
---Dimitar Draganov, Senior Product Manager, flaregames

Segmentation best practices

- Make a list of the segments you care about in your game, starting with your key funnels, such as your monetization funnel.
- Ensure that your analytics tools let you view your KPIs by segment, so you can compare performance across your segments. You may also want to view your A/B test results by segment as well.
- Design your backend tools so you can treat players in each segment differently. The most common areas for differentiation include messaging, stores, game configuration, offers and promotions, limited content, and events.
- Consider investing in machine learning to automatically segment players into the groups most likely to respond to various promotions and events. Over time, it's likely that we will move toward "segments of one" where individual players are receiving individualized attention and unique game experiences.

“Consumers don’t really want lot of new ideas, they want the thing they are into to get better and better.”
---Mark Pincus, Founder and former CEO, Zynga
 
## How LiveOps changes launch

Since there have been games, there have been launches...and all the things that can and do go wrong with launch. The advent of games-as-a-service makes it easier for studios to dodge some of the most common pitfalls that have crippled previous generations of games, such as failing to scale your backend and then falling over when your game spikes in popularity after being featured. But savvy developers know to start planning their LiveOps strategy well before launch day. “With a LiveOps game, the real work starts with launch instead of ending there. And that is a big challenge for game developers,” says growth and strategy consultant Sebastian Knopp.

“Move fast and scale everything.”  
--Pascale Clarysse, CMO, Eden Games

Well before launch day, you should have your LiveOps team staffed, trained up and ready to go. Who’s on the LiveOps bus? Your core team should have people assigned to the game responsible for technology (from product through QA), user acquisition, monetization, community, and customer service. And these people should be a close-knit team, working together towards common goals, rather than a loose affiliation of representatives from various departments. It’s very important that roles and responsibilities within the team are clearly laid out, so that the group can make and execute on decisions quickly. Your LiveOps team needs to be familiar with the game’s event and content strategy and have a calendar in place for the first few months. They must also have developed strong feedback loop mechanisms with players and agreed to a framework for a decision-making process based on that feedback plus game data (along with perhaps a dash of developer intuition) prior to launching the game. Large companies like Supercell are known to pride themselves on not allowing teams to make any decisions based only on “gut feeling” after a game is launched. 

Ask yourself: does everyone know who is responsible for coordinating new content to support themed events, creating customer segments and generating (and communicating) offers to those segments? Do you have a strong feedback loop from your community to your product and technical teams, and a process to distill feedback into concrete learnings? Customer support similarly needs to have a clear understanding of policy, and tools and rules set up to drive compliance with that policy. Your engineers should be ready to handle spikes in volume stemming from promotional and marketing activity, regardless of how much notice you get (if any). 

Unfortunately, there’s no such thing as a dry run in live games. Determining if your game is ready for launch is very challenging from a standing start - so if you’re investing in a long development cycle prior to launching your game, make sure to build time for a soft launch into your master plan. When designed correctly, soft launches should give you nearly as much insight into your game play and operational performance as a full launch, but at a small fraction of the risk. Soft launches are a fantastic way to see if your game is connecting with its intended audience, track if players are behaving as you’d expect them to, and tweak monetization - without squandering the momentum you can get from a new launch.

During your soft launch phase, make sure to put your game through its paces. Confirm your operations are running smoothly: get your LiveOps team lined up and have them start using their tools; put your CS team to work handling support issues - and then keep an eye on how both teams are doing. Did everything work as planned? How did customers react? Did your reps break anything? If you experienced any surprises, consider how you might want to create guard rails that will prevent those from happening again when the consequences are greater. Server logic provides a quick, yet scalable, means of handling unexpected or changing scenarios. If your backend doesn’t already support this, you can still augment your existing structure with a backend-as-a-service product such as PlayFab.

“What we have done [during soft launch] is via game analytics, monitoring how long people play and how often, how many brutes are killed, etc. Also watching the YouTube videos that people make to understand their interactions with the game. A few years ago you didn’t really have that, it’s a big help - you can literally watch someone go through their first play experience. If they pick it up, whether they’re struggling or not. It’s really valuable.”
---Andy Wiltshire, Director, Bulletproof Arcade

During soft launch, you’ll also want to confirm that you can update your game without causing disruption to players - and make sure that if something goes wrong with a deployment that you can roll back the changes to minimize impact. Run retrospectives frequently and be prepared to iterate quickly to make improvements - because while a soft launch is a smart investment, the quicker you can move into full launch, the faster you can start to make real money from your game.

All that said, many smaller developers are starting to eschew soft launches in favor of lean launches. Launching with an MVP gives you a chance to connect with your natural audience and then tune the game based on the direct feedback of your players, focusing your energies on building out the features and functionality that are most likely to resonate with your audience. The trick? You need to be able to adapt your game quickly.  

## Best practices for launch

- Have you assembled your LiveOps team? Are they prepared to start meeting each day to review the previous 24 hours? Do you have a defined process for making decisions as a team?
- Has your LiveOps team developed a calendar for the first few months of your game, so you stay in sync with the development and roll-out of your content, promotions and events?
- Does your LiveOps team have access to the reports and dashboards they need to monitor progress?
- If your LiveOps team changes configuration of your game to run events, add content, and make quick-twitch changes, do you have validation checks in place?
- Have you rehearsed key LiveOps tasks like adding items to the catalog, adding new content, and adding in-game messages?
- Do you have a way to roll back changes?
- Have you set roles and permissions so team members can't make changes they're not trained for? 

## Live events

Running successful events is perhaps the most essential LiveOps skill. A good event has the ability to stimulate player engagement while also encouraging players to step up purchase activity. A really good event accomplishes both those things without burning players out. The key elements of successful events include:
- Limited-time nature - most events run for a week or less, though some games (where it takes time to ramp up on how to play using the new content, or where it takes time to assemble a team) might well run events for longer
- Engaging theme and content - good events spark player curiosity, encouraging them to want to check the event out
- Attractive limited-time offers that stimulate purchase behavior
- An effective means of communicating with players that can draw people who aren’t currently playing into the game very quickly
- A sense of excitement around the event, such that skipping it would cause players to feel they’ve missed out on something special which their friends are doing

![Adventures](media/adventures7.png)

So what does that mean, exactly? In the abstract, a live event is simply a temporary but meaningful change to a game’s content. Holidays are an obvious theme for events, both because players will generally share some similar associations with the holiday which can be reflected in fun limited-time changes to the game’s appearance, and because holidays can be times when players have more free time available and offering them a reason to play can provide a boost in engagement. Games like Clash of Clans and Brutes.io make a practice of running major events for Halloween and the winter holidays, for example. 

However, events like contests and tournaments can also run at a smaller scale than full-game live events, requiring significantly less overhead, and furthermore can be targeted to different segments to help minimize player burnout. Space Ape and Hyper Hippo both make a point of scheduling multiple smaller events in between their periodic bigger events to avoid player burnout.

Events can also run in parallel, not just in series. Clash Royale organizes daily and weekly “quests”, in addition to special Gold Rush and Gem Rush events where players can earn gold or gems. Events are a great way to experiment with new ideas for your game to see what stimulates the kinds of player behaviors you want to see. Just remember to track and analyze the data, as well as to keep a calendar of your current and planned events to avoid tripping yourself up.

Events often have a "fiction" that masks the actual changes associated with the event. The changes themselves can be something simple, like a higher drop-rate on a particular rare item, or perhaps a new bundle for sale. However, the fiction for the event might still be something dramatic like "Midsummer Night’s Terror" with an equally dramatic description. Furthermore, while some types of events require in-game work, others can be run entirely by looking at event logs and analytics after the fact. For example, an event where players compete to catch the most fish doesn't necessarily require any changes to the game - you can just run a database query after the event to measure who caught the most fish.

![Snowpark](media/snowpark8.png)

Companies like Fluffy Fairy Games understand the dynamics of limited-time events, and have hit all the right notes in their game Idle Miner Tycoon. “We do event mines on a regular basis - at least one event mine per month and also focus on special events, holidays like Halloween, Christmas etc. You can access mines for a limited time period (3-7 days) and get specific rewards for achieving specific obstacles - different from the normal mines. For special events, we try to get new offers with specific items, for example a really good boost. We also have limited offers which rotate - every second day or so you can get very special items. We schedule countdowns and times on PlayFab,” says Oliver Löffler, Fluffy Fairy’s CTO. “To prepare - first we have to prepare new assets with the graphic teams, the game designers refresh the ideas and then bring it all together on the development side. We have different channels to message players. Push notifications have generated a huge increase in logins. In-game messaging - pop-ups that notify players of events. Also all the channels - Facebook, Discord, Reddit.”

![Popups](media/popups9.png) | ![Popups](media/popups10.png)

![Car Launch](media/car-launch11.png)

## Case study: Co-branded car launch event

When a new Italian car, the Pagani Huayra Roadster, was introduced at the Geneva Motor Show, Eden Games released the same car exclusively at the same time in our mobile game, Gear.Club. Three days earlier, we did a Facebook Live stream with YouTube influencers testing the game and the riding in the car themselves.

We had the idea of a big launch event, a social moment that people will share. We came up with a concept to take a fast car and a driver and put YouTube influencers in the passenger seat while playing our game. And after a long search, we found a car manufacturer to do the event together. After Pagani gave us the go-ahead, we had only three months to focus our resources, develop a special championship, a replica of the factory in the game, as well as the car and its handling. Three days before launch, Pagani still changed crucial details on the actual car which had to be reflected in the game as well. It was a challenge, but when you deliver, it’s so rewarding!

Games have come to this point now where they are the biggest entertainment medium out there, much bigger than Hollywood. It’s only natural that we now speak as equals to the automotive industry, Hollywood, sports industry. We are not the lesser product, we are not the license, we are a partner. The market is mature enough that if you think big, there is a market for it. We are catering to potentially 3 billion people now.

After a 20 minutes tutorial the special event would appear on the game map – players could borrow the car for 2 weeks and drive 30 special tracks. If they beat all of the tracks within the time limit, they could keep the car in the game. If they only beat 75% of the tracks, they’d get a 75% discount on buying the car.

We used push notifications and retargeting to alert players that something special is happening. Players could share the championships from within the game. We also did what Phil Hickey calls marketing the marketing – we marketed the marketing day, like they do on TV when there’s a big live event coming up. We leveraged all our social media channels to prepare for the day, and we teased users about the car, even before we revealed that we had it. We reached out to Apple and Google and gave them a detailed concept two months before the event: 4 slides about what was going to happen in the game and the marketing campaign to support it. This is something I always recommend with Apple and Google. If you want Marketing through featuring from them, tell them what marketing you give them in return. It’s a relationship, it cannot be one-way.
---Pascal Clarysse, CMO, Eden Games

Finding the right cadence for events is important, since you want to stimulate engagement and purchase behavior without burning players out. “When we do big LiveOps events we see a big spike then a decline back to normal or a little below normal numbers for a couple days, so we pair LiveOps with client updates every 4-6 weeks to raise the baseline higher for the peaks and the valleys and people stay in the game longer than they would if it weren’t a living thing,” says Hyper Hippo’s David Ecker. AdVenture Capitalist has found a sweet spot with more frequent, shorter events: “We’re seeing that if our ARPDAU takes a little dip, we can do a shorter event and it can erase the negative event. We’re trying two in a week to try to mitigate those dips. Waiting 3-4 weeks is way too long. Now, we’re condensing a 7-day event into a 4-day event and even a 2-day event.” 

Pascal Clarysse of Eden Games notices similar behavior. “Rhythm is important – every 4 weeks would be the slowest you can be, every 2 to 3 weeks is better. You have to keep in mind that the week after the event there will be a bit of a cannibalization effect. If your event is successful, it will increase monetization but then it will decrease afterward. Your game economy person needs to be part of the planning of the event, your marketing person needs to be part of the planning as well to decide when to plan it.” Gear.Club also runs longer events, “between 10 days for the more casual events and 20 days for esports events to give players the chance to really compete and learn the tracks.” Also, notes Clarysse, “with team-based events, you have to give people more time to organize schedules than with a single player event.”

Running a live game can at times be like orchestrating a complex ballet of teams working together. So it is essential to build and maintain a calendar view of your live events that’s shared by all the departments that contribute to your LiveOps team. Calendars are essential for planning the nuts and bolts of a live event, including the required new content, localization and communication, as well as the related marketing effort. 

Calendars can also help you manage one of the key risks with running events: player fatigue. As noted above, it’s normal for players to slow down their activity somewhat after an event, and you’ll typically see this drop in playing and spending activity reflected on your KPIs. But going too far - perhaps running monetization promotions at the same time as an intensive special live event - may fatigue your users in terms of their spending and/or their playing, putting them in jeopardy of leaving. Maintaining a holistic view of all your events will help you see if you’re getting the behavior you expect out of player segments and cohorts. 

Mastering the art of player communication is critical to the success of live events. It’s important to be able to communicate with players via push notification if you want to be able to let them know time-sensitive information, like that an event is about to start. Both notifications and emails can be effective tools for re-engagement as well. For example, the popular Facebook Messenger game Everwing uses Messenger to notify players when others in their group are making progress at defeating a monster, so they’re more likely to jump in and help them kill it. Idle Miner Tycoon has “a social media team which engages with our players, collects suggestions, and answers questions; we not only react to our players but also actively engage them and start conversations to be as transparent and communicative as possible,” says Fluffy Fairy Marketing Director Volkmar Reinerth. “We post interactive content across various channels which is continuously showing that we are player-centric and receives good feedback.” As the game’s player base has grown, Fluffy Fairy’s tactics have become more sophisticated and retargeting has become more of a focus. Now, “we use push notifications and retargeting campaigns which present the newest features to the users which didn’t play for a while; both are effective.” 

Your ability to pull off a live event effectively is highly dependent on your LiveOps team and whether the people on it can work together effectively. A well-integrated Marketing function will be “informed of external events that can be used and come up with concepts for them”, says Eden Games’ Pascal Clarysse. “We all know the big events like Chinese New Year or Halloween. But sometimes it can be a special event, like in our case with Gear.Club when we used a car show in Geneva. It’s the job of the marketing team to be aware of these events, develop ideas in advance, keep the development team aware as well, so they can plan game updates accordingly.”
 
“Events should be enjoyable for everyone. Some games clearly cater their events to their whales, but then the barriers of entry become too high for regular players. The games that do it best have a big event and a smaller event in between. The top players, which usually are the whales, consume the content much faster so they get bored. The events are what keeps them excited.

You need to have events frequently enough so that you can change the menu every now and then. You will never have one event that your entire audience loves. So, if a portion of your audience is disappointed with an event today, it’s ok if in 2 weeks there is another one that they’ll like. They shouldn’t have to wait 6 weeks because they might have left by then. Everyone should get something they like within a month. Keeping the rhythm helps you to fail fast and fail without too much consequence. If you make a mistake it’s alright, because there is another chance in 2 weeks.”
---Pascal Clarysse, CMO, Eden Games

## Live events best practices

- Make a list of every thing you might want to change as part of an event. This can include new game levels or quests, unique in-game items, special event “stores,” discounts or promotions in your normal stores, special event leaderboards and tournaments.
- Set up your game so that you can run events from the server, without requiring a client update. This means exposing game configuration settings on the server so you can change how the game runs during events.
- Create a place in your game where you can list and promote current and upcoming events. You want to be able to message players about events to get them excited.
- Capture key game data in your data warehouse so you can report on and identify winners of events after the fact.
- If possible, design your game so you can have multiple overlapping events running at the same time.
- Give your LiveOps team as much flexibility as possible when creating new events. You never know what they are going to come up with to keep the game fresh and interesting.
- Maintain an internal event calendar so your team knows what’s coming up and when. Use the calendar to avoid scheduling too many “big” events on top of each other - pace your events to avoid burning out players.
- When designing events, consider both the “facts” of the event (e.g., what exactly is changing), and the “fiction” of the event (how you communicate it to the player). The fiction often includes the event name, description, and even graphics.
- 
## Multiplayer

Playing with or against other players adds a significant element of fun to your game. The challenge of a real-time battle with a well-matched player can provide a deeper level of engagement than playing in a solely computer-controlled environment. Building a great player-vs-player (PvP) experience requires an ability to serve up the right opponent at the right time, so it’s important to ensure that your matchmaking logic is making the right tradeoffs between skill level and time-to-match, particularly as the number of available players ebbs and flows at different times of day. This may take some iteration.

As Cem Aslan notes, “For Evoker, a collectible card game, we first looked at how long the players had been active in the game. That didn't work really well because players already start a game with different knowledge. You can't just assume that all the players who have spent, say, 2 days in the game are on the same level. Then, we looked at how good their stats were and which cards they had already collected. This worked a little better, but we also found it's not ideal to match players that are exactly the same level. Sometimes it's fun to just win easily, and sometimes it's great to have an opponent who is really hard to beat, so you have to put up a fight. In the end, we mostly looked at how often a player had won and how often they had lost. Players who win a lot were matched with other players that win a lot - and vice versa. For this particular game, this approach created the best matches.”

While the PvP modality often garners the most attention, cooperative multiplayer modalities can be highly successful as well. For example, Idle Miner Tycoon organizes cooperative multiplayer events where players recruit friends to join their teams; the bigger the team a player recruits, the more resources the team gets. This is highly engaging and also provides a method of user acquisition. IDreamSky’s Sky Fall offers cooperative team battles, meaning that players assemble a team together and can then attack another team with an element of surprise. Blackstorm Labs’ Everwing offers a cooperative multiplayer experience where players can team up to defeat very powerful bosses. Forming a team with friends in a multiplayer modality means that the game has an opportunity to message others in the team to join the fun as soon as one player picks up the game, which is a powerful engagement tool. 

When building synchronous multiplayer, you have two different options. You can build and host your own multiplayer server, then connect players to your server to play against each other. This is the best solution when your multiplayer game requires complex backend logic, such as a multiplayer online battle arena (MOBA), but adds complexity in terms of scaling up the number of servers. Or you can use a multiplayer service, like Photon, to exchange messages between game clients. This may be the best solution for simpler games, or for quickly prototyping your multiplayer solution.

## Multiplayer best practices

- Look for ways to add multiplayer to your game, both competitive and cooperative. This doesn't have to be done up front - even single player games can have multiplayer "meta games" added on top.
- Consider both synch and asynch multiplayer - asynch is much easier since it doesn't require real-time multiplayer logic, and just requires ways to compare stats between players such as with a leaderboard.
- Experiment with your matchmaking algorithm. Sometimes the simplest mechanism may be the best.
- If you are building your own multiplayer server, make sure to avoid a common pitfall by giving careful consideration to how you will scale up the number of servers your game needs.

## Leaderboards and tournaments

Fostering interactions between players is a core component of successful live games, as it injects a social element that helps keeps players hooked. The most straightforward mode is of course 1:1 competition, allowing players to compete against one another in a head-to-head fashion. This can be based on the players’ location in the game, as in Brutes.io, or via a matchmaking logic to pair players of roughly equal skill. Games like Clash of Clans have invested in “2v2” play, letting teams of two compete head-to-head against other teams in multiple modes (draft, challenge, and friendly battle). 

Leaderboards and tournaments give players a chance to show off that they can be - and stay - the best. Filtering leaderboards by friends adds a social layer where you are competing with people you know from social networks or your guild or clan. For example, Arena of Valor uses leaderboards to shows rank vs. friends as well as current progression tier, so players always have their next objective set. 

Regional leaderboards can also be effective, particularly since different geographies will interact with your game in different patterns. For example, Asian players typically have a higher frequency rate than Western players do, and Eastern European players may be more likely to monetize heavily to stay at the top of the leaderboard. 

Other important multiplayer modes include players cooperating towards a shared goal, teamwork between the members of an organized guild or clan competing as a unit against other groups, and tournaments - which are essentially competition-based events. With all these modes, it’s important for players to understand how they are performing relative to their peers, and that’s where leaderboards play a critical role. Most games will find that to be effective at stimulating players’ competitive instincts, one leaderboard isn’t enough. Games that have the capability to offer multiple leaderboards - for example, showing a player’s status against their Facebook friends also playing the game, or against players of similar ability - can use those as a tool to keep players engaged or stimulate them to get back into the game if they see their scores are being eclipsed.

Leaderboards that reset also encourage more engagement than static leaderboards. Prize tables take this a step further by allowing a set of actions (such as a notification to players or the awarding of prizes) to be performed on a group of players based on their ranking in the leaderboard when that leaderboard is reset. 

Synchronous multiplayer games, like Brutes.io, pit players against each other in real-time match-ups. Support for synchronous multiplayer is a key decision in how the game is built and played, so is generally incorporated during a game’s development. Asynchronous multiplayer techniques, on the other hand, can be added to virtually any single-player game to encourage more engagement. This can be as simple as adding a leaderboard, or more complex, like having limited-time events with leaderboards used to compare performance. Creating an asynchronous multiplayer event, with a special prize for the winner, can be a significant engagement driver compared to a leaderboard alone.

## Leaderboard and tournaments best practices

- Use leaderboards to create a sense of competition.
- Reset leaderboards on regular basis to give players a sense there's always a new opportunity to win.
- Have prizes based on leaderboard position to create more motivation.
- Consider connecting tournaments to events.
- Design your game for synchronous multiplayer for the ultimate in player engagement and retention - if you’re able to make a significant engineering commitment.

## Guilds (a.k.a. teams, groups, clans, or alliances)

Adding guilds to your game can be a powerful technique to boost engagement and monetization among your players. Guilds go by many names in games - teams, alliances, groups, or clans - but the idea is the same: a collection of players who have partnered together to help each other out.

Guilds are generally considered most effective in competitive multiplayer games, but can also work in single player games. They add depth to the interaction between players, by adding a new level of guild-vs-guild competition, as well as giving players natural allies when competing against other players.

Some games assign new players to guilds automatically. Other games make guilds an optional component of gameplay, typically one unlocked only at more advanced levels. Regardless, to support guilds you need to give players a way to create a new guild, or apply to join an existing guild. Guilds often have ways to customize themselves with artwork, names, and custom descriptions. Guilds generally have a hierarchy of roles; at a minimum, there are members and leaders, who can accept or reject members, and usually there’s some form of guild chat functionality.

The real power of guilds comes from guild-vs-guild competition. This can be as simple as having guild leaderboards, to show which guild is on top, or actual guild-vs-guild tournaments or live events where guilds compete directly against each other. Guilds boost engagement, by providing social pressure on guild members to play to support each other. Guilds also boost monetization, since wealthier members of guilds may gift items or currency to other members of the guilds who are less well off. So don’t be afraid to give guilds communication tools, such as internal chat, or giving a clan leader the ability to send a push notification directly to teammates. 

## Guilds best practices

- Consider whether your game would benefit from guilds. Generally any game with multiplayer mechanics will benefit from guilds.
- Decide whether to assign new players to a guild automatically, or whether guilds will be optional.
- Most games with guilds have guild leaderboards, comparing guilds on some metric. You need to decide, however, whether this metric comes from adding up or averaging player statistics, such as player XP, or whether your guilds will have their own statistics, based on some form of guild-vs-guild tournament.
- Games often support guild banks, where players can transfer items from their personal inventory to the guild so they can be redistributed to other members. At a minimum, though, you will want a way for members of the guild to directly transfer items or virtual currency to other members.
- Members of a guild will need a way to chat with each other. You can support this in-game, with chat or some other mechanism, or you can support an external messaging service like Discord.

Content is king
"With games-as-service you have to keep players engaged with new content. There cannot be an endgame."  
---Pascal Clarysse, CMO, Eden Games

Today’s games - particularly mobile F2P games - can amass a large audience quickly if they resonate with players. But keeping that game at the top of the charts is a different matter. Using new content strategically is a crucial technique for keeping games fresh so that players remain engaged. It’s important to note that new content doesn't just mean new levels or new game mechanics. It can also mean new items for purchase, new playable characters, new tournaments, new bundles, or virtually anything that would encourage a player to come back and play more. Notes Hyper Hippo’s David Eckert, “People only download so many apps, to have a game that is constantly updating with new features and events means a lot to people. It keeps them engaged with your game. It turns them into a loyal fan that sticks around on a platform where people are onto the latest and greatest week after week.” 

Because content is something players notice and care about, investments in content can have outsize impact. For example, simply involving players in your content decisions can become an opportunity for building community. Bulletproof Arcade’s Andy Wiltshire says of Brutes.io, “For new costumes in the game, we’ll do a poll and encourage people to vote on social media, and whichever costume wins is the one that we make.” 

Knowing your audience well is a key element of designing and delivering relevant content - how old are they, where do they live, what do they care about? Mapping players to affinity groupings can help you with this exercise. Tiger Byte’s Renee Ya observes that “Social Casino games often times will attract women in their 50s who live in Southern states in the United States. Depending on the regularity of their session times, preferred day of the week, and play style, content should be catered to nudge any one of those metrics by at least 20%.”

## Game updates vs. server-side changes

Updates - new challenges, characters or attributes, or other elements of game play - are a great way to tweak the game and make it feel fresh. Both quantity and quality are important, and successful game developers often exploit timely events like holidays for creative inspiration. For example, in September and October 2017 alone, Crossy Road launched a Space update with 9 new figurines followed by a Halloween update with 3 more figurines. During the same time period, Temple Run 2 introduced updates including Fall-themed Global Challenges; a Fall Jungle Map; new coin skins; Halloween-themed characters and skins; and Halloween-themed Global Challenges, rewards, and villains. App updates are the most straightforward path to make significant changes to your game, but they involve real risk and overhead as well. Server-side updates are way more flexible because you can make changes at any time, with no delay, that affect all players instantly. 

Configuration changes can provide a lot of flexibility for reacting quickly to make content available (such as new items or bundles for purchase) without needing to do an update. For example, games that are built on services can offer temporal items, which exist for a limited time and are automatically removed from a player’s inventory after expiration, from virtual goods catalogs. In addition to virtual goods, there’s a wide range of content appropriate for events to consider, including event-specific stores, monsters, dungeons, items, consumables, contests, leaderboards, currencies, re-skins, and other art changes. Creating a narrow window for players to collect limited-edition or event-specific content creates a scarcity effect that will naturally increase demand. This leads to improved player engagement and monetization for you - if executed well. But to make full use of server updates, you need to build your game to support them. 

If you have a practice of doing small, frequent updates, then it may be easiest for you to use those to refresh your content. If, however, your practice is to do bigger, less frequent updates, or if your developers and your LiveOps team don’t always have the ability to work hand in glove, then you may find it helpful to build content updates via configuration changes into your game design. Using your backend to make these changes means that your operations team can turn smaller content-driven events on or off, or easily activate/deactivate promotional inventory, without needing to distract a developer from other tasks. 

PlayFab “allows us to get a lot more visibility on what players are engaged with, what they enjoy and don’t enjoy...we can really get an idea of how much the high players are engaging and what they value, and can tailor rewards around that.”  
---Phil Larsen (Managing Director, Prettygreat)

![PG Plus](media/pgplus12.png)

## Pace yourself

Choosing what content to update and what to leave alone is both an art and a science, and the right answer for you will of course depend on your game. The goal is to maintain or increase player engagement and monetization without burning players out. Segmenting your players and targeting different segments with different updates (if you have the resources) is a best practice, but timing your content updates thoughtfully is another good approach if you’re resource-constrained. Another thing to consider when it comes to updating content is how often to make changes. Again, this comes down to the nature of your game, and experiments in this area should follow similar principles as those focusing on what and how much to update. 

The conventional wisdom is that for games with light levels of daily player engagement, such as idle clicker games, significant changes may disorient players who haven’t been back in a while. On the other hand, games with a highly engaged community (like shooter games) may have tolerance for major updates. Start with a strong hypothesis based on your analysis of how players interact with your game - and always measure the response, as your game may behave differently than you expect. One important caveat to bear in mind is that content that significantly changes the nature of game play has the risk of turning off players - potentially your most valuable players. Consider focusing instead on rare but cosmetic items like skins, things that show a kind of status but don’t change balance of play and can either be earned with great effort or bought.

Games with a long development cycle may choose to frontload their content production as well, but faster-moving studios may not have the ability - or desire - to plan that far ahead. Many experts recommend investing in no more a few months of forward-looking content by launch, and maintaining a focus on new content creation once the game is live. Cem Aslan, CEO of ColdFire and formerly a developer at flaregames, recommends preparing around 2 to 3 months of content in advance for new games. “As a small indie studio, you don't have the money to do user acquisition for a soft launch. So you just go ahead and publish the game. With Idle Space, we went live and released the content we had immediately, to get a first glance at how users are playing the game and if they like it. And then we tracked engagement, and A/B tested a lot while the game was already live.” 

Renee Ya, Founder at Tiger Byte Studios, suggests working on a rolling-quarterly basis, and planning for the subsequent quarter at the same time. That way you can stay about a month ahead of release, while “actively planning new monetization mechanics and limited time offer sales, sometimes releasing new ideas within the same week, often times making the monetization events intertwined with content releases.” 

Regardless of how often you do game updates, it’s important to think about your content refreshes in a strategic manner. Per Ya, “it's a good rule of thumb that new game content should come out at least once a month, with regularity that's predictable for your players without having to hand over a calendar of events. And typically doing content releases either at the beginning of the month or in the middle of the month and aligning it during your player's paydays, may encourage them to increase their average spend.” Successful games try hard to put real customer benefit into each and every game update, while also evolving and improving their underlying infrastructure based on current needs. Fluffy Fairy Games’ Oliver Löffler tries “to release a new update each week, and we always try to get something for the user in there as well as bug fixes and reducing technical debt.” Similarly, David Eckert of Hyper Hippo notes that “Our client updates focus on general game features and monetization improvements, but we are always evolving our Events system through client updates too.”

## Content best practices

- Make a list of everything in your game that could be considered “content,” and then decide how you plan on updating that content over time. Types to consider include in-game maps or levels, in-game items, quests, events, achievements, and playable characters.
- For each type of content, decide how you will update that content. Does it require a client-update? Or can you update entirely on the server-side?
- If the new content involves in-game assets, how will those assets get down to the client? Client update? Unity AssetBundle? Download via content delivery network (CDN)?
- Think about offline mode - if you depend on the backend for updates, make sure your game still runs (for a while at least) even if it cannot connect to the server. This requires some form of caching or storing content on the device.
- When planning content updates, consider both limited-time content that eventually goes away, as well as permanent content updates that stick around. Limited time content is most often connected with an event.
- Consider targeting new content to specific player segments, at least initially. The most common example is offering new content to your VIPs or whales first.

“You look at everything that’s going on in the market - what other games are doing wrong and avoiding those pitfalls. We’re focusing on using purchases to accelerate things that people were working towards, not on changing the game play - skins, costumes, emblems but also power-up skins. Players want to look different. We also have gold skins - but they’re only something you can grind for, you can’t buy them. That makes players feel cool. 

Don’t do things that would box you in or alienate players - in Brutes.io, things that you can buy are cosmetic but don’t make you stronger. And of course you can always just play the game to get ahead. Acceleration of content rewards is another thing we do. You can get a costume by killing people who have that costume, but small purchases to accelerate the work people are doing by grinding work - if it takes 20 kills and you’re halfway there, it’s a small amount to get there faster, and people will go for it. We’re also being thoughtful about credit packs - we’re going to have a slider that lets you configure how much you want to buy so you don’t have to overspend.”
---Andy Wiltshire, Director, Bulletproof Arcade

## Localization

You never know where your game will find its audience, so it’s smart to be prepared to localize your game. Take it from Fluffy Fairy Games’ Oliver Löffler: “We support more than 20 languages. In the beginning we didn’t localize, but then a lot of players messaged us that we should translate and were very happy that ##we did.” 

Localization will do more than make your players happy - it also encourages them to spend. Some estimates are that up to 50% or more of online users will only buy when presented offers in their native language. Localizing to English, Chinese, Spanish, Arabic, Portuguese, Indonesian, Japanese, Russian, French and German gets you up to 80% of the online population, vs. just 25% for native English speakers.

Localizing in a live game is especially challenging, because the content is continuously changing. This is especially true for your in-game events. It’s one thing when the only thing you need to localize is your game UI and tutorial. You can localize that once, using an outsourced vendor, and not worry about it again. But when you are running continuous A/B tests, or launching new events every week, you will have a continuous stream of content that requires localization.

This calls for storing as much of your in-game text on the server as possible, where it can be easily localized and changed. Don’t forget that internationalizing a game goes beyond language; time/date formats, fonts, currency formats, text direction, and images with text on overlay should all be tailored to the player’s location and should be taken care of at the code level. So, the earlier you plan for localization, the better your game will perform - and the less technical debt you will amass. 

## Localization best practices

- Store all of your in-game text on the server, where it can be easily changed.
- Pick the initial target language from the game client, but let the player override their choice of language.
- Give your localization team or contractor direct access to your string tables, so they can edit the text directly and ideally see the results in your game right away.
- Build a “refresh” button into your game, that forces the game to download and display the latest localized text. This allows your localization team to tweak text in-game and see the effects immediately.
- Make sure all player communications can be localized - not just in-game text, but also push notifications, emails, and the like. 
- When localizing your game, don’t forget that your game also needs to fit into the regional culture, so research your launch regions to avoid finding yourself in an unfortunate situation. Touchpoints like the use of alcohol, food, symbols, hand gestures or affection displays are all little things that have the potential to offend.  

## Running experiments

Oscar-winning screenwriter William Goldman has a great quote about making movies: “Nobody knows anything...not one person in the entire motion picture field knows for a certainty what's going to work. Every time out it's a guess and, if you're lucky, an educated one.” It used to be that making games was similar - you had to guess what your audience would like, spend months or years building to this vision, and then launch and hope for the best, with little room to course-correct if you got things wrong. If you’ve read this far, you know that it doesn’t have to be that way anymore. But how, exactly, do you figure out what is and isn’t working about your game, and adapt it over time to build on the elements of the game that are working and de-emphasize those that aren’t?

## Test early and often 

Many games run into a chicken-and-egg problem early in their development cycle: they want to test their biggest assumptions before they have really committed, but don’t have enough players to reach statistical significance. So, they feel stuck. However, while split testing is an important technique, it’s not the only tool in your toolkit. In fact, you can get lots of useful information from “scrappy” testing, and your inherent creativity as a game developer can be a significant asset. For example, you can get valuable data on the appeal of a game’s concept and basic mechanics from running surveys or focus groups very early on, before you even have a real product. You can also test your design concepts before you need
 to put them into your game - for example, by measuring click-through rates on ads you buy that are identical other than showing different art styles. Sebastian Knopp notes that “successful games test everything. Game developers should always consider this before building things, and ask themselves if there is a test they could run to decide whether to build it or not.”

## Split testing

Split testing, or splitting your users into two (A/B) or more (multivariate) groups and measuring which variant has the best performance, is often considered the “gold standard” when it comes to running experiments, because you can get statistically significant results that paint a clear picture. If you have zillions of players, you can run even a subtle A/B or multivariate test for a reasonable period of time (typically at least a week, to measure fluctuations between weekend and weekday players) and measure the effect in a statistically significant manner. But if you don’t, because you’ve just launched or your game hasn’t yet become massively popular, then you’ll need to measure a big effect in order to be able to be certain that it’s real and not just random fluctuation. The same goes for how many tests you can run simultaneously - unless you have enough users to be able to separate them out completely, you’re stuck running tests in series rather than parallel (and even if you do have tons of players, remember that you can only match players from the same bucket for multiplayer experiences).  

Your goal with testing should be to run as many tests as possible. Since you never know in advance whether a test will produce an actual signal, let alone a positive one, the more tests you run, the more chances you have for success - it’s just math. ColdFire makes it a practice to run many sorts of tests - everything from the look and feel of a game to the game mechanics, tutorials and stores. “Recently, we did a successful gameplay A/B test: before you get to a boss you have to kill some kind of minions - so we reduced that to see if there was a difference in day1 retention,” says Cem Aslan. “It was around 7 percent points better, so we went ahead and deployed the change. As it turned out, getting to the boss earlier was more fun for the players than spending so much time on the level minions, so we just gave the players what they wanted.” Establishing a test-and-learn mindset within an organization is not a trivial endeavor. Sebastian Knopp often sees “teams that are willing to test things in theory but when it comes to building them they get stuck in endless discussions...Failed experiments are an important part of the process to learn, especially for the team running the experiment. The companies that learn fastest, usually win.”
Monitoring player behavior and feedback

It’s possible to treat every change you make to your game as a kind of experiment if you are thoughtful about the approach. If you are constantly monitoring user feedback on channels like Discord, Facebook, and email, you can use the feedback from these channels - carefully! - to gauge player reaction to changes you make. This approach is less scientific, and has the risk of giving your most vocal players too much influence, but can be a good way to go, particularly early on in your game’s lifecycle (i.e. soft or limited launch) when you have little by way of player data and few resources. You’ll want to augment this stream of data with careful analysis of your player behavior, which you should be tracking closely in your analytics toolset. What happens to your key engagement and retention stats after a change? How does this vary by segment, for example players who make a purchase vs. those who do not?

Another way to gather player feedback is with in-game polls. These are especially helpful to evaluate qualitative factors that are not easily measured with analytics. The best time to pop up a poll question is between levels, or at the end of a game. Avoid asking more than one question at a time, though - more than a few seconds and you may interrupt the player’s flow.

## Testing best practices

- Test your gameplay early in your lifecycle. It’s harder to run tests on core gameplay once your game has launched and players have strong expectations for how the game behaves.
- You can also use limited-time events to test changes to gameplay - players are much more tolerant of gameplay changes when they’re called out as events. 
- Tests are most effective when you have a clear success metric to gauge the impact of the test. That’s why messaging and promotions are especially easy to test, because you can easily compare effectiveness.
- Consider limiting your testing to new players, to avoid confusing existing players.
- Test more qualitative factors by asking questions to players with in-game polls. 

## Community 

A strong community can act as a force multiplier for your game. Dedicated fans can help promote your game, becoming a valuable marketing channel, and generate useful content. For some games, that means actually building out aspects of the game, enriching the experience for many players and helping extend its longevity. For games where that’s less practical, it’s still very possible to benefit from community engagement. Says Bulletproof Arcade’s Andy Wiltshire, “User generated content is not something that’s particularly easy for us to do in Brutes.io as it’s too hard for users to build. In fact, even a profile picture can be challenging because you need to moderate them. But we still get the community involved - for new costumes in the game, we’ll do a poll and encourage people to vote on social media, and whichever costume wins is the one that we make. The greatest thing for us community-wise has been having the social buttons on the site - if you click them you get rewarded with a new emblem.” For Coldfire’s Cem Aslan, community is a strategic investment, with Discord the most relevant channel for chatting with players. “Even as a small studio, we prioritized community early on because players will appreciate it if you talk to them and respond fast. Even if you can't fix things immediately, they will honor if you make the effort and answer them.” 

One tried-and-true way to manage a community is with a set of forums. Consider integrating the forums with your game, so players login with the same account. PlayFab allows you to add the Innervate forums solution from the PlayFab marketplace into your title. This lets you correlate forum behavior with game behavior to identify your most valuable players. In addition, community managers need a way to communicate back to players. Some options here include a "message of the day" when players login, or a regular email newsletter. 

## Community best practices

- Have a way to let your players communicate with each other. Forums are the most popular - this can be Discord, Innervate, or any other mechanism that works for you.
- Consider a "message of the day" feature - this is a great way for your community managers to present news and updates to your players when they login.

## Everything in moderation

Moderation - both within your game and in channels devoted to it on Discord, Facebook, and the like - is key for maintaining a healthy community. Trolls happen, and you need to be ready for them, or run the risk of them poisoning your game for everyone else. Find a strategy that works, and keep at it - for Andy Wiltsire, that’s generally “to kill them with kindness - what they want is to get a reaction; if you don’t give them one they eventually just move on.” Within your game, you need to be able to ban toxic players before they scare too many others away through bad behavior. In your community channels, it’s important to make the effort to stay abreast of the conversation and even intervene when needed (or co-opt members of your community to do so on your behalf). The Brutes.io team figured out how to do this without expending more resources than they could afford. Andy Wiltshire keeps an eye out “for people who are naturally helpful - for example by directing people to different channels on the server. A bunch of guys have basically helped moderate, which has been really helpful.”

## Moderation best practices

- Figure out a strategy for how and when you will ban players and then be consistent. Also publish your rules so the community doesn't feel blindsided.
- Keep an eye out for problematic language or behavior. Commercial tools like Community Sift can be helpful here.

## Monetization 

Making monetization work is one of the biggest challenges of games. The three most common paths to monetization are charging players to download a game, advertising, and in-game purchases (often referred to as IAP). These are not necessarily mutually exclusive, but you have to be careful. Many AAA games have come under fire recently for charging $60 for the game, and then more money later for DLC (downloadable content) or "loot boxes". 

## Free-to-play vs. paid

While some games are able to charge for downloads, many find the challenge of getting potential players excited enough to purchase a game without having had a chance to experience it caps their potential revenues too drastically. Offering a free trial for a premium game used to be a very popular model, but has lost favor. That said, you can have a game be free-to-play up to, say, level 10, then charge money via IAP to keep going. However, bear in mind that with a premium game, it’s challenging to capture revenue beyond the price of the game itself, despite potential player willingness to pay. A free game with IAP allows players to spend whatever they want to spend, from zero up to thousands of dollars. While there will probably always be AAA games that can command a high price for download, selling a game outright rather than making it available for free is no longer the typical path for live games, so we won’t focus on it here. 
 
## Advertising: The rewards are endless

For free-to-play games, advertising is often an important revenue stream, since at the end of the day the vast majority of players never make a purchase. In the world of games, one of the most popular and successful forms of advertising is “rewarded video” - a short (and sometimes playable) video, generally promoting a different game, that the player can choose to watch in exchange for an incentive within the structure of the game being played currently. There’s understandable fear amongst game developers that rewarded videos featuring games that would appeal to the player can distract that player from their current session or from coming back in the future. The opportunity cost is potentially high, particularly for the most valuable players who are making real-money purchases. However, it doesn’t have to be that way. Notes Dimitar Draganov, Senior Product Manager of flaregames, “a well-designed and integrated into the core loop rewarded video outperforms every other ad inventory by a wide margin; rewarded videos have always been the biggest revenue driver across all the games I've worked on and they are rarely filled with anything but game ads.” If you view rewarded ads as part of the core game loop, you’ll want to optimize the player ad experience along with the rest of your game. That means you’ll need to monitor player engagement with these ad units closely, so you can track and optimize the rewards you offer to players who engage.

![Quick Boost](media/quickboost13.png) | ![Adventure Communist](media/adventure-communist14.png)

Other important ad formats include banners (ads that run across the top or bottom of the screen, similar to what you might see on non-game websites), interstitials (ads that run while the game pauses briefly, for example between levels), and offer walls (a page that offers users rewards or incentives for real-money purchase or in exchange for completing a specific task). With all forms of advertising, remember that testing and segmentation are your friends. Fundamentally, you want to make sure that your monetization efforts aren’t at cross-purposes with your strategy for fostering player engagement and retention. Many developers look to segmentation for this and choose not to show ads to every segment, for example choosing to limit ads to those who do not make real-money purchases. 

However, execution really matters here. Draganov of flaregames claims that “one of the surprising facts about well-integrated video rewarded ads is that they don't ruin the experience for payers and they don't drive players out of the game, on the contrary - we've seen consistently across many games and types of implementation that rewarded ads can improve retention, engagement and from there even IAP spending / LTV of both payers and non-payers. Therefore rather than segmenting, I would advise developers to focus their efforts on building a sophisticated system of rewarded ads that anticipates the right moment and the right reward to offer.” Regardless of which path you take, you’ll need to test your way into optimizing it. So make sure you have the ability to play around with who sees your ads, and then ready, set...go test.  

Once you’ve decided to run ads of any type, you will need to figure out how to optimize them to maximize your revenues. The practice of attempting to maximize revenues by showing the right ad to the right person at the right time is often referred to as “ad mediation.” Joining an ad network is a quick-and-dirty way to do a certain amount of optimization and can be a real revenue boost, but it has significant limitations, particularly if you have more than one game to offer. After all, showing people a message about a relevant event that’s going live in your game or introducing them to another game in your stable may not give you guaranteed revenue like showing an ad served by an external ad network, but the expected value per impression has the potential to be much higher - particularly if you target this information only to paying players. For non-paying players, you’re likely better off generating revenue through a paying ad. Ideally, your optimization process will be based an on-the-fly calculation of the value per impression for an in-house-ad versus an external ad network for a given player, so you can then decide what to show: house ad, event promotion or cross promotion, or ad network placement. 

## Ad mediation best practices

- Integrate rewarded video ads into your game.
- Test your rewards - don't just build it once and assume it's going to be effective for all players. In fact, the same player may be motivated by different rewards at different stages of his growth. By definition, a good reward is whatever the player most wants at that moment, and what that is will change.
- When integrating paid ad networks, don't just pick a single network. Different networks perform differently for different regions and types of players. To maximize your revenue, you will likely need several ad networks.
- Don't be afraid to negotiate with the ad networks. If you have enough players and inventory, they will cut you special deals and even guarantee revenue - if you are willing to give them special rights like first crack at your players.
 
## In-app purchases: In for a penny...

Adding in-app purchases to your game adds a significant degree of complexity, but the returns can be well worth the effort. Done right, in-game purchases can drive a significantly higher level of engagement as your players start to feel more invested in the game, as well as incremental revenue. This multiplier effect can help you ensure that you retain your players for longer and increase their lifetime value across multiple dimensions. It’s critical to measure and track your player LTV (lifetime value) closely if you want to optimize your stores to maximize your ability to monetize your players, but that’s not the only reason. If you don’t know how much a player is making, you don’t know what kinds of players you want to attract, or how much doing so is worth to you - which means you’re flying blind on user acquisition as well.

However, setting up your game properly for purchasing takes a lot of forethought. Because inventory is often sold in bundles, which are often then segmented, even a simple store can have hundreds of SKUs, each with slight variations. After all, targeted offers aimed at specific segments of players is a key part of a good IAP strategy. However, uploading and managing these can be a lot for a LiveOps team to handle, so one trick used by experienced studios is to use backend tools to streamline and automate uploading content, displaying it by segment, and testing offers. But the work doesn’t stop there; just getting your store optimized can take a good amount of iteration, and if you don’t test different configurations - everything from fonts to layout to color schemes - you’re almost certainly leaving money on the table. Of course if you really want to throw money away, you can simply fail to do server-side receipt validation for in-app purchases, and watch the fraud pile up - and the game get ruined for your legit customers. 

Of course, monetization is not a substitute for user acquisition and retention. If you take your eye off the ball on those activities, ultimately your monetization will also suffer as your player base drops. When Machine Zone’s Game of War - Fire Age slowed down user acquisition, the game soon slipped out of the top 10 grossing games and dropped precipitously.

![Game of War](media/gameofwar15.png)

## IAP best practices

- Use server-side receipt validation to prevent fraud (e.g. Apple or Google receipts). This ensures that the money you think you are making is in fact being made.
- Your players are different, so don't treat them all the same. Different players may want to buy different items. Consider having multiple stores, with different combinations of items for sale depending on the player.
- When putting items in your store, don't just sell single items, also sell bundles of items. Bundles generate more revenue per transaction, and players will feel they are getting a better deal - a win-win.
- Consider running special sales events as part of your events. Common ones include a buy-one-get-one-free promotion, limited time discounts, and even limited-time offers for rare items.
- You can target players with a one-time exploding offer that will never be repeated - often at the end of a level. A typical offer might be a valuable bundle for a special discounted price.
- Stores are great opportunities for A/B testing. Try mixing up the order of items in the store - the same item will sell differently depending on where it is in the store.
- Take advantage of subscription functionality in the iOS and Android stores, which is an effective way to get players in the habit of becoming a repeat purchaser.
- Adding player-to-player gifting can be a big revenue boost, since wealthier players may buy items to give to friends or guild members, especially when coupled with multiplayer modes like cooperate playing.
- Where your store supports it, offer special coupons that players can give to friends or share via social media. That can not only drive sales but also encourage viral growth. Especially when the player who offers the item also gets a reward if the coupon is used.
- Consider marketing IAP differently based on region. For example, Western Europeans may favor cosmetic appearance items while North American players prefer boosts that make them progress faster. Segmenting by user location will provide another lens on their play style and triggers. 

## First-time purchases: Getting off to a good start

Getting a player to make an early purchase significantly increases your chances of getting that player to make future purchases, especially if that initial purchase helps the player advance enough in the game to get really committed. The challenge is the chicken-and-egg problem of getting players to open their wallets before they’re fully invested in the game. Here, pricing and timing are key, along with communication. A limited-time, highly compelling offer is a successful paradigm for many games - particularly if it is communicated clearly via a pop-up message with a clear call to action and timer. The advantage of this approach is that it creates a strong incentive for a player to make that critical first purchase, with a well-priced bundle that is likely to spur engagement, while also reducing the risk of cannibalization since players who are already hooked aren’t eligible. 

Notes Draganov of flaregames, “well planned and executed starter bundles have been known to improve first time conversion by 80-200%.” Getting it right is an optimization problem as well. Per Draganov, “even miniscule changes (e.g. change of main art or slightly bigger discount / value added to the offer) in such offers can bring significant uplifts, so AB-testing such offers is key.” With IAP, “the goal is to offer players what they need and when they need it. This requires design of features to be done in a specific way to make the needs and provided solutions obvious and straightforward...everything takes iteration, so analyzing how well a promotion converts new or reconverts old users is key to improving your operations' effectiveness over time.” 

![Advantage Bundle](media/advantage-bundle16.png) | ![Starter Package](media/starter-package17.png)

## First-time bundle best practices

- Consider having a special "starter bundle" for first-time players who have never paid before. Once a player has opened their wallet for a game, they are much more likely to do so again.
- Since the goal of the first-time bundle is to encourage players to spend, you can test nearly everything about the offer to determine which is most effective at converting players to buy it.
- When designing your first-time bundle, look at which items new players buy most often and include those at an attractive price. The goal is to provide overwhelming value for your new players.
 
## Game economy: The daily grind

One challenge games face in working through their economy is how to differentiate between what can be bought vs. earned. Since the vast majority of players never make a purchase, games risk alienating their base of players if they make it too difficult to progress without purchases. Slogging it out to progress through a game without making purchases - often referred to as “grinding” - is a highly engaged player behavior that should be considered meritorious. As Draganov puts it, “great live-games have both non-paying and paying users in lower, mid- and high-end of the leaderboards. As long as you allow players to trade time or money for progress there will always be both types of players - those who pay and those who grind their way through.”

“We have different placements. A start-up package that’s shown in the beginning of the game, and others that you only unlock later in the game. We also have special offers that are targeted to special events. We try to give out things that you can’t buy in the shops to avoid cannibalization.”

“Each player should play the game, we want to make the game play good for all players, not only whales. But whales have the opportunity to buy boosts which can accelerate their progress. We don’t want to make a game that’s only pay-to-win. You can get all the content by playing but it takes longer. Really engaged players can get through most of the content in 2-4 weeks but there’s no real end to the game.”
---Oliver Löffler, Co-Founder and CTO Fluffy Fairy Games

## Game economy best practices

- Most games support at least two virtual currencies: a “soft” currency that can be earned in-game through play, and a “hard” currency that can be bought. Having dual currencies gives you more control over your economy, since you can determine which items can be bought.
- Different cultures have different attitudes toward “pay to win”, or letting players purchase directly the most powerful items in the game. Generally speaking, pay to win is accepted in Asia, but frowned upon in the west.
- Get around pay-to-win concerns by selling items that speed up the player’s growth in the game, or that let the player accumulate currency more quickly. This sort of indirect effect is more widely accepted.
- It’s often easier to monetize resources than an energy bar, since the consumption of resources is more abstract. 
- Once players buy or earn an item, they develop a level of attachment to the item, so take it away at your own risk.
- It is always easier to start with a high price and lower it than to raise the price on an item. Anchoring an item as valuable with a high price can make discounting later feel like a great value. Providing a comparison point for an item for sale can similarly help get a player over the hump to decide to purchase.
- Segment your catalog and promote different items as players progress in the game. The player lifecycle - discovery, anticipation, and ultimately true engagement - means different things are important at different times.
- Be wary of selling items that encourage or allow paying players to prey on non-paying ones, as this can have a negative ramification on your game play. 
VIPs: Having a whale of a time
How much your whales spend, and what you should do with them to keep them engaged, will depend on your game. A rule of thumb is to watch the top 20% of spenders closely, but obsess over the top 5%, giving them a disproportionate amount of your attention and creativity. It’s worth the time investment to design and sell pricey but unique experiences that make this group feel catered to - from special packages that are coordinated to enhance the experience of a limited time event, to custom skins or other special gifts not available to the general population, to early access to content not yet released broadly. As always, test to see what resonates and keeps these very special players engaged, with an eye towards encouraging them to keep buying at the high end. If you see their engagement start to wane and purchase behavior start to slow, Dimitar Draganov suggests that “going back to one-time offers of lower price and great value is always a safe bet to re-engage them.”

But obsessing over your top customers doesn’t necessarily mean squeezing them too hard, or ignoring the rest of your customers, as Ken Go, Founder of Deca Games, notes. “Many developers think that squeezing more money out of your top spenders is the best way to maintain a game longer.  In the very short term this will work, but if you are selling content that affects competition then you will increase churn and shorten the lifespan of the game by creating a large power gap between spender segments.  Invest in game designs that scale without large inflation in power.” Instead, Go recommends investing “in rubber-banded designs that pit equally powered players against each other instead of having the strong only prey on the weak.  Having a broader spending base that is paying less is much more sustainable than focusing only on ‘whales.’”

## VIP player best practices

- Design your store so you can offer different items and bundles to your biggest spenders, since by definition they want to spend more money than other players.
- Consider ways to make your biggest spenders feel special. These can include special offers, special events, or first dibs on new content.
- Find ways to let your big spenders spend money without ruining your game balance. Cosmetic items and rare items are good examples.
- A great way to encourage your whales is spend is through events. Design an event that gives out a very rare, very exclusive item to, say, the first 50 players who finish the event. Then provide a way for players to spend money to save time and complete the event sooner.
- Some games even set up special VIP player teams, designed to engage with their biggest spenders, and provide them with special tools to monitor and chat with their VIP players.

## Acquiring and maintaining your players

Accruing and maintaining players is critical path for your game’s success, regardless of how you monetize. In this section, we’ll deep-dive into best practices for acquiring - and keeping - players that have a high degree of engagement with your game.

## Player acquisition

Acquiring new players is a fundamental challenge faced by all developers, for obvious reasons. The more players you have playing your game, the greater your game’s success, and the more money you will make. On the other hand, not all players are created equal, and there are plenty of examples of very successful games with a relatively small but highly-engaged player base, such as Eve Online. So it’s not enough to just look at adding more players…you need to make sure the players you add stick around as well! That’s why it’s so important to measure both acquisition and retention together for each of your various acquisition channels.

![Brutes](media/brutes18.png)
Sharing mechanisms are an important and cost-effective means of player acquisition and engagement, if done right.  

Let’s take a closer look at each of the various acquisition channels you should consider:

- Organic (“word of mouth”) acquisition. All games should aspire to having great organic acquisition, because that means your game is so great that players are raving about it to their friends and acquaintances without an assist from you. However, to a large degree true organic acquisition is out of a game developer’s control. Making a great game certainly helps, as does hitting the zeitgeist at precisely the right moment, but in general this is not really a lever in your control.
- Social installs are player installs that are driven by receiving an invitation from a friend, or seeing a post on social media. This is an effective channel, because a player who accepts an invite from a friend is much more likely to engage with the game than a player who simply clicks on an ad. Your success will depend on making it easy for players to invite friends, and a clear explanation of the benefits of inviting them. Consider incentivizing both parties - the inviter and the invitation recipient - to drive adoption. While this increases the cost, it’s possible to test and learn how to make this an efficient channel, with the key metrics to track being invites sent per user, conversion rate for invitations, and the viral coefficient (the product of invites per user and the conversion rate). 
- User-generated content can be an excellent method of user acquisition, though one that’s hard to control independently. Fostering an active player community helps pull in new players and creates a soft landing for newbies looking to get a comfortable foothold, so it’s worth monitoring your Discord channel and Facebook page to keep things on track. If your game mechanics support user-generated internal content - creating new levels or player skins - this can be a very effective tool for boosting engagement as well. 
- Store discovery is a tool to help potential players discover your game in a marketplace such as Steam, App Store, or Google Play. There are several things you can do to boost your distribution through each of the various stores, starting with optimizing how your game is presented in the store. Again, testing is key. Trying out different game artwork, screenshots, and description text are relatively fast-twitch experiments that can have a big impact on what percentage of players download your game.
- Landing on app store top 10 lists can give your game a sustained advantage; once you make a top-10 list, you get a boost from the many players who decide which games to try out by looking at the lists. However, it’s hard - and often extremely expensive - to get there, especially through concentrated ad buys. Some developers try to game the system by engaging in questionable behavior, such as hiring bot-farms to download their game, or by spending their own money in-game to buy items, but these are certainly not best practices. 
- Being promoted as an app store editor’s choice, by Apple for example, can lead to millions of new downloads. But betting on this as a strategy can force you to take your eye off the ball in terms of developing your game, so proceed with caution. Stores will often insist you support custom one-off features for their platforms that don’t actually make your game better, or ask for exclusivity periods that ultimately hurt your distribution on other channels. 
- Reactivating a lapsed customer by convincing a player who quit (“churned out of”) your game to reinstall it can be an effective acquisition tool, since these players are already familiar with your game and know what they’re getting into. For this to work, you’ll need a mechanism to message your previous players - typically push notifications or email - and often some sort of incentive offer the player values, such as 1,000 free gold coins for accepting the offer, which can be offered through the message. 
- Cross marketing is a form of advertising limited to the universe of games you or your publisher control. This is a valuable method since it lets you amortize your cost of acquisition (CAC) across multiple games and thus justify a higher CAC than you can otherwise rationalize. Many developers overlook this, though, and launch games with no ways to cross promote other games in their catalog. You can also partner with other developers and agree to cross promote games to each other - that can be an inexpensive way to acquire new players without resorting to expensive ad buys.
- Influencer marketing is promotion via celebrity gamers who record themselves playing your game and talking about it. If you’re able to get influencers interested in your game and sharing their exploits on Twitch, Mixer or YouTube, this is a great way to get new players excited about your game and also to communicate tweaks and changes to people who haven’t experienced your game recently. Mainly, however, this is a pay-to-play set up and it’s not cheap; big influencers can charge $50-100,000 or more to promote your game - and the ROI is not always easy to calculate. If you are interested in going this route, consider using a special code or offer so you can tie the install back to the influencer. 
- Paid Acquisition, where a player installs your game after seeing a paid ad for it, is certainly popular (for example, the bulk of rewarded video ads in games are for other games), but your mileage can vary significantly here so you’ll need to sharpen your pencils if you want to go this route. Regardless of whether you pay by impression (CPI), or per install (PPI); run ads on search sites (Google), social networks (Facebook), or ad networks, the math is the same. If your cost-per-acquired player (CPA) is less than your lifetime value of a player (LTV) then you're ultimately making money. If your CPA > LTV then you're losing money. Your goal is to pick the channels that maximize your ROI (LTV/CPA). Not all channels are equal, and neither are all players acquired; the cheapest CPA is not necessarily the best.

## Acquisition best practices:

- For every new player who installs your game, try to figure out how that player discovered your game. This may require using an attribution vendor for PC or mobile games.
- For each channel, try to calculate your CPA and LTV to determine which channels are most profitable for you - then steer your spending toward those channels.
- Include viral mechanisms in your game. Make it easy for players to promote your game on social media and give players tools to invite their friends; encourage players to stream their gameplay.
- Tune your game’s listing in app stores. Try different artwork, screenshots, and descriptive text. Localize your app store listing for different countries, even if your game itself is not localized.
- Run periodic re-activation campaigns to try and attract lapsed players who have quit playing for more than 30 days.
- Build a cross-marketing page into all your games. Choose which games to target to each player based on the player’s segment. 
- Experiment with paid-acquisition channels - but don't commit too much of your budget until you’ve seen what works and doesn’t work.
- Look for ways to scale your distribution efforts efficiently, even if it cuts into revenues slightly. For example, consider outsourcing your distribution to third-party Android stores; as Pascal Clarysse notes, “the billing, updating and maintenance of 200+ stores is too big of a headache for smaller game developers. Better outsource things like this and give away a couple of percent here and there if it saves time.”
- Use your YouTube channels to show your updates, leaderboard, and social challenge winners, as well as a promotional video for your game. 
- Respond to user feedback, and feature the best comments in your promotional messages.
- Experiment to optimize your landing page content when doing search engine and app store optimization, as this can have a dramatic impact on conversion. 

## Retention

Retention is the measurement of how many players come back to your game. The most common measurements are 1, 7, and 30 day retention figures, measured as what % of your players who play your game on day "0" play the game on day 1, 7, and 30. You can also differentiate between new player retention (limited only to your new players on day 0) and all players. Of these two, new player retention is probably the more important.

Retention is an important metric, because it's the closest proxy for measuring "fun." If your game is extremely fun, and players love playing it, then your retention will naturally be high. If your game is boring, and players never come back, retention will be low. Therefore, the best way to boost retention is to simply focus on improving the core game experience.

But you don’t need to stop there. Ensure that your game has a satisfactory meta-game, providing reasons for players to come back again and again. Having a fun core game loop may be enough to boost day 1 retention, but to have a high day 30 retention there needs to be a longer-term goal that players are working toward.

## Mechanisms to boost retention can include:

- Events. Probably the best single thing you can do to boost retention is regular events that are creative and original and encourage players to come back.
- Game mechanics. “Daily rewards” and other mechanics are game systems explicitly designed to boost retention, such as giving a player a reward for every day they come back and play your game in a row. This is a bit artificial, since you're essentially paying your player to come back each day, instead of relying on them to come back on their own because the game is fun. The trick with mechanics like this is to present it in such a way that it feels natural and part of the game experience, and not some artificial mechanic bolted on the side, purely to drive a KPI.
- Push notifications. The ability to message your player with a reminder or pop-up on a mobile device is highly valuable and creates an additional level of immediacy for mobile games compared to what PC or console games can achieve. However, these require a ton of testing to get right - a timely, authentic and helpful communication will be welcomed by a player, whereas a generic marketing message will be perceived as annoying. "Your castle is done building", "Your town is being attacked", or "There's a new Valentine’s Day event starting now" are all messages players may appreciate. On the other hand, "Your farm misses you" is not providing value to the player. 
- Content updates. As already discussed, continuously updating content is another way to keep your game fresh and keep players coming back.

## Retention best practices

- Understand your 1, 7, and 30 day new player retention rates. Track these rates over time, and compare how changes to the game affect retention for new players.
- Run periodic events, and promote them in your game so players know they are coming.
- Build in mechanics like “daily rewards” to encourage players to come back day after day.
- Ensure you have a channel to message your players. Consider using client-side push notifications instead of server-side push notifications for better control over when the messages get sent.
- Analyze your onboarding funnel and pay specific attention to progress through your tutorial. You have only one chance to make a good impression.
- Focus on optimal session length - an initial session should ideally be long enough to hook the player, but longer-term you want to balance short session length, so that the user can play many times a day, with the need to avoid player burnout from being required to login too often.
- Key retention techniques with which to experiment include personalization and rewards (even if they fail). Failing forward is always better. Look for ways to give advantages to power users if they help new users, which is a great way to create a sense of bonding while giving a hand to newbies.
- Develop player personas, and make sure you have something for each one. Typical personas include “achievers,” “socializers,” “explorers,” and “killers.”

## Engagement

Engagement is a measurement of how often players play your game, and needs to be considered alongside retention. There's a big difference between a player who plays your game for 2 hours on day 1, and a player who plays your game for 5 minutes on day 1, even though both players count the same on your retention report.

Generally speaking, engagement is good. The more time players spend playing your game, the more fun they are presumably having, and the more opportunities you have to eventually monetize them. Some companies, like Riot, are famous for only measuring engagement, and consider it their most important KPI.

You can measure engagement in a few different ways. For a game with long session lengths, hours of gameplay is probably the right metric. For a mobile game with lots of short sessions, number of sessions may be more useful.

In any case, mechanisms to boost engagement all come down to giving the player reasons to come back to your game. Similar to retention, these can include:

- Making the game fun. This is clearly important, but beyond the scope of this document.
- Game systems to encourage engagement. One of the reasons idle games and city builders have been so successful on mobile is that they have built-in mechanics that encourage players to come back. "Your castle upgrade is finished" or "New mine level unlocked" both encourage the player to come back to the game.
- Achievements. Rewarding players for specific actions in the game (e.g., finishing a certain difficult level without dying once) can provide even jaded players with reasons to go back and re-engage with the game again. With LiveOps, you can keep adding new achievements over time to give players reasons to come back, or add limited time achievements during certain live events.
- Multiplayer mechanics. Multiplayer games also have numerous opportunities to encourage replay, including challenges or tournaments. "Your city is being attacked", "You've been challenged to a new match" or a notification that your guild mate is engaging in a battle with a boss are all reasons for a player to come back.
- Limited time events. These are purpose-built to boost engagement. If the player has just 3 days to complete limited time content and earn a rare item, they will be encouraged to play practically nonstop during the event.

## Engagement best practices

- Find reasons to remind your player, from time to time, to come back to your game - but not so often that the player feels nagged, or inspired to turn off notifications.
- Implement game systems that encourage engagement.
- Add an achievement system to reward specific meta-game accomplishments, or quests.
- Run one-off events with limited time durations to encourage high engagement during those events - but balance these with less-intensive events to avoid burning out your players.
- Introduce complexity layer by layer to keep more experienced players on their toes without overwhelming new ones. Always monitor when users churn so you can tweak appropriately.
- Listen to your community - polling is a great technique.
 
## Support

Customer support is a key plank in your LiveOps platform. The first, and most critical need of your support team is to ensure that your game is working as intended, and to make it right when things break. To do this well, this team needs the right tools, so they can communicate with players who reach out with issues, investigate problems and take appropriate corrective actions by making adjustments to a player’s profile (e.g. granting virtual currency or items as consolations to players). 

Your support team is also your front line with players, and a rich source of information on what is and is not working in your game. It’s important to treat support as a communication channel rather than a cost center, particularly because your paying players typically have the most questions and provide the most feedback; giving them exceptional support encourages them to keep spending. You should also have a feedback loop between your agents and other departments where problems encountered by players are tracked and addressed.

## Customer support best practices

- Set up a ticketing system so players can submit problems, ideally from inside the game, and CS reps can answer them.
- Give your CS reps a way to look up a player’s profile, and fix any problems with it, such as restoring items to inventory, granting virtual currency, and even manually editing a save game file.
- If you have a ban system, ensure your CS reps can reverse or extend bans.
- Your CS reps need a way to message players - both replying to tickets, but in some cases sending a bulk message to all players to announce an outage or issue.
- If a player is having a persistent crash, it’s useful to be able to have them upload a crash log that can be passed along to engineering to investigate.
- Track support KPIs, including tickets opened and closed, and disseminate them to your team. Changes in CS contact or resolution rates can be a leading indicator of larger issues.
 
## Living on the plateau

“Games can last for decades as a service if you know how to operate them properly and invest in scalable solutions.  Some great scalable solutions are automation and tools. Try to automate all the things that don’t matter and build tools for all the things that do. They not only reduce costs and improve efficiency, but they reduce pressure and allow the team to concentrate on the most important parts of the service.”  
--Ken Go, Founder, Deca Games

It used to be that once a game stopped growing, rapid decay was imminent, and the overhead of maintaining the game would soon outweigh the revenues it brought in. However, this is evolving as well for live games. These days, savvy game marketers know that there’s often still plenty of juice left in a game that has hit a plateau in user growth, and have developed techniques to squeeze it out efficiently. After all, you’ve spent resources getting to this point, and have developed significant assets - while you may decide it’s time to move some of your developers onto the next project, there’s no need to throw out the baby with the bathwater. 

“As games plateau, developers need to put greater focus on retaining their high value players with a high quality service while right-sizing their teams and scrutinizing if you have the right team for the job,” observes Ken Go, Founder of Deca Games. “When thinking about right-sizing and resourcing for games that aren’t growing anymore, you have to think about the game as a service that is constantly changing and engaging its fans.  You need to have proper strategies and expectations for this stage in the game’s lifecycle in order to keep a game from shrinking.” Put another way, LiveOps not only helps your game grow during the up portion of its trajectory, it also helps slow its decline. 

This is where using a backend service like PlayFab can be especially helpful. If you have built and are running your own dedicated backend, then that represents a sizable fixed monthly cost. At some point, as revenue declines, the game becomes unprofitable and needs to be shut down. But if you're using a backend service where your costs scale with usage, then you can conceivably continue operating the game much longer because your fixed costs are so much lower.
