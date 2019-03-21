---
title: LiveOps techniques
author: v-kciril
description: Techniques for using LiveOps with PlayFab.
ms.author: v-kciril
ms.date: 03/01/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, real-time analytics, PlayStream, live operations, player behaviors, event archiving, data export, player data, webhooks, analytic reporting, reports
ms.localizationpriority: medium
---

# LiveOps techniques

In the previous section we went through a high-level overview of why LiveOps is a key success driver for today’s top games. Now we’re going to get into the details of the disciplines that make up the LiveOps toolkit, with examples from folks in the trenches and their best practices.

## Player Lifecycle

LiveOps is fundamentally a way of thinking about your game and your community as something that changes and evolves over time as opposed to a single, static product. When creating a game with the LiveOps mindset, you are not an amateur film director crafting your singular vision but a creative director of a television station, curating content and monitoring your audiences’ tastes.

This means that LiveOps games must be more player-centric in their design, and must contend with the passage of time as a part of their strategy. As such, there are a number of important terms and concepts in LiveOps the concern the player lifecycle.

### Acquisition

Acquiring players is something all games must consider, for obvious reasons. Traditionally, player acquisition has been focused on pre-launch excitement building and attracting players to purchase a game as soon as it is available.

For LiveOps focused games, however, player acquisition is an ongoing process. Developers must consider a variety of acquisition channels both for their effectiveness at driving interest and installs but also for their quality of player. For most LiveOps games, it is not enough to just add more players, they need to be players that will stick with your game and become a part of the community.

- **Organic (“word of mouth”) acquisition**. All games should aspire to having great organic acquisition, because that means your game is so great that players are raving about it to their friends and acquaintances without any prompting from you. However, driving organic acquisition is very challenging. Effective community management and an active live content plan can help, but to a large degree true organic acquisition is out of a game developer’s control. Organic acquisition does tend to be very high quality from a retention and monetization standpoint, so boost it where you can, but keep a light touch as you can quickly wear out your welcome attempting to force content to go viral.

- **Social installs** are player installs that are driven by receiving an invitation from a friend, or seeing a post on social media. This is an effective channel, because a player who accepts an invite from a friend is much more likely to engage with the game than a player who simply clicks on an ad. Your success will depend on making it easy for players to invite friends, and a clear explanation of the benefits of inviting them. Consider incentivizing both parties - the inviter and the invitation recipient - to drive adoption. While this increases the cost, it’s possible to test and learn how to make this an efficient channel, with the key metrics to track being invites sent per user, conversion rate for invitations, and the viral coefficient (the product of invites per user and the conversion rate).

- **User-generated content** can be an excellent method of user acquisition, though one that’s hard to control independently. Fostering an active player community helps pull in new players and creates a soft landing for newbies looking to get a comfortable foothold, so it’s worth monitoring your Discord channel and Facebook page to keep things on track. If your game mechanics support user-generated internal content - creating new levels or player skins - this can be a very effective tool for boosting engagement as well.

- **Store discovery** is a tool to help potential players discover your game in a marketplace such as Steam, App Store, or Google Play. There are several things you can do to boost your distribution through each of the various stores, starting with optimizing how your game is presented in the store. Again, testing is key. Trying out different game artwork, screenshots, and description text are relatively fast-twitch experiments that can have a big impact on what percentage of players download your game.

- **Public relations** can be a great acquisition tool, especially in the early part of your game’s lifecycle. Landing on top 10 lists, being featured in editor’s choice sections, and just good old fashion reviews are all ways for PR to increase player awareness. Quality of players acquired varies depending on the coverage, but reaching out to outlets that share your game’s demographic is a great way to increase that quality.

- **Reactivating a lapsed customer** by convincing a player who quit (“churned out of”) your game to reinstall it can be an effective acquisition tool, since these players are already familiar with your game and know what they’re getting into. For this to work, you’ll need a mechanism to message your previous players - typically push notifications or email - and often some sort of incentive offer the player values, such as 1,000 free gold coins for accepting the offer, which can be offered through the message.

- **Cross marketing** is a form of advertising limited to the universe of games you or your publisher control. This is a valuable method since it lets you amortize your cost of acquisition (CAC) across multiple games and thus justify a higher CAC than you can otherwise rationalize. Many developers overlook this, though, and launch games with no way to cross promote other games in their catalog. You can also partner with other developers and agree to cross promote games to each other - that can be an inexpensive way to acquire new players without resorting to expensive ad buys.

- **Influencer marketing** is promotion via celebrity gamers who record themselves playing your game and talking about it. If you’re able to get influencers interested in your game and sharing their exploits on Twitch, Mixer or YouTube, this is a great way to get new players excited about your game and also to communicate tweaks and changes to people who haven’t experienced your game recently. Mainly, however, this is a pay-to-play set up and it’s not cheap; big influencers can charge $50-100,000 or more to promote your game - and the ROI is not always easy to calculate. If you are interested in going this route, consider using a special code or offer so you can tie the install back to the influencer.

- **Paid Acquisition**, where a player installs your game after seeing a paid ad, is certainly popular (for example, the bulk of rewarded video ads in-games are for other games), but your mileage can vary significantly here so you’ll need to sharpen your pencils if you want to go this route. Regardless of whether you pay by impression (CPI), or per install (PPI); run ads on search sites (**Google**), social networks (**Facebook**), or ad networks, the math is the same. If your cost-per-acquired player (CPA) is less than your lifetime value of a player (LTV) then you're ultimately making money. If your CPA > LTV then you're losing money. Your goal is to pick the channels that maximize your ROI (LTV/CPA). Not all channels are equal, and neither are all players acquired; the cheapest CPA is not necessarily the best.

### Retention  

Retention is concerned with how many players not only try your game but come back for more. We’ll go into how this metric is tracked in the next section, but basically retention looks at how many players log back into your game. Since LiveOps is about an ongoing relationship with players, retention is a incredibly important health metric because it’s one of the only data supported ways we have to tell if players are enjoying your game. There are games that are wonderful, and satisfying, short, single session games but LiveOps games must be built to be fun over a longer time frame. So, it follows that the best way to increase retention is to focus on making your game more fun, but how? There are many strategy options for creating fun that leads to retention.

- **Content**. Adding more content for players to consume is often the default option for increasing retention. Levels, maps, story, enemies, anything new and novel that players can consume. But this is very expensive to develop and attempts to make development more efficient can make content start to feel like it was created in an assembly line which can decrease its effectiveness. Regular, slow trickle of content that you know your team can consistently deliver is the best bet for using this retention strategy. Also, make generous use of in-game events to keep content interesting and varied.

- **Investment**. Game systems that allow players to invest time and resources into progression make good retention strategies because they offer motivations to continue engaging in-gameplay loops and they make the game increasingly more valuable to the player. Investments can be in character progression, world progression, or in-game economy as long as they can be improved and personalized over time. This form of retention requires excellent balance and systems design and greatly benefits from data informed
iteration as the game’s community becomes more mature.

- **Social**. Human relationships drive some of the highest retention a game can achieve. Building social networks and social activity into your game can foster the development of relationships and social obligations within your game that drive players to keep coming back. Create space for players to work toward shared goals, communicate, and build trust to get the most out of this strategy.  

- **Core Loop**. Some games are so deep that they take a lot of time to master and so players return over and over again to keep getting better. Classic games like Go are an excellent example of this; simple rules govern a 1V1 game of placing stones on a board but people continue to uncover new tactics after decades of play. Games that use this strategy are often competitive as human opponents offer the best possibility for continued challenge.

Regardless of what retention strategy you decide to employ, make sure you take steps to communicate and encourage players to log in on a regular basis but be careful not to desensitize your players to those messages. Things like daily rewards can be a good way to remind players to login, but they are extrinsic rewards and can quickly lose their appeal as players become accustom to them. Make an effort to communicate things that will be interesting and valuable to your players, to keep their attention and mix up extrinsic rewards so they don’t become background noise.

### Engagement

If retention tells us how strong your game play is, engagement tells us how strong your community is. Active communities engage with your game not only by playing but also by promoting the game, creating fan content, carrying on a dialog about the game, and providing feedback and suggestions. Says Bulletproof Arcade’s Andy Wiltshire, “User generated content is not something that’s particularly easy for us to do in Brutes.io as it’s too hard for users to build. In fact, even a profile picture can be challenging because you need to moderate them. But we still get the community involved - for new costumes in the game, we’ll do a poll and encourage people to vote on social media, and whichever costume wins is the one that we make. The greatest thing for us community-wise has been having the social buttons on the site - if you click them you get rewarded with a new emblem.”

For Coldfire’s Cem Aslan, community is a strategic investment, with Discord the most relevant channel for chatting with players. “Even as a small studio, we prioritized community early on because players will appreciate it if you talk to them and respond fast. Even if you can't fix things immediately, they will honor if you make the effort and answer them.”

Having an engagement strategy is essential for LiveOps games. Some companies, like Riot, are famous for only measuring engagement, and consider it their most important KPI. Some key things to consider when thinking of how you will engage your community are:

- **Channels**
- **Moderation**
- **Fan Celebrity**
- **Measurement**

### Support

Customer support is a key plank in your LiveOps platform. The first, and most critical need of your support team, is to ensure that your game is working as intended, and to make it right when things break. To do this well, this team needs the right tools, so they can communicate with players who reach out with issues, investigate problems and take appropriate corrective actions by making adjustments to a player’s profile (e.g. granting virtual currency or items as consolations to players).

Your support team is also your front line with players, and a rich source of information on what is and is not working in your game. It’s important to treat support as a communication channel rather than a cost center - particularly because your paying players typically have the most questions and provide the most feedback.  Giving them exceptional support encourages them to keep spending. You should also have a feedback loop between your agents and other departments where problems encountered by players are tracked and addressed.

### Customer support best practices

- Set up a ticketing system so players can submit problems, ideally from inside the game, and CS reps can answer them.

- Give your CS reps a way to look up a player’s profile, and fix any problems with it, such as restoring items to inventory, granting virtual currency, and even manually editing a save game file.

- If you have a ban system, ensure your CS reps can reverse or extend bans.

- Your CS reps need a way to message players - both replying to tickets, but in some cases sending a bulk message to all players to announce an outage or issue.

- If a player is having a persistent crash, it’s useful to be able to have them upload a crash log that can be passed along to engineering to investigate.

- Track support KPIs, including tickets opened and closed, and disseminate them to your team. Changes in CS contact or resolution rates can be a leading indicator of larger issues.

## Data for LiveOps

### Analytics

