---
title: Experimentation Key-terms
author: shikha-tarware
description: Experimentation Key-terms.
ms.author: shtarwar
ms.date: 03/03/2020
ms.topic: conceptual
ms.service: azure-playfab
keywords: playfab, analytics, a/b testing, experimentation
ms.localizationpriority: medium
---

# Experiments Key Terms
To get comfortable with experiment as a practice and develop an understanding of the key-terms, read below:

### Experiments
A/B experiments are a method of comparing two or more configurations of game experience (variants), whereas multivariate experiments allow you to configure several game elements and determine which combinations (variants) perform best at achieving your conversion goals. 

This is done by splitting users randomly into two or more groups and providing different experiences to each group over a period of time, and statistical analysis is done on the collected telemetry to determine which variation performs better based on the goals you decide for the experiment

With PlayFab Experiments, support both A/B testing (also known as split testing) and multivariate testing. 

### Conversion Rate
A conversion refers to any desired action that you want the player to take. Conversions don't have to be tied to monetary goals. This can include anything from a select on a button to making a purchase and becoming a player. 

Conversion is the goal of experiments. Conversions are an absolute number, whereas a conversion rate is the number of conversions divided by the total player traffic. 

### Hypothesis
A hypothesis presents a claim about how a given intervention affects player behavior. The hypothesis is a combination of an idea about what scenarios to experiment and why, and what changes might appear after the changes.

### Segment
Segments organizes individual players into group(s) that shares common characteristic(s) as per the user-defined qualifying condition(s)/criteria(s). 

You can flight an experiment with a customized experience for a Segment to verify the hypothesis that an audience will respond more positively.

### % of target audience
A percentage of the total player base that is considered for the experiment and is associated with the control or treatment variant.

### Control Variant
A control variant is an existing experience that is used in an experiment as a measure of comparison to ensure that the experiment works. It provides a baseline measurement for the experiment. It makes sure that the treatment you're giving is causing the experimental results, and not something outside the experiment.

### Treatment Variant
A treatment variant receives the experimental treatment(s) or difference in experience(s) in an experiment. It's the treatment variant(s) that are studied in an A/B experiment and contains the experience changes.

### Variables
Variables are defined to set the feature or experience configuration. Defining feature variables allows you to iterate on your feature without redeploying the code.

### P-value
The p-value in an A/B experiment is the probability that there's no difference between variant groups.

When the p-value is high, it implies that any difference between the A, and B groups is due to sampling noise.  When the p-value is low (below our threshold), it implies that the there's a real difference between variants and the shown delta is the most likely actual difference.

### Confidence Interval
In A/B testing, confidence intervals mitigate the risk of sampling errors, in a sense manages the risk associated with implementing a new variant. If the tool indicates, “We're 95% confident that the conversion rate is X% +/- Y%,” then you need to account for the +/- Y% as the margin of error. How confident you are in your results depends largely on how large the margin of error is. If the two conversion ranges overlap, you need to keep testing to get a valid result.

**Type 1 Error:** 
A type 1 error is a measure of “false positive,” an incorrect belief that a variation in an experiment has made a statistically significant difference. A conclusive winner is declared although the test turned out as inconclusive.

**Type 2 Error:**
A type 2 error is a measure of “false negatives,” an incorrect belief that a variation in an experiment has made no statistically significant difference. No conclusive winner is declared between a control and a variation when there should be one.
