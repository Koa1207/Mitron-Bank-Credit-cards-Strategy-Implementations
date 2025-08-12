# Mitron Bank's Credit card check

## Introduction 

Mitron Bank is a legacy financial institution headquartered in Hyderabad. Our goal is to introduce a new line of credit cards, aiming to broaden our product offerings and reach in the financial market.
A sample dataset of 4000 customers across five cities on their online spend and other details has been provided.

## Table of contents:
- [Project Overview](#Overview)
- [Executive Summary](#executive_Summary)
- [Our Objectives](#objectives)
- [Primary KPI's](#Kpi's)
- [Insights](#insights)
- [Stratgeic Recommendations](#recommendations)

  
## Executive Summary
This project aims to identify key customer segments and spending behaviours to guide the launch of Mitron Bank’s new credit card line. Through detailed analysis of demographic profiles, income utilisation patterns, payment method preferences, and category-level spending, the study provides actionable insights to maximise credit card adoption and usage.
Findings reveal that customers aged 25–45, particularly IT professionals and freelancers in Mumbai and Delhi NCR, highlight the highest adoption potential for the new line of credit cards. Credit cards dominate high-value categories such as Bills and Electronics, while Groceries remain UPI-heavy, signalling an untapped conversion opportunity. Younger customers (21–24) display high entertainment and UPI spending, while older groups (35–45 and 45+) favour debit and net banking, requiring tailored reward propositions.
The strategic recommendations focus on category-specific rewards, payment method shift incentives, and geographic targeting to align product features with customer needs. By leveraging these insights, Mitron Bank can design compelling credit card offerings that not only drive immediate adoption but also foster long-term engagement and loyalty.

## Our Ojectives:

- Demographic classification: Classify customers based on demographic attributes such as age group, gender, and occupation to uncover behavioral patterns and potential target groups. 

- Avg income utilisation %: Analyze the average income utilization percentage to assess the likelihood of credit card usage among different customer segments.

- Spending Insights: Identify major spending categories and trends to inform the design of credit card features tailored to customer needs.

- Key Customer Segments: Identify and profile high-value customer segments with the greatest potential for credit card adoption and usage.

## Primary KPI's
- Demographic Segment
- Average income utilisation
- Top 3 spending Category
- High-Value Customer segment share

## Insights

### SQL Queries


### Dashboard
Here is a snippet of the deashboard made using excel. To access it [click here](https://public.tableau.com/views/TheMitronBank/Dashboarddemographics?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) 

## 1. Demographic Segment Analysis
### 1.1 Age Group Spending Patterns
- 21–24 years: Spend most on entertainment (24.68%), with credit cards as the dominant payment method, closely followed by UPI.
- 25–34 years: Bills dominate spending (22.16%) with credit cards as the primary payment method.
- 35–45 years: Bills are also dominant (21.66%), but debit cards feature more strongly alongside credit cards.
- 45+ years: Bills lead spending (22.51%) with credit cards followed by debit cards.
### 1.2 Occupation-Based Trends
- IT Professionals: Highest average income utilisation (1.44%), indicating strong credit adoption potential.
- Freelancers: 1.29% utilisation, showing good adoption potential.
### 1.3 Geographic Performance
- Mumbai: 1.90% average income utilisation — highest market potential.
- Delhi NCR: 1.30% utilisation — strong secondary target.
- Chennai: 0.90% utilisation — lowest; requires awareness-building campaigns.


## 2. Average Income Utilisation Overview
Average income utilisation reflects the capacity and willingness to use credit. Higher utilisation signals readiness for credit card adoption.
### By Age Group

- 35–45: 1.29%
- 21–24: 1.24%
- 25–34: 1.21%
- 45+: 0.98%
### By Occupation
- IT Professionals: 1.44%
- Freelancers: 1.29%
- Other Salaried Employees: 1.19%
- Business Owners: 0.93%
- Government Employees: 0.82%
### By City
- Mumbai: 1.90%
- Delhi NCR: 1.30%
- Bengaluru: 1.21%
- Hyderabad: 1.01%
- Chennai: 0.90%





## 3. Top 3 Spending Categories



|Rank|	Category  |	Spend Value |	Share (%)|	Dominant Age Group|	Dominant Payment Method|
|--- |-----------  |----------   |-----------|--------------------|-------------------------|
|1	  |      Bills  |	₹2,378,392  |	17.52%   |	25–34	            |    Credit Card          |
|2	  | Electronics |₹2,167,311   |	15.97%	|  21–24	            |  Credit Card            |
|3	  |Groceries    |	₹1,963,452  |	14.96%   |	25–34	            |      UPI                |


- Credit cards dominate Bills and Electronics categories, presenting strong potential for targeted cashback or points programs.
- Groceries are dominated by UPI payments, signalling a conversion opportunity with rewards designed for everyday purchases.

### 4.1 Category-Based High Spenders (Credit Card)
- Bills and Electronics show the largest usage gap in favour of credit cards.
- Groceries rank third in spend share but are UPI-dominated.
### 4.2 Payment Behaviour by Age
- 21–24: Highest spend via UPI (37.11%).
- 25–34: Highest spend via credit cards.
- 35–45: Highest spend via debit cards (35.38%).
- 45+: Highest spend via net banking (19.69%).
#### Non-Credit Card Users:
- Top category is Groceries (16.87%), dominated by UPI (8.56%).
- Bills (16.30%) — debit card dominant (7.08%).
- Electronics (15.24%) — UPI dominant (7.47%).







## 5. Strategic Recommendations
### 1. Target High-Potential Segments
   - Age 25–45 in Mumbai and Delhi NCR, especially IT professionals and freelancers.
   - Emphasise benefits for everyday spending (Bills, Groceries) and high-ticket items (Electronics).
     
 ### 2. Category-Specific Reward Design
   - Bills & Electronics: Offer high cashback rates or accelerated reward points to reinforce existing credit card dominance.
   - Groceries: Create UPI-to-credit conversion incentives (e.g., double points or cashback when paying with the card instead of UPI).
     
### 3. Payment Method Shift Campaigns
   - For 21–24 and 35–45 groups with high UPI/Debit usage, launch “Switch & Save” campaigns showing benefits of credit card use over existing methods.
### 4.Geographic Prioritisation
   - Mumbai → aggressive acquisition campaigns.
   - Delhi NCR → strengthen category-specific promotions.
   - Chennai → education-based campaigns to build trust and familiarity with credit card benefits.
### 5. Segment-Specific Products
  - Lifestyle cards for 21–24 targeting entertainment, electronics, and online retail.
  -Utility & travel rewards for 35–45.
  -Essential-spend cashback cards for 45+ focusing on bills and groceries.


## Conclusions
The analysis reveals that credit card adoption potential is concentrated among 25–45-year-old customers, particularly IT professionals and freelancers in high-utilisation markets like Mumbai and Delhi NCR. Spending behaviour shows a clear dominance of credit cards in high-value categories such as Bills and Electronics, while Groceries remain largely UPI-driven, representing a strong opportunity for conversion. Age-specific patterns highlight that younger customers (21–24) lean heavily on UPI for discretionary spending, while older segments (35–45 and 45+) display stronger ties to debit and net banking, suggesting tailored reward structures are essential to drive behavioural shifts.

By aligning rewards programs with category-specific spending trends and targeting segments with both high utilisation capacity and strong spending activity, Mitron Bank can maximise credit card usage, increase customer loyalty, and capture greater share across key markets. Strategic emphasis on category-based incentives, digital payment conversion, and geographic prioritisation will be critical in realising this growth potential.