Measuring and analyzing your game’s performance is critical for improving that performance and increasing player satisfaction. Game analytics can be used to measure a wide variety of things so let’s first get familiar with the most common metrics used in LiveOps:

- **ARPU (Average Revenue Per User)**. This metric is used to gauge general business health of a game. It is derived by taking the total number of unique players that have played your game during the reporting period and dividing by total revenue earned during the same period.

- **ARPPU (Average Revenue Per Paying User)**. This metric is used to gauge the health and shape of your monetization strategy. It is derived by taking the total number of unique players that have purchased something during the reporting period and dividing by total revenue earned during the same period. Higher ARPPU is not always better, often attracting a high number of paying players means offering lower cost items or services which will make ARPPU lower but may make total revenue higher.

- **Unique Logins**. This metric is used to gauge the size of your active player population. It is derived by looking at the total number of unique players that connect to your game in the reporting period.

- **Conversion Rate**. This metric is used to gauge how well your game converts players into payers. It is derived by taking the total number of unique players that have purchased something during the reporting period and dividing by the total number of unique players that logged into your game during the same reporting period. The reporting period for this metric is traditionally the entire lifetime of the game.

- **Retention**. This metric is used to gauge how well your game keeps players coming back. It is derived by taking the total number of unique players that logged into your game during a reporting period and calculating how many of them also logged into your game during a later reporting period. Common reporting periods for retention are 1 Day, 7 Day, and 30 Day - here the reporting periods are separated by 1, 7, and 30 days of real time respectively.

- **Average Session Length**. This metric is used to gauge how long your gameplay is considered to be fun. It is derived by measuring the length of time between unique player logins and log outs, and dividing it by the total number of unique players that have logins and logouts during the reporting period.

- **Session Frequency**. This metric is used to gauge how often players engage with your game. It is derived by taking the total number of unique players that logged into your game during the reporting period, and dividing by the total number of login events during that same period.

- **LTV (Life Time Value.)** This metric is used to gauge how high your ROI is for each player. It is derived by taking the total number of unique players in the reporting segment and dividing by the total revenue ever generated by your game. Reporting segments for this metric are often Paying Players, players acquired through a specific method (like advertising or friend referral) or players that all joined your game during the same time frame (a cohort.)

- **Errors**. This metric is used to gauge how stable your game is. It is derived by taking the total number of errors generated by code during the reporting period.

- **Content Logs**. These are specific logs that are unique to the content of your game that measure player activities or events. These can be used to gauge content popularity, stability, or engagement depending on the specific content being tracked.

All of these metrics can be used to gain insights into your game, track the impact of changes, or gauge general health. Most analytics solutions provide at-a-glance reporting for these key KPIs, but for in-depth analysis, you’ll likely want the ability to run custom queries across your full data set as well.

This requires the ability to store and access your raw game data through a data warehouse. You’ll also want to slice these KPIs into different player cohorts or time frames depending on what you’re trying to learn. Player segmentation is a powerful way to get more insight from your data, we’ll dive into using segmentation in the next section.

The speed of data is also an important component of LiveOps analytics. Somethings only need to be reviewed occasionally but others benefit greatly from being real-time. Waiting 24 hours or more to learn how players react to a change or to discover issues like fraud can be a crippling blow to your game.

Notes Renee Ya, Founder at Tiger Byte Studios, *“I believe it's important to stay nimble in a constantly changing environment where you are willing to pivot to a new strategy at a moment's notice based off of rigorous data analysis.”* She advocates for deep-diving into a game’s stats at least twice a week with key stakeholders, “reviewing metrics and creating hypotheses with action items and checking back often to see how we moved the needle based off of feedback.”  

When Kolibri Games launched its hit game **Idle Miner Tycoon**, the team made the decision to launch a lightweight version of the game as quickly as possible and iterate, rather than building out a fully-featured game. This Minimum Viable Product (MVP) model is becoming popular with cutting-edge game developers and Kolibri Games took this approach to heart; rather than focusing on growing player numbers through user acquisition or being featured in an app store, they focused on building traction, focusing tightly on key metrics like early retention signals, number of sessions, DAU (Daily Active Users), and ad monetization.

In the game’s early days, before there were large numbers of players, Kolibri Games Marketing Director Volkmar Reinerth relied heavily on *“player feedback, following the company spirit to be player-centric.”* Then, as the game found and began to grow an audience of players, who in turn began to generate more data, the company prioritized collecting more data for analytics.

![Rank History](media/ranker-history1.png)
**Idle Miner Tycoon:** focusing on customer traction pays off in the long run.

Data visualization is an important tool for understanding the story your data is telling you. Look for cyclical trends like weekday vs. weekend, track performance over time, and get a feel for the impact that major changes - whether that’s your live events or error spikes - have on your game in the short and longer term.

![Logins](media/logins-purchases2.png)

![Calls and Errors](media/calls-errors3.png)

You’ll also want to be able to drill into your event history across preset or custom event queries as a way to help you track and optimize performance and monetization of your live events and benchmark your performance vs. past initiatives.

![Event History](media/event-history4.png)

As you think about analytics, avoid the trap of focusing on headline metrics and use your data to try to dig into specific problems and solve them. It’s useful to know that a first day retention rate for idle games is typically over 50%, vs. over 30% for strategy games, so you can benchmark yourself against the norms (though bear in mind that metrics will vary from country to country). But while tracking retention is important, it’s not actually an actionable metric in itself.

Segmentation helps you turn a question like “why is retention stuck at 20%? What can I do about that?” into a more actionable question like "how are my players who reached level 50 different from players who left before level 10? What are the behaviors that differentiate the two groups? And is there something I can do to encourage the players who left to act more like the players who stuck around?”

This will help you design and test hypotheses - for example, perhaps players are dropping off when they fail to complete an especially hard level. If the data bears that theory out, you can test potential solutions - e.g. offering one-off boosts or other help targeted only to players who are getting stuck, to encourage them to keep going while avoiding impacts to the difficulty curve for the other players who found the difficulty of that level just right.

### Analytics best practices

- Monitor your key stats daily or even hourly to ensure things are running smoothly. A real-time visualization of the data pipeline can be very helpful here.

- Review key reports at least weekly with your team members. Ideally, you should be able to access high-level overview and drill-down detailed reports on-demand and send them automatically to interested parties via a regular email cadence.  

- Be inquisitive - run queries against your data warehouse to figure out what’s going on inside your game, and to help design new features.

- When customers have problems, analyze their event history to see what happened.  

- Think about the right “funnel” progression for players in your game, and design segments to track players as they move along this funnel.

- Experiment with how to motivate players to move through your funnel - in-game messaging, external marketing, email, etc.  

- Compare behavior differences in players in segments you’re happy with, e.g. “players who got to level 50” to players in segments you don’t like, e.g. “players who quit before level 10.” Are there things you can do to encourage one to act more like the other?

## Segmentation

Not all players are created equal, and one important tactic for making your game successful is segmenting your players and finding ways to stimulate each segment to behave in a way that benefits your game. Many parts of a game team use segmentation to make data more useful.

- Marketers need the ability to create **custom segments** and then message to those segments differently to optimize messaging an avoid annoying players with irrelevant messages. They also need to track players via acquisition segments to evaluate whether certain channels are performing well enough.

- Designers need to be able to segment players based on their in-game behavior to better understand player needs and develop the right content. They also need to validate their experiments and A/B tests to see if they are achieving their goals.
- Monetization teams need segments to understand spending patterns, identify degenerate or fraudulent behavior, and to make better revenue predictions.

As your game gains traction, you’ll start to see player segments form naturally, and your analytics toolset should make it easy for you to define custom segments in a way that makes sense for your game (e.g. high XP players, currently active players, lapsed players, players who have made purchases, LTV tiers, etc.)

Then, as you run experiments and test your ideas, you can track how players in your key segments react. When you do something that stimulates the behavior you want to see in a key segment (such as a particular kind of promotion or event), make a note of it and try other similar tactics to see if you can get that effect consistently. Of course, you need to be thoughtful about going to the same well too often or you can burn players out.

![Segments](media/segments5.png) | ![Segments](media/segments6.png)

At a minimum, games should think about the basic "funnel" in their game. For example, you can define some simple segments as follows:

- **New Players** - anyone up to level 10
- **Non-Spenders** - over level 10, LTV = 0
- **Spenders** - where LTV > 0 but < $100
- **Whales** - where LTV > $100

Once you do this, it’s easy to track your progress getting players to move up the value chain from one segment to the next through various tactics you try out. Other common player segments can include your early adopters (players who participated in your beta, perhaps), by platform (e.g., console versus mobile), by country (especially if you think you need to tune your game differently in different countries).

When you have defined the segments you care about, you will want to be able to treat players in each of those segments differently. For example, you might want to show different tips and tricks to each funnel segment to encourage them to move up to the next segment, or only show in-game ads to non-payers, or tune your game mechanics differently in certain countries.

*“Following the machine learning trends, we are quickly getting to a world in which we can't keep track of all the player segments treated differently. While in the past modelling a user journey around 20-50 key points in the game (leveling up, unlocking specific content, taking part in game modes for the first time, etc.) and putting some additional segmenting properties on top - total revenue from a player, total engagement from a player, number of friends, etc. was enough, it's happening already, but will happen even more in the future that we just define a lot of promotions and let the machine learning handle the segmentation.”*  
-- Dimitar Draganov, Senior Product Manager, Flaregames

### Segmentation best practices

- Make a list of the segments you care about in your game, starting with your key funnels, such as your monetization funnel.

- Ensure that your analytics tools let you view your KPIs by segment, so you can compare performance across your segments. You may also want to view your A/B test results by segment as well.

- Design your back end tools so you can treat players in each segment differently. The most common areas for differentiation include messaging, stores, game configuration, offers and promotions, limited content, and events.

- Consider investing in machine learning to automatically segment players into the groups most likely to respond to various promotions and events. Over time, it's likely that we will move toward "segments of one" where individual players are receiving individualized attention and unique game experiences.

## Experimentation

Oscar-winning screenwriter William Goldman has a great quote about making movies: *“Nobody knows anything...not one person in the entire motion picture field knows for a certainty what's going to work. Every time out it's a guess and, if you're lucky, an educated one.”*

It used to be that making games was similar - you had to guess what your audience would like, spend months or years building to this vision, and then launch and hope for the best, with little room to course-correct if you got things wrong. If you’ve read this far, you know that it doesn’t have to be that way anymore. But how, exactly, do you figure out what is and isn’t working about your game, and adapt it over time to build on the elements of the game that are working and de-emphasize those that aren’t?

### Test early and often

