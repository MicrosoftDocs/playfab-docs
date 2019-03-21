---
title: Introduction to LiveOps
author: v-kciril
description: Introduction to LiveOps.
ms.author: v-kciril
ms.date: 01/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, real-time analytics, PlayStream, live operations, player behaviors, event archiving, data export, player data, webhooks, analytic reporting, reports, liveops
ms.localizationpriority: medium
---

# Introduction to LiveOps

We looked at the industry and saw that the typical path is to do most of the work up front. We wanted to test if our game is actually working - it’s hard to know in advance if our game would be successful.

The game itself took about eight weeks to develop, we released it and then continued to iterate. We wanted to get really early measurements and adjust based on user feedback. And if the game didn’t work out, we could kill it and start a new thing - we’d only wasted eight weeks.

What is LiveOps? As the word itself suggests, it has to do with the operation, or running, of a live game; a game that has some element that changes and evolves over time.

Collectively, these activities have come to be called "**LiveOps**," and while they were once solely the purview of MMOs and free-to-play titles, cultivating long-term relationships with players through continued engagement is becoming a gold standard for all types of games from mobile to AAA console experiences.

Successful game studios today recognize and embrace the idea that games have evolved into services that change and grow over time with new content, live events, and frequent updates.

Games must not only aim to provide fun and engaging experiences, the bar has been raised - to be successful over the long term, games *also* need to understand and segment their players, develop deep relationships, and understand and meet the needs of multiple player segments.

Collectively, these activities have come to be called **LiveOps**, and while they were once solely the purview of **MMOs** and free-to-play titles, cultivating long-term relationships with players through continued engagement is becoming a gold standard for all types of games from mobile to AAA console experiences.

“*New releases now only represent a part of our business, which is now focused on long-term engagement with our player communities… Our players not only play more hours at a time, but do so over a period of months or even years. We are thus able to offer them new experiences and content, thereby extending the lifetime of our games.”*  
-- Yves Guillemot, CEO, Ubisoft

LiveOps has also made a dramatic impact on premium games, however, including console, PC and mobile. Notes Andrew Wilson, CEO of Electronic Arts, “*Our growing live services have fundamentally changed our business model, resulting in a more stable and predictable cash flow, all year round.*”

Today, LiveOps is having a dramatic impact on game development both in the realm of business and in design.

Companies that adopt a LiveOps mindset focus on making their games last longer - turning them into “forever franchises” - and find that this produces a far higher return on their development and marketing investment than traditional game development and advertising.

For example, as of Q3 2017, live services represented roughly **half** of EA’s net bookings, and this number has been growing at 10-15% annually. Additionally, LiveOps techniques drive developers to design systems and content that can be enjoyed for months or years.

To see the impact that LiveOps can have on game longevity, look no further than the top 10 games by revenue for 2017 and 2018. Fully 80% of the games in the top 10 in 2017 were also in the charts in 2018 - and all of them are operated as services, with a strong emphasis on LiveOps.

![Mobile Revenue](media/wwrevenue.png)

LiveOps is an important part of the most successful games; an essential element that keeps these games strong year after year. But what is LiveOps exactly?

- **A way of thinking about your players**. A LiveOps mindset calls for thinking about your players as a community, complex and changing with shared history and trends, not as a static set of consumers who will experience your content and then move on.

- **A way of approaching game design and direction**. LiveOps games focus on delivering valuable experiences that are player centered instead of creator centered. This means thinking about ongoing player satisfaction instead of just initial attraction.

- **A way of using data**. LiveOps is about experimentation and learning. Data is used to understand if a hypothesis is correct or if a goal has been met.

Planning for a LiveOps model has several important ramifications for your studio. With LiveOps, you can:

- Make changes quickly, which provides a fast and clean way to address unforeseen problems that crop up after launch.

- Segment players and make targeted communications or offers appropriate for each segment to stimulate engagement and boost monetization.

- Run special in-game events to keep a game from getting stale, or attract players to come back and re-engage - often with dramatic impact.

