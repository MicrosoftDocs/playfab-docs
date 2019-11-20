---
title: Experimentation Conceptual Recap
author: shikha-tarware
description: Experimentation Conceptual Recap and Best Practices.
ms.author: shtarwar
ms.date: 11/07/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, a/b testing, experimentation
ms.localizationpriority: medium
---

# Experimentation Key Terms

## Conversion Rate
A conversion refers to any desired action that you want the player to take. Conversions do not have to be tied to monetary goals. This can include anything from a click on a button to making a purchase and becoming a player. 

Conversion is the goal of A/B experiments.

Conversions are an absolute number, whereas a conversion rate is the number of conversions divided by the total player traffic. 

## Hypothesis
A hypothesis refers to a claim about the mechanism according to which a given intervention will affect player behavior. It is an idea about what need to be experimented and why, and what changes might appear after the changes.

## Segment
Segments organizes individual players into group(s) which shares common characteristic(s) as per the user-defined qualifying condition(s)/ criteria(s). 
One can flight an experiment with a customized experience for a Segment to verify the hypothesis that an audience will respond more positively.

## % of Flight (Flight Allocation)
A percentage of the total player base (audience) that are considered for the A/B experiment and will receive the control or treatment variant.

## Control Variant
A control variant is an existing experience which is used in an experiment as a measure of comparison to ensure that the experiment works. It provides a baseline measurement for the experiment. It makes sure that the treatment you are giving is causing the experimental results, and not something outside the experiment.

## Treatment Variant
A treatment variant receives the experimental treatment(s) or difference in experience(s) in an experiment. It is the treatment variant(s) which are studied in an A/B experiment and contains the experience changes.

## Weight %
A percentage of target player base (audience) that are to be considered for the associated variant group.

## Variables
Variables are defined to set the feature or experience configuration. Defining feature variables allows you to iterate on your feature without redeploying the code.

## P-Value
The p-value in an A/B experiment is the probability that one would get the observed difference between the variant groups (or a more extreme difference) by random chance. 

When the p-value is high implies that the probability of randomly seeing a difference between the A and B groups is high, due to sampling noise. When the p-value is low (below our threshold) implies that the probability of seeing a difference randomly is low and one can be confident about making the change to the new alternative applicable treatment variant from the original control variant. 

## Confidence Interval
In A/B testing, confidence intervals mitigate the risk of sampling errors, in a sense manages the risk associated with implementing a new variant. If tool says, “We are 95% confident that the conversion rate is X% +/- Y%,” then you need to account for the +/- Y% as the margin of error. How confident you are in your results depends largely on how large the margin of error is. If the two conversion ranges overlap, you need to keep testing to get a valid result.

**Type 1 Error:** 
A type 1 error is a measure of “false positive,” an incorrect belief that a variation in an experiment has made a statistically significant difference. A conclusive winner is declared although the test turned out as inconclusive.

**Type 2 Error:**
A type 2 error is a measure of “false negatives,” an incorrect belief that a variation in an experiment has made no statistically significant difference. No conclusive winner is declared between a control and a variation when there should be one.