Many games run into a chicken-and-egg problem early in their development cycle: they want to test their biggest assumptions before they have really committed, but don’t have enough players to reach statistical significance. So, they feel stuck. However, while split testing is an important technique, it’s not the only tool in your toolkit. In fact, you can get lots of useful information from “scrappy” testing, and your inherent creativity as a game developer can be a significant asset.

For example, you can get valuable data on the appeal of a game’s concept and basic mechanics from running surveys or focus groups very early on, before you even have a real product. You can also test your design concepts before you need to put them into your game - for example, by measuring click-through rates on ads you buy that are identical other than showing different art styles.

Sebastian Knopp notes that *“successful games test everything. Game developers should always consider this before building things, and ask themselves if there is a test they could run to decide whether to build it or not.”*

### Know what you’re testing

Experimentation is great, and testing can significantly improve your game for your community, but it is all for nothing if you don’t know what you’re looking for. Good experiments have a hypothesis, a guess that if we do X then Y will result, or a goal, a target change to a specific KPI. Make sure you have one of these things before designing your experiments or you may find yourself arguing over the results instead of getting clear direction.

### Split testing

Split testing, or splitting your users into two (A/B) or more (multivariate) groups and measuring which variant has the best performance, is often considered the “gold standard” when it comes to running experiments, because you can get statistically significant results that paint a clear picture. If you have zillions of players, you can run even a subtle A/B or multivariate test for a reasonable period of time (typically at least a week, to measure fluctuations between weekend and weekday players) and measure the effect in a statistically significant manner.

But if you don’t - because you’ve just launched, or your game hasn’t yet become massively popular - then you’ll need to measure a big effect in order to be able to be certain that it’s real and not just random fluctuation. The same goes for how many tests you can run simultaneously - unless you have enough users to be able to separate them out completely, you’re stuck running tests in series rather than parallel (and even if you do have tons of players, remember that you can only match players from the same bucket for multiplayer experiences).  

Your goal with testing should be to run as *many* tests as possible. Since you never know in advance whether a test will produce an actual signal, let alone a positive one, the more tests you run, the more chances you have for success - it’s just math.

ColdFire makes it a practice to run many sorts of tests - everything from the look and feel of a game to the game mechanics, tutorials and stores. *“Recently, we did a successful gameplay A/B test: before you get to a boss you have to kill some kind of minions - so we reduced that to see if there was a difference in day1 retention,”* says Cem Aslan.

“It was around 7 percent points better, so we went ahead and deployed the change. As it turned out, getting to the boss earlier was more fun for the players than spending so much time on the level minions, so we just gave the players what they wanted.” Establishing a test-and-learn mindset within an organization is not a trivial endeavor. Sebastian Knopp often sees “teams that are willing to test things in theory but when it comes to building them they get stuck in endless discussions...Failed experiments are an important part of the process to learn, especially for the team running the experiment. The companies that learn fastest, usually win.”*

Finally, be aware of cross-talk and cross-contamination. Game communities are notorious for dissecting every aspect of the games they love. If you already have an established player base, you cannot assume that your experiments will go unnoticed and undiscussed.

In fact, players may get upset if they feel like *one* group in an experiment is getting something better than another. The best policy for testing with an active community is to make sure that if one player sees something different from another, they can clearly understand why. For example, it is unlikely to cause complaints if new players get a discount offer for level appropriate gear while veteran players get a discount on something else but if a random set of players get offered a discount on a popular items and others do not, expect backlash.

## Monitoring player behavior and feedback

It’s possible to treat every change you make to your game as a kind of experiment if you are thoughtful about the approach. If you are constantly monitoring user feedback on channels like **Discord**, **Facebook**, and email, you can use the feedback from these channels - carefully! - to gauge player reaction to changes you make. This approach is less scientific, and has the risk of giving your most vocal players too much influence, but can be a good way to go, particularly early on in your game’s lifecycle (i.e. soft or limited launch) when you have little by way of player data and few resources. You’ll want to augment this stream of data with careful analysis of your player behavior, which you should be tracking closely in your analytics toolset. What happens to your key engagement and retention stats after a change? How does this vary by segment, for example players who make a purchase vs. those who do not?

You’ll want to augment this stream of data with careful analysis of your player behavior, which you should be tracking closely in your analytics toolset. What happens to your key engagement and retention stats after a change? How does this vary by segment, for example players who make a purchase vs. those who do not?

Another way to gather player feedback is with in-game polls and micro surveys. These are especially helpful to evaluate qualitative factors that are not easily measured with analytics. The best time to pop up a poll question is between levels, or at the end of a game. Avoid asking more than one question at a time, though - more than a few seconds and you may interrupt the player’s flow.

These sorts of surveys are really valuable when run in many times as changes are made to your game. Often the results of a specific survey questions such as “Are you enjoying the game?” may not mean much but seeing the trend of sentiment over time on that same question can give you clear insights into the mood of your community.

### Testing best practices

- Test your gameplay early in your lifecycle. It’s harder to run tests on core gameplay once your game has launched and players have strong expectations for how the game behaves.

- You can also use limited-time events to test changes to gameplay - players are much more tolerant of gameplay changes when they’re called out as events.

- Tests are most effective when you have a clear success metric to gauge the impact of the test. That’s why messaging and promotions are especially easy to test, because you can easily compare effectiveness.

- Consider limiting your testing to new players, to avoid confusing existing players.

- Test more qualitative factors by asking questions to players with in-game polls.

## Launching with LiveOps

Since there have been games, there have been launches...and all the things that can and do go wrong with launch. The advent of games-as-a-service makes it easier for studios to dodge some of the most common pitfalls that have crippled previous generations of games, such as failing to scale your back end and then falling over when your game spikes in popularity after being featured. But savvy developers know to start planning their LiveOps strategy well before launch day.

*“With a LiveOps game, the real work starts with launch, instead of ending there. And that is a big challenge for game developers,” says growth and strategy consultant Sebastian Knopp.
“Move fast and scale everything.”*  
-- Pascale Clarysse, CMO, Eden Games

Well before launch day, you should have your LiveOps team staffed, trained up and ready to go. Who’s on the LiveOps team? Your core team should have people assigned to the game responsible for technology (from product through QA), in-game content, user acquisition, monetization, community, and customer service.

And these people should be a close-knit team, working together towards common goals, rather than a loose affiliation of representatives from various departments. It’s very important that roles and responsibilities within the team are clearly laid out, so that the group can make and execute on decisions quickly.

Your LiveOps team will need to have some things well established before launch:

- **Game pillars and content strategy**. The LiveOps team needs to be intimately familiar with the game’s features, balance, and game loops. Ideally these things will be well defined and the team will have a concrete plan for expanding on them in the first few months following launch.

- **Feedback and data pipeline**. How feedback and data will be gathered, accessed, and analyzed needs to be defined. What will your KPIs be? How will player feedback be gathered and responded to?

- **Live reporting and response plan**. Once your game is live, things can go wrong. Does the team have processes and plans for how to handle unexpected issues? Will you be offering 24 hour support? Make sure you have automated error reporting and on call schedules ready.

- **Game direction and ethical guidelines**. Just as important as gathering feedback is understanding how that feedback is going to be acted on. If players say they want your card battler to be a FPS will you attempt to satisfy that request? Lines should be drawn before player feedback and data is flowing in to avoid losing direction.

Large companies like Supercell are known to pride themselves on not allowing teams to make any decisions based only on “gut feeling” after a game is launched.

Ask yourself: does everyone know who is responsible for coordinating new content to support themed events, creating customer segments and generating (and communicating) offers to those segments? Do you have a strong feedback loop from your community to your product and technical teams, and a process to distill feedback into concrete learnings?

Customer support similarly needs to have a clear understanding of policy, and tools and rules set up to drive compliance with that policy. Your engineers should be ready to handle spikes in volume stemming from promotional and marketing activity, regardless of how much notice you get (if any).

Unfortunately, there’s no such thing as a dry run in live games. Determining if your game is ready for launch is very challenging from a standing start - so if you’re investing in a long development cycle prior to launching your game, make sure to build time for a soft launch into your master plan.

When designed correctly, soft launches should give you nearly as much insight into your game play and operational performance as a full launch, but at a small fraction of the risk. Soft launches are a fantastic way to see if your game is connecting with its intended audience, track if players are behaving as you’d expect them to, and tweak monetization - without squandering the momentum you can get from a new launch.

During your soft launch phase, make sure to put your game through its paces. Confirm your operations are running smoothly: get your LiveOps team lined up and have them start using their tools; put your CS team to work handling support issues - and then keep an eye on how both teams are doing. Did everything work as planned? How did customers react? Did your reps break anything?

*“What we have done [during soft launch] is via game analytics, monitoring how long people play and how often, how many brutes are killed, etc. Also watching the YouTube videos that people make to understand their interactions with the game. A few years ago you didn’t really have that, it’s a big help - you can literally watch someone go through their first play experience. If they pick it up, whether they’re struggling or not. It’s really valuable.”*  
-- Andy Wiltshire, Director, Bulletproof Arcade

During soft launch, you’ll also want to confirm that you can update your game without causing disruption to players - and make sure that if something goes wrong with a deployment that you can roll back the changes to minimize impact. Run retrospectives frequently, and be prepared to iterate quickly to make improvements - because while a soft launch is a smart investment, the quicker you can move into full launch, the faster you can start to make real money from your game.

All that said, many smaller developers are starting to eschew soft launches in favor of lean launches. Launching with an MVP gives you a chance to connect with your natural audience and then tune the game based on the direct feedback of your players, focusing your energies on building out the features and functionality that are most likely to resonate with your audience. The trick? You need to be able to adapt your game quickly.  

### Best practices for launch

- Have you assembled your LiveOps team? Are they prepared to start meeting each day to review the previous 24 hours? Do you have a defined process for making decisions as a team?

- Has your LiveOps team developed a calendar for the first few months of your game, so you stay in sync with the development and roll-out of your content, promotions and events?

- Does your LiveOps team have access to the reports and dashboards they need to monitor progress?

- If your LiveOps team changes configuration of your game to run events, add content, and make quick-twitch changes, do you have validation checks in place?

- Have you rehearsed key LiveOps tasks like adding items to the catalog, adding new content, and adding in-game messages?

- Do you have a way to roll back changes?

- Have you set roles and permissions so team members can't make changes they're not trained for?

## Game updates

*"With games-as-service, you have to keep players engaged with new content. There cannot be an endgame."*  
-- Pascal Clarysse, CMO, Eden Games