- Collect and analyze game data to provide insight into how to tune and improve your game. Viewing performance in real-time can identify issues like a new update causing a spike in errors, or a mis-configuration causing an exploit that might permanently ruin your game’s economy if not quickly rolled back.

At a more strategic level, *data* - and in particular, *real-time data* - allows you to build games using a “lean” methodology. In a traditional waterfall-style process, a team typically develops a game for a year or more before getting feedback at launch or soft launch, at which point it’s generally too late to make significant changes.

A lean approach turns the timing on its head, allowing you to launch a less-polished, less-fully-featured game way earlier than a waterfall approach, and lets the game then continue to change and grow after launch based on the data generated by real customers.

This approach requires a significant shift in mindset, but the payoff can be significant - you can start realizing revenues sooner and know with confidence that you’re building a game that resonates with your players.

But to pull it off, you need the right tools - in particular, server-side configuration to build tests, and business intelligence and analytics to measure - so that you can build a build-measure-learn feedback loop.

A lean approach turns the timing on its head, allowing you to launch a less-polished, less-fully-featured game way earlier than a waterfall approach, and lets the game then continue to change and grow after launch based on the data generated by real customers. This approach requires a significant shift in mindset, but the payoff can be significant - you can start realizing revenues sooner and know with confidence that you’re building a game that resonates with your players. But to pull it off, you need the right tools - in particular, server-side configuration to build tests, and business intelligence and analytics to measure - so that you can build a build-measure-learn feedback loop.

![Feedback Loop](media/feedback-loop.png)  
The Lean Startup Methodology allows developers to obtain measurable outcomes much sooner.

![Lean Methodology](media/lean-methodology.png)

## A tale of two games

The orange line shows the trajectory of a successful game that got featured in app stores and got a lot of downloads - but had no LiveOps strategy. The gray line took longer to find a big audience, but continues to grow that audience through its LiveOps tactics.

## The LiveOps lifecycle

“*Of course, LiveOps is hard – it’s live. With everything that is live, you break eggs.*”  
-- Pascal Clarisse, CMO, Eden Games

![LiveOps Lifecycle](media/liveops-lifecycle.png)

Once you’ve decided to adopt a LiveOps methodology, you’ll need to make choices about what to do and how to go about it. The biggest bang for the buck comes from embracing LiveOps early in your game’s development, so you can design your game to maximize the advantages you get from game services.

However it’s never too soon to start - you can still get a lot of benefit from adding LiveOps later in your development timeline - even long after a game has launched. Furthermore, the experience of experimenting with LiveOps in a live game will provide useful experience to help plan LiveOps in your next game.

At a high level, here’s a framework for how to think about LiveOps over the lifecycle of your game:

**Pre-production** is the best time to think strategically about how you can take advantage of LiveOps features in your game design. In particular this is an ideal time to decide on a monetization strategy for your game. Free to play strategies specifically benefit greatly from early planning; for example, building your game on top of back end services can make it easy for you to configure your stores and update inventory on the fly. That’s important because it reduces the risk and overhead associated with several key activities: running live events, testing offers to understand the impact on your game’s monetization prior to making them widely available, keeping your game fresh by making limited-time offers, and making segmented offers.

This is also a good time to think about the needs and wants of your target players, since a big benefit of LiveOps is increased engagement with your player community. What will get their attention? What will encourage them to really dig in? What methods will you use to communicate with them?

As your game moves into active **development** it’s time to begin thinking about content pipeline and build and deploy strategies. Many studios still follow waterfall methodology, often taking a year or more to design and launch a fully-realized, fully-polished game with most or all of its planned features ready on day one. This can lead to pipelines that are ridged and deployment that is a long and tedious process. That makes sense, the more time you invest in upfront development, the more you’ve got riding on a smooth and successful launch - so don’t let the pressure to launch cause you to shortchange your game’s future. LiveOps pipelines need to allow for simultaneous development of many, isolated pieces of content at once, and deployment must be agile. Invest in your LiveOps pipelines early and in your data logging. It’s easy to wire in the ability to capture key data like player logins, purchase events, and custom events - all of which you’ll need to have in order to understand and improve your games’ performance.