Today games of any shape and size can amass a large audience quickly if they resonate with players. But keeping that game at the top of the charts is a different matter. Updating your game strategically is a crucial technique for keeping games fresh so that players remain engaged to keeping your game feeling alive for the community. It’s important to note that game update doesn't just mean new levels or new game mechanics. It can also mean new items for purchase, new playable characters, new tournaments, balance, new bundles, or virtually anything that would encourage a player to come back and play more.

Notes Hyper Hippo’s David Eckert, *“People only download so many apps, to have a game that is constantly updating with new features and events means a lot to people. It keeps them engaged with your game. It turns them into a loyal fan that sticks around on a platform where people are onto the latest and greatest week after week.”*

Knowing your players and your community well is a key element of designing and delivering relevant updates - how old are they, where do they live, what motivates them to play? Creating player profiles can help you understand your community better and make content that feels more personal. Understanding your community can also help you determine how frequently to add content and what content will be most enticing.

If your players are primarily high school students, they probably don’t want new content to require lots of playtime during weekdays and they may have very different taste in character customization than players that are between 45 and 65 years old. Invest time in trying to understand you players through research and in-game data.

## Update strategies

When it comes to game updates frequency and consistency are just as important as quality. Setting a consistent update calendar is essential for keeping players engaged because they need to know when to expect new content. Creating a habit loop and becoming a reliable part of your players’ lives goes a long way to moving your game from a piece of consumable entertainment to a hobby. But getting a consistent update pipeline can be challenging especially if your game releases on platforms that require certification. LiveOps games need to employ several techniques to keep their games fresh.

The traditional approach to updating a game is to release a new version of your client. This type of update is most in line with pre-launch game pipelines and so most teams are already well equipped to deploy client updates.

However, client updates require a great deal of testing, on many platforms they must be scheduled and coordinated in advance, and they require your players to download large files. For these reasons, unless you can invest in a large, dedicated build team, client updates are best saved for releasing entirely new features or full game expansions with new art assets.

Most teams will benefit from focusing on content configuration changes that are deployed via the cloud or onto owned servers. This requires a *different* pipeline than client updates.

In this model, assets like art, animation, and core gameplay logic are included in the client but how those assets are assembled and displayed to players is largely driven by server side logic that can be changed without a client update.

To use this strategy effectively, you’ll want to plan your content architecture in advance and try to move as much of your game design logic as possible onto the server or into the cloud. Tools like PlayFab enable you to upload your game logic to the cloud then manage and manipulate it to make changes to your game in real time. This means you can turn live events on and off, change which items are available for purchase, run sales, and message players when you need to without worrying about traditional build processes.

PlayFab *“allows us to get a lot more visibility on what players are engaged with, what they enjoy and don’t enjoy...we can really get an idea of how much the high players are engaging and what they value, and can tailor rewards around that.”*  
-- Phil Larsen (Managing Director, Prettygreat)

## Update scheduling

Choosing what content to update and what to leave alone is both an art and a science, and the right answer for you will of course depend on your game. The goal is to maintain or increase player engagement and monetization without burning players out. Segmenting your players and targeting different segments with different updates (if you have the resources) is a best practice, but timing your content updates thoughtfully is another good approach if you’re resource-constrained.

Another thing to consider when it comes to updating content is how often to make changes. Again, this comes down to the nature of your game, and experiments in this area should follow similar principles as those focusing on what and how much to update.

The conventional wisdom is that for games with light levels of daily player engagement, such as idle clicker games, significant changes may disorient players who haven’t been back in a while. On the other hand, games with a highly engaged community (like MMORPGs) may have tolerance for major updates.

Start with a strong hypothesis, based on your analysis of how players interact with your game - and always measure the response, as your game may behave differently than you expect. One important caveat to bear in mind is that content that significantly changes the nature of game play has the risk of turning off players - potentially your most valuable players. Consider focusing instead on temporary content that comes and goes to gage player reaction before making permanent changes.

Games with a long development cycle may choose to front load their content production as well, but faster-moving studios may not have the ability - or desire - to plan that far ahead. Many experts recommend investing in a few months of forward-looking content by launch, and maintaining a focus on new content creation once the game is live.

Cem Aslan, CEO of ColdFire and formerly a developer at flaregames, recommends preparing around 2 to 3 months of content in advance for new games. *“As a small indie studio, you don't have the money to do user acquisition for a soft launch. So, you just go ahead and publish the game. With **Idle Space**, we went live and released the content we had immediately, to get a first glance at how users are playing the game and if they like it. And then we tracked engagement, and A/B tested a lot while the game was already live.”*

Renee Ya, Founder at Tiger Byte Studios, suggests working on a rolling-quarterly basis, and planning for the subsequent quarter at the same time. That way you can stay about a month ahead of release, while *“actively planning new monetization mechanics and limited time offer sales, sometimes releasing new ideas within the same week, often times making the monetization events intertwined with content releases.”*

Regardless of how often you do game updates, it’s important to think about your content refreshes in a strategic manner. Per Ya, *“it's a good rule of thumb that new game content should come out at least once a month, with regularity that's predictable for your players without having to hand over a calendar of events.”*

Successful games try hard to put real customer benefit into each and every game update, while also evolving and improving their underlying infrastructure based on current needs.

Kolibri Games’ Oliver Löffler tries *“to release a new update each week, and we always try to get something for the user in there as well as bug fixes and reducing technical debt.”*

Similarly, David Eckert of Hyper Hippo notes that *“Our client updates focus on general game features and monetization improvements, but we are always evolving our Events system through client updates too.”*

### Game update best practices

- Make a list of everything in your game that could be considered “content,” and then decide how you plan on updating that content over time. Types to consider include in-game maps or levels, in-game items, quests, events, achievements, and playable characters.

- For each type of content, decide how you will update that content. Does it require a client-update? Or can you update entirely on the server-side?

- If the new content involves in-game assets, how will those assets get down to the client? Client update? **Unity** AssetBundle? Download via Content Delivery Network (CDN)?

- Think about offline mode - if you depend on the back end for updates, make sure your game still runs (for a while at least) even if it cannot connect to the server. This requires some form of caching or storing content on the device.

- When planning content updates, consider both limited-time content that eventually goes away, as well as permanent content updates that stick around. Limited time content is most often connected with an event.

- Consider targeting new content to specific player segments, at least initially.

## Live events

Running successful events is perhaps the most essential LiveOps skill. A good event has the ability to stimulate player engagement while also encouraging players to step up purchase activity. A really good event accomplishes both those things, without burning players out. The key elements of successful events include:

- **Limited-time nature** - most events run for a week or less, though some games (where it takes time to ramp up on how to play using the new content, or where it takes time to assemble a team) might well run events for longer. But it is important for events to come and go. This creates a sense of community history and time passing that helps your game feel more alive and dynamic.

- **Great progression and reward loop**. Events are a great way to offer players achievable goals and rewards to augment the core game loop. Especially for games with mature end games that require players to invest more and more time between core reward moments.

- **Engaging theme and content** - good events spark player curiosity, encouraging them to want to check the event out and can be used to direct player attention to game modes or content they would otherwise miss.

- **Surprise and predictability**. It’s important for players to be able to count on your game to deliver ongoing content like live events. If you run a live event every weekend for 3 weeks but then nothing for two months players will not know what to expect. Instead, a consistent schedule should be established that players can anticipate. However, live events also need to surprise players with unexpected content and rewards. A delicate balance is needed to keep engagement healthy.

- **Good value, limited-time offers** that stimulate purchase behavior.

- **Community effort**. If possible, add a community effort to your events to enhance the feeling that the event is a special moment for the community and that participation is a strengthening act for the community.

- An effective means of **communicating with players** that can draw people who aren’t currently playing, into the game very quickly.

- **A goal**. Good events start with measurable goals that the team can design toward. Make every event a part of your iterative, learning mindset and set goals then measure how well your events meet them in the wild.

![Adventures](media/adventures7.png)

So, what does that mean, exactly? In the abstract, a live event is simply a temporary but meaningful change to a game’s content. Holidays are an obvious theme for events, both because players will generally share some similar associations with the holiday which can be reflected in fun limited-time changes to the game’s appearance, and because holidays can be times when players have more free time available and offering them a reason to play can provide a boost in engagement. Games like **ClashClashClash of Clans** and **Brutes**.io make a practice of running major events for Halloween and the winter holidays, for example.

However, events like contests and tournaments can also run at a smaller scale than full-game live events, requiring significantly less overhead, and furthermore can be targeted to different segments to help minimize player burnout. Space Ape and Hyper Hippo both make a point of scheduling multiple smaller events in between their periodic bigger events to avoid player burnout.

Events can also run in parallel, not just in series. **Clash Royale** organizes daily and weekly “quests”, in addition to special Gold Rush and Gem Rush events, where players can earn gold or gems.

Events are a great way to experiment with new ideas for your game, to see what stimulates the kinds of player behaviors you want to see. Just remember to track and analyze the data, as well as to keep a calendar of your current and planned events to avoid tripping yourself up.

Events often have a "fiction" that masks the actual changes associated with the event. The changes themselves can be something simple, like a higher drop-rate on a particular rare item, or perhaps a new bundle for sale. However, the fiction for the event might still be something dramatic like "Midsummer Night’s Terror" with an equally dramatic description.

This helps create shared history in the game’s community. The community's ability to look back fondly on events or benchmark moments in the game’s history via events is just as important as the content of the events themselves. Furthermore, while some types of events require in-game work, others can be run entirely by looking at event logs and analytics after the fact. For example, an event where players compete to catch the most fish doesn't necessarily require any changes to the game - you can just run a database query after the event to measure who caught the most fish., then let the community celebrate with prizes.

![Snowpark](media/snowpark8.png)

Companies like Kolibri Games understand the dynamics of limited-time events, and have hit all the right notes in their game **Idle Miner Tycoon**.

*“We do event mines on a regular basis - at least one event mine per month and also focus on special events, holidays like Halloween, Christmas etc. You can access mines for a limited time period (3-7 days) and get specific rewards for achieving specific obstacles - different from the normal mines. For special events, we try to get new offers with specific items, for example a really good boost. We also have limited offers which rotate - every second day or so you can get very special items. We schedule countdowns and times on PlayFab,”* says Oliver Löffler, Kolibri Games CTO.

*“To prepare - first we have to prepare new assets with the graphic teams, the game designers refresh the ideas and then bring it all together on the development side. We have different channels to message players. Push notifications have generated a huge increase in logins. In-game messaging - pop-ups that notify players of events. Also all the channels - **Facebook**, **Discord**, **Reddit**.”*

![Popups](media/popups9.png) | ![Popups](media/popups10.png)

![Car Launch](media/car-launch11.png)

## Case study: co-branded car launch event

*"When a new Italian car, the Pagani Huayra Roadster, was introduced at the Geneva Motor Show, Eden Games released the same car exclusively at the same time in our mobile game, Gear.Club. Three days earlier, we did a Facebook live stream, with YouTube influencers testing the game and the riding in the car themselves.*

*We had the idea of a big launch event, a social moment that people will share. We came up with a concept to take a fast car and a driver and put YouTube influencers in the passenger seat while playing our game. And after a long search, we found a car manufacturer to do the event together.*

*After Pagani gave us the go-ahead, we had only three months to focus our resources, develop a special championship, a replica of the factory in the game, as well as the car and its handling. Three days before launch, Pagani still changed crucial details on the actual car which had to be reflected in the game as well. It was a challenge, but when you deliver, it’s so rewarding!*

*Games have come to this point now where they are the biggest entertainment medium out there, much bigger than Hollywood. It’s only natural that we now speak as equals to the automotive industry, Hollywood, sports industry. We are not the lesser product, we are not the license, we are a partner. The market is mature enough that if you think big, there is a market for it. We are catering to potentially 3 billion people now.*

*After a 20 minutes tutorial the special event would appear on the game map – players could borrow the car for 2 weeks and drive 30 special tracks. If they beat all of the tracks within the time limit, they could keep the car in the game. If they only beat 75% of the tracks, they’d get a 75% discount on buying the car.*

*We used push notifications and retargeting to alert players that something special is happening. Players could share the championships from within the game. We also did what Phil Hickey calls marketing the marketing – we marketed the marketing day, like they do on TV when there’s a big live event coming up. We leveraged all our social media channels to prepare for the day, and we teased users about the car, even before we revealed that we had it. We reached out to Apple and Google and gave them a detailed concept two months before the event: 4 slides about what was going to happen in the game and the marketing campaign to support it. This is something I always recommend with Apple and Google. If you want Marketing through featuring from them, tell them what marketing you give them in return. It’s a relationship, it cannot be one-way."*  
-- Pascal Clarysse, CMO, Eden Games

Finding the right cadence for events is important, since you want to stimulate engagement and purchase behavior without burning players out.

*“When we do big LiveOps events we see a big spike then a decline back to normal or a little below normal numbers for a couple days, so we pair LiveOps with client updates every 4-6 weeks to raise the baseline higher for the peaks and the valleys and people stay in the game longer than they would if it weren’t a living thing,”* says Hyper Hippo’s David Ecker.

"**AdVenture Capitalist** *has found a sweet spot with more frequent, shorter events: “We’re seeing that if our ARPDAU takes a little dip, we can do a shorter event and it can erase the negative event. We’re trying two in a week to try to mitigate those dips. Waiting 3-4 weeks is way too long. Now, we’re condensing a 7-day event into a 4-day event and even a 2-day event.”*

Pascal Clarysse of Eden Games notices similar behavior. *“Rhythm is important – every 4 weeks would be the slowest you can be, every 2 to 3 weeks is better. You have to keep in mind that the week after the event there will be a bit of a cannibalization effect. If your event is successful, it will increase monetization but then it will decrease afterward. Your game economy person needs to be part of the planning of the event, your marketing person needs to be part of the planning as well to decide when to plan it.”*

**Gear.Club** also runs longer events, “between 10 days for the more casual events and 20 days for e-sports events to give players the chance to really compete and learn the tracks.” Also, notes Clarysse, “with team-based events, you have to give people more time to organize schedules than with a single player event.”

Running a live game can at times be like orchestrating a complex ballet of teams working together. So, it is essential to build and maintain a calendar view of your live events that’s shared by all the departments that contribute to your LiveOps team. Calendars are essential for planning the nuts and bolts of a live event, including the required new content, localization and communication, as well as the related marketing effort. More than just internal communication tools, calendars should also drive your LiveOps team to deliver events consistently on a schedule that players can count on.

Calendars can also help you manage one of the key risks with running events: player fatigue. As noted above, it’s normal for players to slow down their activity somewhat after an event, and you’ll typically see this drop in playing and spending activity reflected on your KPIs.

But going too far - perhaps running monetization promotions at the same time as an intensive special live event - may fatigue your users in terms of their spending and/or their playing, putting them in jeopardy of leaving. Maintaining a holistic view of all your events will help you see if you’re getting the behavior you expect out of player segments and cohorts.

Mastering the art of player communication is critical to the success of live events. It’s important to be able to communicate with players dynamically through channels that match how they engage with your game. Short session, mobile games will want to use push notifications to let players know things are happening now. While a premium MMO or console game will want to establish a regular cadence of communication cia email or website. Both notifications and emails can be effective tools for re-engagement as well, so make sure you give players enough lead time to get interested and return if they have lapsed.

**Idle Miner Tycoon** has *“a social media team which engages with our players, collects suggestions, and answers questions; we not only react to our players but also actively engage them and start conversations to be as transparent and communicative as possible,”* says Kolibri Games Marketing Director Volkmar Reinerth.

*“We post interactive content across various l channels which is continuously showing that we are player-centric and receives good feedback.”* As the game’s player base has grown, Kolibri Games tactics have become more sophisticated and retargeting has become more of a focus. Now, *“we use push notifications and retargeting campaigns which present the newest features to the users which didn’t play for a while; both are effective.”*

*“Events should be enjoyable for everyone. Some games clearly cater their events to their whales, but then the barriers of entry become too high for regular players. The games that do it best have a big event and a smaller event in between. The top players, which usually are the whales, consume the content much faster so they get bored. The events are what keeps them excited.*

*You need to have events frequently enough so that you can change the menu every now and then. You will never have one event that your entire audience loves. So, if a portion of your audience is disappointed with an event today, it’s ok if in 2 weeks there is another one that they’ll like. They shouldn’t have to wait 6 weeks because they might have left by then. Everyone should get something they like within a month. Keeping the rhythm helps you to fail fast and fail without too much consequence. If you make a mistake it’s alright, because there is another chance in 2 weeks.”*  
-- Pascal Clarysse, CMO, Eden Games

### Live events best practices

- Make a list of every thing you might want to change as part of an event. This can include new game levels or quests, unique in-game items, special event “stores,” discounts or promotions in your normal stores, special event leaderboards and tournaments.

- Set up your game so that you can run events from the server, without requiring a client update. This means exposing game configuration settings on the server so you can change how the game runs during events.

- Create a place in your game where you can list and promote current and upcoming events. You want to be able to message players about events to get them excited.

- Capture key game data in your data warehouse so you can report on and identify winners of events after the fact.

- If possible, design your game so you can have multiple overlapping events running at the same time.

- Give your LiveOps team as much flexibility as possible when creating new events. You never know what they are going to come up with to keep the game fresh and interesting.

- Maintain an internal event calendar so your team knows what’s coming up and when. Use the calendar to avoid scheduling too many “big” events on top of each other - pace your events to avoid burning out players.

- When designing events, consider both the “facts” of the event (e.g., what exactly is changing), and the “fiction” of the event (how you communicate it to the player). The fiction often includes the event name, description, and even graphics.

## Multiplayer

- Capture key game data in your data warehouse so you can report on and identify winners of events after the fact.

- If possible, design your game so you can have multiple overlapping events running at the same time.

- Give your LiveOps team as much flexibility as possible when creating new events. You never know what they are going to come up with to keep the game fresh and interesting.  

- Have your LiveOps team set goals for their events that they can measure against when the event runs. These can be anything that makes sense for your game like increasing KPIs or having a desired community effect.

- Maintain an internal event calendar so your team knows what’s coming up and when. Use the calendar to avoid scheduling too many “big” events on top of each other - pace your events to avoid burning out players.

- When designing events, consider both the “facts” of the event (e.g., what exactly is changing), and the “fiction” of the event (how you communicate it to the player). The fiction often includes the event name, description, and even graphics.

## Monetization

All games must, at some point, determine how they plan to generate revenue. Prevalent monetization strategies have changed over time. It was once expected that games would monetize by charging quarters for player ‘lives’, then it was common to charge for access, and today there are many viable business models with most games choosing one that matches their gameplay and target audience best. Regardless, your monetization strategy will have a profound impact on your relationship with your community because there are few activities that generate more passion than spending money.

### Choosing the right monetization strategy

How your game is monetized has a major impact on the game’s design so it is best to settle on a general strategy as early in the process as possible. Each game is different, but every monetization discussion should include these concepts:

- Consider the type of game you wish to make, platforms you plan to target, and the demographics of your audience. You may have a great design for a free to play 4x game, but if research suggest that players who love 4x games don’t make microtransaction purchases you may be fighting an uphill battle.

- Consider what you want your relationship with your players to be like. Choose a microtransaction strategy that aligns your revenue generating goals with player happiness. If your players love character customization, cosmetic microtransactions will keep you incentivized to make outfits, something your players really want.

- Set ethical guidelines with your team that clearly outline how you want to operate your business. It is easy for teams to get caught up in optimizing systems and reacting to player feedback once a game is live, make sure you all agree to your guidelines before exposing your strategy to a live environment.  

- Know your competition. Just because every other game in your genre is a pay-to-buy premium game doesn’t mean you have to be, but you do need to be aware of the player expectations set by your competition. Especially if you are working on a sequel in a long running franchise, changing the expected player contract requires work and messaging.

## Microtransactions

Microtransactions, sometimes referred to as in-app purchases, are a common form of monetization. Microtransactions are an a-la-carte strategy where players can purchase just the items or features they want each for a relatively low (micro) price. The strategy relies on players making multiple, micro purchases over their time playing the game and often involved active and frequent management of an in-game store where items are sold.

## Value

Successful microtransaction strategies are all about player value. Since you need players to make many, small purchases you must offer items that give them good value and avoid purchasing regret. But how do we know what is valuable to players? A good place to start is to look at what motivates players in your game and sell things that satisfy those motivation needs.

For example, collectable card games offer a lot of autonomy satisfaction as acquiring more cards give the player more combat choices. Selling card packs can increase that autonomy satisfaction.

Complimenting/satisfying core gameplay needs can also be successful, if that same collectable card game doesn’t offer much in the way of social connection, microtransactions could fill in that need with things like custom backgrounds or avatars.

There are some pitfalls to avoid too. Some game communities might be sensitive to the idea of money being used to gain mastery in contexts where mastery is seen as being earned. And using microtransactions to satisfy the same motivations as your progression systems can make balancing the two difficult. Every game’s community will be different so make extensive use of experimentation and A/B testing to see what your community responds to.

## Microtransaction Types

Microtransactions come in many types, and a successful microtransaction strategy is likely to deploy many. Here are the most common and how to use them effectively.