If you want to be able to keep your game fresh without needing a client update that requires full build and deployment, consider creating your content as dynamic text fields, images and other configurable content (e.g. Unity AssetBundles) that lives in the cloud and can be distributed on the fly and turned on at your discretion.

**Content** is another area where advance planning can save you significant time once your game is live, particularly if you don’t plan frequent update cycles. If you want to be able to keep your game fresh without needing a client update that requires full build and deployment, consider creating your content as dynamic text fields, images and other configurable content (e.g. Unity AssetBundles) that lives in the cloud and can be distributed on the fly and turned on at your discretion. This has two significant benefits: ease of localization and speed of iteration. You’ll also want to think about **automation** early on, so that you can move quickly to stop problems like cheating and fraud before they blow up and potentially ruin your game for other players. So think through a plan for how you’ll be able to take bulk actions as well as set and create triggered events and scheduled tasks, even if you don’t plan to do these right at launch.

Collecting and analyzing your **crash data** and **retention metrics** is also a must, even if you are taking a lean approach to development. “We mostly focused on the game itself during development, because nothing else would make sense if the game wasn’t fun,” says Kolibri Games’ Oliver Löffler. “We did focus on crash analytics and basic analytics to measure retention, which was a key performance indicator for us. We also built functionality to make sure we could make commits without breaking anything. At the beginning we were aiming to make something that would be fun for up to 4 days, and see if players would be engaged enough in that time period to add on more content to sustain engagement over a longer period.”

You’ll also want to think about **automation** early on, so that you can move quickly to stop problems like cheating and fraud before they blow up and potentially ruin your game for other players. So think through a plan for how you’ll be able to take bulk actions, as well as set and create triggered events and scheduled tasks - even if you don’t plan to do these right at launch.

Collecting and analyzing your crash data and retention metrics is also a must, even if you are taking a lean approach to development.

“*We mostly focused on the game itself during development, because nothing else would make sense if the game wasn’t fun,*” says Kolibri Games’ Oliver Löffler.

“*We did focus on crash analytics and basic analytics to measure retention, which was a key performance indicator for us. We also built functionality to make sure we could make commits without breaking anything. At the beginning we were aiming to make something that would be fun for up to 4 days, and see if players would be engaged enough in that time period to add on more content to sustain engagement over a longer period.*”

If you’ve invested many months of work into your game, **soft launch** is an important way to de-risk your game’s launch. Pick a smaller geography that shares the same language as your core audience (Australia, New Zealand, and Canada are all popular options) and run your game for 1-3 months.

Or simply launch to a small audience with an Early Access or Beta tag to set player expectations. This is where you should be making use of *all* the analytics you wired up, looking for flaws you can correct so your full launch goes perfectly.

Smart soft-launching saved Nvizzio’s Roller Coaster Tycoon for Touch from falling into oblivion.

At the time of soft-launch, the game was seeing 65% player loss on day one. The team dug into the data, and realized that their tutorial was too complex. So the team changed the flow of the tutorial. By the time they released worldwide, the game topped the charts during release week.

![Tycoon Example](media/tycoon.png)

At **launch**, your key concerns are around your community - your ability to attract players, retain them over time, offer monetization options they find appealing, and scale to accommodate them. The effort can be non-trivial, especially if you go it alone - as Cem Aslan, CEO of ColdFire Games puts it, “Especially as a small studio, it can be very time-consuming to maintain and scale your own servers.” Launch is your first opportunity for the investment you’ve made in your game to start paying off, but finding the right path forward can be tricky. You’ll need analytics to help you understand your cost of acquisition and your player lifetime value, both critical to your understanding of how much you can afford to spend on user acquisition. Wiring up your game for analytics will let you understand which strategies are profitable, and how your sources of players stack up. That way, you can invest in the most efficient channels and stop wasting money and effort on the low performers, and you can understand how different segments of players are performing and track your efforts to improve your player metrics.