- **Cosmetics**. These are some of the most common microtransactions, especially in-games with primarily western audiences. Cosmetics derive their value from players’ motivation to self-express and socially signal to other players. While self-expression certainly still has value in single player games, the number of players willing to pay for it will be smaller than in-games where other players can see that customization. Also remember that aesthetic preference is highly personal. There is no such thing as a universally appealing cosmetic item. To use cosmetics successfully you must offer a wide range of options. This can be mitigated by presenting cosmetics as collections and offering bonuses for completing them, but if you plan to leverage cosmetics extensively make sure your pipeline is ready to create many assets.

- **Account upgrades**. Permanent enhancements to a player’s account such as additional in-game storage, character slots, or faster leveling can be a great value for engaged players. Western players especially prefer to pay more for permanent upgrades as opposed to cheaper, temporary enhancements because they are, on average, more concerned about loss aversion when it comes to account value. Since account updates can only be purchased once, they can often be priced much higher than other microtransactions.

- **Consumables**. This is any item that is used once for a either a temporary or repeatable effect on a player’s experience. Some of the most common examples are experience or currency boosters for progression-based games. Consumables are usually made available for a cheap price with the expectation that they will be purchased multiple times by the same player. This can be a great a source of continued revenue but it has some pitfalls. Players can hoard consumables, waiting for the perfect moment to deploy them so as not to “waste” them, making them a source of anxiety. Also, many players simply don’t like the inconvenience of needing to purchase them frequently.

- **VIP programs**. Usually subscription-based programs that give players access to perks and enhancements for an on-going fee. A good way to combat the inconvenience of consumables is to bundle them up into a VIP program that the player only needs to set up once. In fact, good VIP program design revolves around convenience and investment. VIP subscribers should get access to all your games convenience enhancements and should see a tangible increase in the value of their investment in your game. Fortnite’s battle pass is a great example of a good VIP program where players get more rewards for investing there time in the game.

- **Content access**. While most commonly used by premium games in the form of DLC (downloadable content), access to content can be a solid microtransaction offering for free to play games as well. The key to managing content access is to ensure that it does not split your player base isolating those with access from those without. **Guild Wars 2** (a PC MMORPG) uses an interesting content access strategy with their Living World content. New episodes include story content and maps and are free to anyone player that logs in within 2 months of an episode’s release, but after that, access to the episode must be paid for. This ensures that active players all have access to the content while still allowing returning players a chance to catch up.

- **Random boxes**. Any item that players purchase without knowing exactly what they will receive is a random box or loot box. Random boxes have a long history in loot based RPGs and they can provide great value to some players but they are also incredibly easy to design in such a way that their value is murky, leading to confusion and even resentment. Once a player opens a random box and feels ripped off they are much less likely to buy another one. The key to designing good random boxes is to understand their value and make that clear to your players. Also, recognize that not all players like getting things randomly. Forcing players that dislike random boxes to use them to get what they want is not a good strategy for long term engagement.

### Store management

A successful microtransaction strategy requires active store management to keep players engaged and making repeat purchases. It is essential that your pipeline allow for frequent updates to your in-game store, ideally without requiring client updates. This will allow your team keep the store fresh and to monitor store data and react without disrupting the rest of your game’s live development.

- **Store presentation and layout**. How your store is presented to players will have a major impact on your sales. Keep things simple! Make items easy to identify and make sure that players know exactly what they are buying from the item name alone. And keep it dynamic, surface new items and offers on the front page ensuring the player always sees the most relevant info first.

- **Catalog management**. New items and new offers should be entering your store regularly, a good rule of thumb is once a week. But that doesn’t mean they should stay forever. Having a rotating catalog can keep your store feeling fresh and not overly cluttered. Also, make good use of bundles, combining several items together for a discount.

- **Pricing**. The price your charge for a microtransaction is often what determines whether players consider it good value or not. Some items are highly elastic, meaning the price will greatly affect how many players are willing to buy, but some are inelastic, meaning price changes will not affect willingness to purchase. Understanding where your items fall on this scale will help you price them most effectively. Also be aware of your competition as many games offer similar items for sale, player expectation on microtransaction value will also play a role in purchasing decisions.

- **Offers and promotions**. Serving special offers and promotions, such as discounts or limit time events, helps keep your store interesting and provides extra value for the most engaged players. But don’t be too aggressive. Continual promotions, especially discounts, can erode players’ perception of value and train them to only buy items on discount. Price protection is still a valuable tool even for microtransactions. This effect can be limited by making offers targeted either to a specific player or to a group of players instead of offering to the entire population.

- **Fraud**. As soon as you begin offering items with real-world currency value you will have some amount of fraud. There is no way to stop fraud completely so make sure you make use of your platform level fraud protection services and monitor it closely. Games that do not allow value to be traded between accounts can worry about fraud less but can also miss out on the high engagement that comes from player to player trade.

### Conversion

For many games, converting players to paying players is an important focus. Not only does having good conversion strategy increase revenue, it also increasing retention as players that pay feel more invested in your game and are likely to stay longer. Getting players to pay for the first time can be challenging primarily for two reasons:

**Barrier to entry**. There is a lot standing in the way of a first purchase. Depending on your platform, the player may need to enter payment information, or even sign up for an account. Every step in the purchase funnel can easily drop 50% of players even if they are interested in purchasing.

The barrier to entry effect can be so strong it even overrides price sensitivity. Take this example of first-time purchasing behavior from an MMO:

![Purchasers Table](media/purchasers-table.png)

Offering a lower-priced bundle doesn’t increase purchasers, because only highly motivated purchasers make it all the way through the funnel - and they clearly have no greater demand for a $1 dollar bundle than a $10 bundle.

**Value proposition**. In a 2017 EEDAR survey, 78% of gamers said that good value was the primary decision maker for in-game purchases. Making a valuable offer is essential to getting a first-time purchase but often the less time a player has spent in your game the less valuable any in-game purchases will be to them.

Notes Draganov of flaregames, “well planned and executed starter bundles have been known to improve first-time conversion by 80-200%.”

Getting it right is an optimization problem as well.

Per Draganov, *“even miniscule changes (e.g. change of main art or slightly bigger discount / value added to the offer) in such offers can bring significant uplifts, so AB-testing such offers is key.”* With IAP, *“the goal is to offer players what they need and when they need it. This requires design of features to be done in a specific way to make the needs and provided solutions obvious and straightforward...everything takes iteration, so analyzing how well a promotion converts new or reconverts old users is key to improving your operations' effectiveness over time.”*

Also, remember to account for spending potential when designing first-time purchasing experiences. Players will have different levels of spending they are comfortable with or able to afford. It can be easy to get caught up in only targeting those that can spend the most, but this leaves large portions of your player base under served.

As Ken Go, Founder of Deca Games, notes. *“Many developers think that squeezing more money out of your top spenders is the best way to maintain a game longer. In the very short term this will work, but if you are selling content that affects competition then you will increase churn and shorten the lifespan of the game by creating a large power gap between spender segments. Invest in-game designs that scale without large inflation in power.”* Instead, Go recommends investing *“in rubber-banded designs that pit equally powered players against each other instead of having the strong only prey on the weak. Having a broader spending base that is paying less is much more sustainable than focusing only on ‘whales.’”*

Paying rate is just as important of a metric as ARPPU, and one that can be optimized and experimented on to improve. It is true that many games see only 1-2% of their players spend but this is far from universal. Depending on genre and target audience, free to play games can have a hugely variant paying rate some well over 50%.

Optimizing paying rate means focusing on servicing players that may never have high LTV but for some games this strategy is essential. For example, any game targeted at minors, who as a group have very little disposable income, will want to be sure to support small transactions and cash-based payment methods. Don’t preemptively cut off most of your potential spenders by simply not serving them.

### Advertising

For free-to-play games, advertising is often an important revenue stream, since at the end of the day many players never make a purchase. In the world of games, one of the most popular and successful forms of advertising is “rewarded video” - a short (and sometimes playable) video, generally promoting a different game, that the player can choose to watch in exchange for an incentive within the structure of the game being played currently.

There’s understandable fear amongst game developers that rewarded videos featuring games that would appeal to the player can distract that player from their current session or from coming back in the future. The opportunity cost is potentially high, particularly for the most valuable players who are making real-money purchases. However, it doesn’t have to be that way.

Notes Dimitar Draganov, Senior Product Manager of flaregames, *“a well-designed and integrated into the core loop rewarded video outperforms every other ad inventory by a wide margin; rewarded videos have always been the biggest revenue driver across all the games I've worked on and they are rarely filled with anything but game ads.”*

If you view rewarded ads as part of the core game loop, you’ll want to optimize the player ad experience along with the rest of your game. That means you’ll need to monitor player engagement with these ad units closely, so you can track and optimize the rewards you offer to players who engage.

![Quick Boost](media/quickboost13.png) | ![Adventure Communist](media/adventure-communist14.png)

Other important ad formats include banners (ads that run across the top or bottom of the screen, similar to what you might see on non-game websites), interstitials (ads that run while the game pauses briefly, for example between levels), and offer walls (a page that offers users rewards or incentives for real-money purchase or in exchange for completing a specific task).

With all forms of advertising, remember that testing and segmentation are key to optimizing ads for your community. Fundamentally, you want to make sure that your monetization efforts aren’t at cross-purposes with your strategy for fostering player engagement and retention. Many developers look to segmentation for this and choose not to show ads to every segment, for example choosing to limit ads to those who do not make real-money purchases.

However, execution really matters here. Draganov of flaregames claims that *“one of the surprising facts about well-integrated video rewarded ads is that they don't ruin the experience for payers and they don't drive players out of the game, on the contrary - we've seen consistently across many games and types of implementation that rewarded ads can improve retention, engagement and from there even IAP spending / LTV of both payers and non-payers. Therefore rather than segmenting, I would advise developers to focus their efforts on building a sophisticated system of rewarded ads that anticipates the right moment and the right reward to offer.”*

Regardless of which path you take, you’ll need to test your way into optimizing it. So, make sure you have the ability to play around with who sees your ads, and then ready, set...go test.  

Once you’ve decided to run ads of any type, you will need to figure out how to optimize them to maximize their impact. The practice of attempting to maximize revenues by showing the right ad to the right person at the right time is often referred to as “ad mediation.” Joining an ad network is a quick-and-dirty way to do a certain amount of optimization and can be a real revenue boost, but it has significant limitations, particularly if you have more than one game to offer.