Once you’re armed with detailed knowledge of how your game is truly performing, you’ve reached **equilibrium** and are ready to dig into a continual live cycle to maximize its potential. This is where you get the payoff from the features you wired into your game during development, so that you can make significant tweaks to your game without needing to coordinate a full update. It’s becoming well understood that running live events is one of the most powerful ways to stimulate engagement with your game, but many developers don’t realize that you can make a big impact with live events even if you don’t have a large team devoted to this - as long as your back end services offer the tools to make this process simple and scalable. As an example, let’s look at how Hyper Hippo was able to scale up their use of events on *AdVenture Capitalist* with a small team - and how those events drove player engagement - by utilizing PlayFab’s back end services.

![Hyper Hippo](media/adventure-capitalist.png)

Hyper Hippo was able to scale its use of live events on AdVenture Capitalist by incorporating back-end services.

![Adventure Capitalist Rank](media/adventure-capitalist-rank.png)
These events have helped AdVenture Capitalist remain at the top of the charts for years.

“*LiveOps has definitely increased the longevity of our game - it just keeps people engaged way, way better in terms of keeping the pulse of the game alive...Having new events all the time re-invests people in the game, it re-creates the endorphin rush that players get in the first days of playing the game.*”  
-- David Ecker, Lead Producer, Hyper Hippo

The most important thing is to set goals for your event based on what you learn from analyzing your game’s data, and to structure your event to address these goals - for example, drawing lapsed players back to your game or convincing players who’ve never spent real-money currency to make their first purchase.

In addition to events, other major LiveOps techniques include:

- **Special offers and promotions** to boost monetization or re-engage players.
- **Retention and retargeting campaigns** to reduce churn and boost retention.
- **Paid acquisition campaigns** - if your players typically have a high enough lifetime value, this can have a strong return on investment.
- **Social features** like a sharing mechanism can be a significant means of acquiring players organically. These are typically designed to drive a high number of shares through tools that make it easy to share, strong incentives for users who do share, and well-designed contextual onboarding for players who receive shares.
- **Community engagement** like contests, live streaming, developer Q & As, and in-game holidays.

A smart LiveOps strategy can significantly extend your game’s heyday, which has a massive impact on your game’s ROI. But even after your game is past its audience growing phase, it can still be very profitable for you - if you built your game on scalable services. In the **plateau phase** of a game, you can dynamically right-size your back-end, so you’re not paying for unnecessary capacity. In fact, you have a range of options for keeping your game alive longer while preserving resources for your next title - from leaving some aspects of your game on autopilot with a dynamically scaling back-end platform, to partnering with a company like Deca Games that focuses on maximizing the potential of games in their plateau phase.

Don’t write off your game without thinking through your options; Deca Games has successfully used LiveOps techniques to reinvigorate games they’ve acquired well into their plateau phase, such as Realm of the Mad God. A browser-based game originally invented by two developers in a 2010 hackathon, *Realm of the Mad God* was a cult hit that was acquired by Kabam in 2012. When Kabam shifted its priorities to mobile, the game lost focus internally and was on “life support” when Deca Games took it on. Deca grew the game without any marketing spend “by working with the community and hyper-delivering on their wants and needs,” notes Deca’s Ken Go, helping the game grow through word of mouth. As a result, 7 years on the game has more active players than ever before. Investing in keeping your game alive longer also presents a great cross-marketing opportunity since you’ve got an active audience to which you can promote your other games.

“*In three years our games have generated over $80m revenue. Depending on how you account for it, Live Ops initiatives generated between one and two-thirds of that revenue…Live Ops underpins everything we do.*”  
-- Simon Hade, COO, SpaceApe

For more information on LiveOps, continue to [LiveOps Techniques](liveops-techniques.md).