After all, showing people a message about a relevant event that’s going live in your game or introducing them to another game in your stable may not give you guaranteed revenue like showing an ad served by an external ad network, but the expected value per impression has the potential to be much higher - particularly if you target this information only to paying players. For non-paying players, you’re likely better off generating revenue through a paying ad.

Ideally, your optimization process will be based an on-the-fly calculation of the value per impression for an in-house-ad versus an external ad network for a given player, so you can then decide what to show: house ad, event promotion or cross promotion, or ad network placement.

### Monetization best practices

- Pick a monetization strategy that fits your game and your audience well.  

- Set down your ethical and quality guidelines for monetization so your team is all aligned.

- Use server-side receipt validation to prevent fraud (e.g. Apple or Google receipts). This ensures that the money you think you are making is in fact being made.

- Your players are different, so don't treat them all the same. Different players may want to buy different items. Consider having multiple stores, with different combinations of items for sale depending on the player.

- When putting items in your store, don't just sell single items, also sell bundles of items. Bundles generate more revenue per transaction, and players will feel they are getting a better deal - a win-win.

- Consider running special sales events as part of your events. Common ones include a buy-one-get-one-free promotion, limited time discounts, and even limited-time offers for rare items.

- Stores are great opportunities for A/B testing. Try mixing up the order of items in the store - the same item will sell differently depending on where it is in the store.

- Where your store supports it, offer special coupons that players can give to friends or share via social media. That can not only drive sales but also encourage viral growth. Especially when the player who offers the item also gets a reward if the coupon is used.

- Integrate rewarded video ads into your game.

- Test your rewards - don't just build it once and assume it's going to be effective for all players. In fact, the same player may be motivated by different rewards at different stages of his growth. By definition, a good reward is whatever the player most wants at that moment, and what that is will change.

- When integrating paid ad networks, don't just pick a single network. Different networks perform differently for different regions and types of players. To maximize your revenue, you will likely need several ad networks.

- Don't be afraid to negotiate with the ad networks. If you have enough players and inventory, they will cut you special deals and even guarantee revenue - if you are willing to give them special rights like first crack at your players.

## In-game economy

Economy play, acquiring and managing scarce resources, is a corner stone of many LiveOps focused games because economy play scales well across long periods of time and is highly engaging. While not all games will have systems that would traditionally considered an economy, any LiveOps focused game would do well to think about the way their players interact with resources whether they are materials, time, or currencies.

One challenge games face in economy design is how to differentiate between what can be bought vs. earned. Since some players never make a purchase, games risk alienating their base of players if they make it too difficult to progress without purchases. Many games are designed such that non-paying players are incredibly valuable to the game community and the game health, so making space for systems and progression that are not monetized is essential.

As Draganov puts it, *“great live-games have both non-paying and paying users in lower, mid- and high-end of the leaderboards. As long as you allow players to trade time or money for progress there will always be both types of players - those who pay and those who grind their way through.*

*We have different placements. A start-up package that’s shown in the beginning of the game, and others that you only unlock later in the game. We also have special offers that are targeted to special events. We try to give out things that you can’t buy in the shops to avoid cannibalization.”*

Says Oliver Löffler, Co-Founder and CTO Kolibri Games, *“Each player should play the game, we want to make the game play good for all players, not only whales. But whales have the opportunity to buy boosts which can accelerate their progress. We don’t want to make a game that’s only pay-to-win. You can get all the content by playing but it takes longer. Really engaged players can get through most of the content in 2-4 weeks but there’s no real end to the game.”*

Another important consideration in economy design is whether to allow player to player trade. The ability for players to transfer their value and arbitrage can lead to deeply engaging gameplay loops and adds a deeper layer to your community. However, value transfer between players is difficult to balance and opens the door for fraud and cheating. Players attribute great value to goods that can be transferred and where there is value there is temptation for theft.

Games that allow player to player trade will find their players’ accounts are at higher risk of being hacked and that purchases are more likely to be fraudulent. Even so, this type of game play can greatly increase your retention as players want to hold onto the value they have generated in your game. And it can also increase engagement as the community engages in market speculation and trading tactics for maximizing resource gathering efficiency.

Ultimately trade economies have big upside, if you can manage the risk intelligently. A best practice for reducing fraud in trading economies is to use strict anonymity in trading. Set up commodity market trading, where players offer to buy or sell items at a specific price and the transaction is only completed when a matching offer is made. This keeps the buyer and seller anonymous and helps prevent cartel price fixing and targeted hacking.

Finally, be ready to balance your in-game economy regularly. Long progression systems are difficult to test, you will often need to balance economy factors based on player actions in your game after launch. Modeling is helpful. Create a matrix of all the resource sources and sinks in your game as well as how they are acquired and build a model of in-game economic activity that you can adjust based on number of players and how much they play.

Even with modeling, players may act in ways you didn’t predict. Make sure your economic factors are easy to adjust and experiment on after the game is live. But be careful! If players stockpile a resource because it is highly valuable then you change the balance to make it very common they are likely to feel betrayed. Monitor your players’ economic activities closely to be sure you understand the impact of any changes or experiments you do.

### Game economy best practices

- Most games support at least two virtual currencies: a “soft” currency that can be earned in-game through play, and a “hard” currency that can be bought. Having dual currencies gives you more control over your economy, since you can determine which items can be bought.

- Once players buy or earn an item, they develop a level of attachment to the item, so take it away at your own risk. Western players especially have a strong reaction to loss aversion.

While some games are able to charge for downloads, many find the challenge of getting potential players excited enough to purchase a game without having had a chance to experience it caps their potential revenues too drastically. Offering a free trial for a premium game used to be a very popular model, but has lost favor.

That said, you can have a game be free-to-play up to, say, level 10, then charge money via IAP to keep going. However, bear in mind that with a premium game, it’s challenging to capture revenue beyond the price of the game itself, despite potential player willingness to pay. A free game with IAP allows players to spend whatever they want to spend, from zero up to thousands of dollars.

While there will probably always be AAA games that can command a high price for download, selling a game outright rather than making it available for free is no longer the typical path for live games, so we won’t focus on it here.

- Carefully consider the pros and cons of allowing player to player trade. Be ready for higher fraud rates if you do allow value transfer between players.

- Keep player to player trade anonymous to reduce fraud risks.

- Be prepared to balance your in-game economy and to closely track player economic activities.

- Be wary of selling items that encourage or allow paying players to prey on non-paying.

## Multiplayer

Playing with or against other players adds a significant element of fun to your game. The challenge of a real-time battle with a well-matched player can provide a deeper level of engagement than playing in a solely computer-controlled environment.

Building a great player-vs-player (PvP) experience requires an ability to serve up the right opponent at the right time, so it’s important to ensure that your matchmaking logic is making the right tradeoffs between skill level and time-to-match, particularly as the number of available players ebbs and flows at different times of day. This may take some iteration.

As Cem Aslan notes, *“For **Evoker**, a collectible card game, we first looked at how long the players had been active in the game. That didn't work really well because players already start a game with different knowledge. You can't just assume that all the players who have spent, say, 2 days in the game are on the same level. Then, we looked at how good their stats were and which cards they had already collected. This worked a little better, but we also found it's not ideal to match players that are exactly the same level. Sometimes it's fun to just win easily, and sometimes it's great to have an opponent who is really hard to beat, so you have to put up a fight. In the end, we mostly looked at how often a player had won and how often they had lost. Players who win a lot were matched with other players that win a lot - and vice versa. For this particular game, this approach created the best matches.”*

- Integrate rewarded video ads into your game.

- Test your rewards - don't just build it once and assume it's going to be effective for all players. In fact, the same player may be motivated by different rewards at different stages of his growth. By definition, a good reward is whatever the player most wants at that moment, and what that is will change.

- When integrating paid ad networks, don't just pick a single network. Different networks perform differently for different regions and types of players. To maximize your revenue, you will likely need several ad networks.

- Don't be afraid to negotiate with the ad networks. If you have enough players and inventory, they will cut you special deals and even guarantee revenue - if you are willing to give them special rights like first crack at your players.

While the PvP modality often garners the most attention, cooperative multiplayer modalities can be highly successful as well. For example, **Idle Miner Tycoon** organizes cooperative multiplayer events where players recruit friends to join their teams; the bigger the team a player recruits, the more resources the team gets. This is highly engaging and also provides a method of user acquisition.

IDreamSky’s **Sky Fall** offers cooperative team battles, meaning that players assemble a team together and can then attack another team with an element of surprise. Blackstorm Labs’ **Everwing** offers a cooperative multiplayer experience where players can team up to defeat very powerful bosses. Forming a team with friends in a multiplayer modality means that the game has an opportunity to message others in the team to join the fun as soon as one player picks up the game, which is a powerful engagement tool.

When building synchronous multiplayer, you have two different options. You can build and host your own multiplayer server, then connect players to your server to play against each other. This is the best solution when your multiplayer game requires complex back end logic, such as a Multiplayer Online Battle Arena (MOBA), but adds complexity in terms of scaling up the number of servers.

Or you can use a peer-to-peer multiplayer service, like Photon, to exchange messages between game clients. This option is lighter weight for the developer and allows your game to scale naturally but it is susceptible to cheating since you must trust information sent from a player’s client. This solution can still be very successful if your game is simple or not prone to cheating.

Asynchronous multiplayer is also a great option for offering players the thrill of competition without the need for opponents to be logged in at the same time. This can be achieved by designing a game that is not dependent on player actions in battle, only pre-battle strategy, such as a card battler where each card resolves automatically. This allows players to construct decks then pit them against any other player in the world to see whose deck is better.

### Multiplayer best practices

- Look for ways to add multiplayer to your game, both competitive and cooperative. This doesn't have to be done up front - even single player games can have multiplayer "meta games" added on top.

- Consider both synch and asynch multiplayer - asynch is much easier since it doesn't require real-time multiplayer logic, and just requires ways to compare stats between players such as with a leaderboard.

- Experiment with your matchmaking algorithm. Sometimes the simplest mechanism may be the best.

- If you are building your own multiplayer server, make sure to avoid a common pitfall by giving careful consideration to how you will scale up the number of servers your game needs.

## Leaderboards and tournaments

One of the biggest benefits of having an online game is fostering interactions between players. Adding social and competitive elements to a game help keep players engaged and leverage your most valuable asset; your community.

The most straightforward mode is of course 1:1 competition, allowing players to compete against one another in a head-to-head fashion. This can be based on the players’ location in the game, as in Brutes.io, or via a matchmaking logic to pair players of roughly equal skill. Games like *Clash of Clans* have invested in “2v2” play, letting teams of two compete head-to-head against other teams in multiple modes (draft, challenge, and friendly battle).

No matter what form player interaction takes in your game, leaderboards and tournaments offer players a way to measure their ability and see a representation of the community’s ability at large. Filtering leaderboards by friends adds a social layer where you are competing with people you know from social networks or your guild or clan. For example, *Arena of Valor* uses leaderboards to shows rank vs. friends as well as current progression tier, so players always have their next objective set.

Regional leaderboards can also be effective, particularly since different geographies will interact with your game in different patterns. For example, Asian players typically have a higher frequency rate than Western players do, and Eastern European players may be more likely to monetize heavily to stay at the top of the leaderboard.

Other important multiplayer modes include players cooperating towards a shared goal, teamwork between the members of an organized guild or clan competing as a unit against other groups, and tournaments - which are essentially competition-based events. Leaderboards don’t even need to be purely competitive. Tracking who was the biggest contributor to a shared goal can inspire others to contribute more or just encourage players to acknowledge the high contributor’s commitment.

Leaderboards don’t need to be static, in fact leaderboards that reset regularly can engender more engagement as resets become a new opportunity and a community moment. Prize tables take this a step further by allowing a set of actions (such as a notification to players or the awarding of prizes) to be performed on a group of players based on their ranking in the leaderboard when that leaderboard is reset.

Synchronous multiplayer games, like Brutes.io, pit players against each other in real-time match ups. Support for synchronous multiplayer is a key decision in how the game is built and played, so is generally incorporated during a game’s development. Asynchronous multiplayer techniques, on the other hand, can be added to virtually any single-player game to encourage more engagement. This can be as simple as adding a leaderboard, or more complex, like having limited-time events with leaderboards used to compare performance. Creating an asynchronous multiplayer event, with a special prize for the winner, can be a significant engagement driver compared to a leaderboard alone.

### Leaderboard and tournaments best practices

- Use leaderboards to create a sense of competition.

- Reset leaderboards on regular basis to give players a sense there's always a new opportunity to win.

- Have prizes based on leaderboard position to create more motivation.

- Consider connecting tournaments to events.

- Design your game for synchronous multiplayer for the ultimate in player engagement and retention - if you’re able to make a significant engineering commitment.

## Player Groups

In-game groups, whether they are long term structures like guilds or ad-hoc alliances like parties, are a powerful tool for enhancing the social elements of any game. Groups offer tools for social organization and shared goals and help players better utilize games as social spaces where they can enhance existing relationships or build new ones.  

Player groups are generally considered most effective in competitive multiplayer games, but groups can be a valuable feature in any game design. When used well, they add depth to the interaction between players, provide social structure, and give players natural allies when competing against other players. Guilds specifically have often been associated with longer retention and higher engagement.

The key to good group design is to identify how much trust is needed between players of your game for them to reach shared goals. If success requires high levels of trust, such as needing other players executing their specific role in a competitive MOBA game, you are best served by designing groups to be persistent and deeply connected to help foster the trust needed to perform in such an environment.

If your gameplay is low trust - such as playing along side other players that are attacking the same enemy in an action shooter - groups can be randomly generated and short lived.

Some games assign new players to guilds automatically. Other games make guilds an optional component of gameplay, typically one unlocked only at more advanced levels. Regardless, to support guilds you need to give players a way to create a new guild, or apply to join an existing guild.

Guilds often have ways to customize themselves with artwork, names, and custom descriptions. Guilds generally have a hierarchy of roles; at a minimum, there are members and leaders, who can accept or reject members, and usually there’s some form of guild chat functionality.

A really exciting possibility for group content is guild-vs-guild competition. This can be as simple as having guild leaderboards, to show which guild is on top, or actual guild-vs-guild tournaments or live events where guilds compete directly against each other.

Guilds boost engagement, by providing social incentives on guild members to play to support each other. Guilds also boost monetization, since wealthier members of guilds may gift items or currency to other members of the guilds who are less well off. So, don’t be afraid to give guilds communication tools, such as internal chat, or giving a clan leader the ability to send a push notification directly to teammates.

### Groups best practices

- Consider whether your game would benefit from groups. Generally, any game with multiplayer mechanics and most games with social mechanics will benefit from groups.  

- Determine how much trust is needed for players to reach shared goals in your game and tailor your group design to that need.

- Decide whether to assign new players to a guild automatically, or whether guilds will be optional.

- Most games with groups have group leaderboards, comparing groups on some metric. You need to decide, however, whether this metric comes from adding up or averaging player statistics, such as player XP, or whether your guilds will have their own statistics, based on some form of guild-vs-guild tournament.

- Games often support shared resources such as guild banks, where players can transfer items from their personal inventory to the guild so they can be redistributed to other members. At a minimum, though, you will want a way for members of the guild to directly transfer items or virtual currency to other members.

- Members of a guild will need a way to chat with each other. You can support this in-game, with chat or some other mechanism, or you can support an external messaging service like Discord.

*“You look at everything that’s going on in the market - what other games are doing wrong and avoiding those pitfalls. We’re focusing on using purchases to accelerate things that people were working towards, not on changing the game play - skins, costumes, emblems but also power-up skins. Players want to look different. We also have gold skins - but they’re only something you can grind for, you can’t buy them. That makes players feel cool.*

*Don’t do things that would box you in or alienate players - in Brutes.io, things that you can buy are cosmetic but don’t make you stronger. And of course you can always just play the game to get ahead. Acceleration of content rewards is another thing we do. You can get a costume by killing people who have that costume, but small purchases to accelerate the work people are doing by grinding work - if it takes 20 kills and you’re halfway there, it’s a small amount to get there faster, and people will go for it. We’re also being thoughtful about credit packs - we’re going to have a slider that lets you configure how much you want to buy so you don’t have to overspend.”*  
-- Andy Wiltshire, Director, Bulletproof Arcade

## Localization

You never know where your game will find its audience, so it’s smart to be prepared to localize your game. Take it from Kolibri Games’ Oliver Löffler:  *“We support more than 20 languages. In the beginning we didn’t localize, but then a lot of players messaged us that we should translate and were very happy that we did.”*

Localization will do more than make your players happy - it also encourages them to spend. Some estimates are that up to 50% or more of online users will only buy when presented offers in their native language. Localizing to English, Chinese, Spanish, Arabic, Portuguese, Indonesian, Japanese, Russian, French and German gets you up to 80% of the online population, vs. just 25% for native English speakers.

Localizing in a live game is especially challenging, because the content is continuously changing. This is especially true for your in-game events. It’s one thing when the only thing you need to localize is your game UI and tutorial. You can localize that once, using an outsourced vendor, and not worry about it again. But when you are running continuous A/B tests, or launching new events every week, you will have a continuous stream of content that requires localization.

This calls for storing as much of your in-game text on the server as possible, where it can be easily localized and changed. Don’t forget that internationalizing a game goes beyond language; time/date formats, fonts, currency formats, text direction, and images with text on overlay should all be tailored to the player’s location and should be taken care of at the code level. So, the earlier you plan for localization, the better your game will perform - and the less technical debt you will amass.

### Localization best practices

- Store all of your in-game text on the server, where it can be easily changed.

- Pick the initial target language from the game client, but let the player override their choice of language.

- Give your localization team or contractor direct access to your string tables, so they can edit the text directly and ideally see the results in your game right away.

- Build a “refresh” button into your game, that forces the game to download and display the latest localized text. This allows your localization team to tweak text in-game and see the effects immediately.

- Find reasons to remind your player, from time to time, to come back to your game - but not so often that the player feels nagged, or inspired to turn off notifications.

- Implement game systems that encourage engagement.

- Add an achievement system to reward specific meta-game accomplishments, or quests.

- Run one-off events with limited time durations to encourage high engagement during those events - but balance these with less-intensive events to avoid burning out your players.

- Introduce complexity layer by layer to keep more experienced players on their toes without overwhelming new ones. Always monitor when users churn so you can tweak appropriately.

- Listen to your community - polling is a great technique.

- Make sure all player communications can be localized- not just in-game text, but also push notifications, emails, and the like.

- When localizing your game, don’t forget that your game also needs to fit into the regional culture, so research your launch regions to avoid finding yourself in an unfortunate situation. Touch points like the use of alcohol, food, symbols, hand gestures or affection displays are all little things that have the potential to offend.

- Set up a ticketing system so players can submit problems, ideally from inside the game, and CS reps can answer them.

- Give your CS reps a way to look up a player’s profile, and fix any problems with it, such as restoring items to inventory, granting virtual currency, and even manually editing a save game file.

- If you have a ban system, ensure your CS reps can reverse or extend bans.

- Your CS reps need a way to message players - both replying to tickets, but in some cases sending a bulk message to all players to announce an outage or issue.

- If a player is having a persistent crash, it’s useful to be able to have them upload a crash log that can be passed along to engineering to investigate.

- Track support KPIs, including tickets opened and closed, and disseminate them to your team. Changes in CS contact or resolution rates can be a leading indicator of larger issues.

## Living on the plateau

*“Games can last for decades as a service if you know how to operate them properly and invest in scalable solutions. Some great scalable solutions are automation and tools. Try to automate all the things that don’t matter and build tools for all the things that do. They not only reduce costs and improve efficiency, but they reduce pressure and allow the team to concentrate on the most important parts of the service.”*  
-- Ken Go, Founder, Deca Games

It used to be that once a game stopped growing, rapid decay was imminent, and the overhead of maintaining the game would soon outweigh the revenues it brought in. However, this is evolving as well for live games. These days, savvy game marketers know that there’s often still plenty of juice left in a game that has hit a plateau in user growth, and have developed techniques keep games alive and thriving with an established community.

After all, you’ve spent resources getting to this point, and have developed significant assets - while you may decide it’s time to move some of your developers onto the next project, there’s no need to throw out the baby with the bathwater.

*“As games plateau, developers need to put greater focus on retaining their high value players with a high quality service while right-sizing their teams and scrutinizing if you have the right team for the job,”* observes Ken Go, Founder of Deca Games. *“When thinking about right-sizing and resourcing for games that aren’t growing anymore, you have to think about the game as a service that is constantly changing and engaging its fans. You need to have proper strategies and expectations for this stage in the game’s lifecycle in order to keep a game from shrinking.”*

Put another way, LiveOps not only helps your game grow during the up portion of its trajectory - it also helps slow its decline.

This is where using a back end service like PlayFab can be especially helpful. If you have built and are running your own dedicated back end, then that represents a sizable fixed monthly cost. At some point, as revenue declines, the game becomes unprofitable and needs to be shut down. But if you're using a back end service where your costs scale with usage, then you can conceivably continue operating the game much longer because your fixed costs are so much lower.
