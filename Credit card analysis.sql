----CREATE TABLES---
Create Table Customers
(Customer_id varchar (30),
  age_group varchar (10),
  City text,
  Occupation text,
  gender text,
  Marital_status text,
  avg_income integer);
--------
Create Table Facts_spends
(Customer_id varchar (30),
  Month text,
  Category varchar (100),
  Payment_typw text,
   Spend integer);

----- Count number of customers----

SELECT 
    COUNT(DISTINCT customers.customer_id) AS customer_count from customers;
------
select count(*) from customers;
----
select Customer_id, occupation from customers;

----DISTIBUTION BY OCCUPATION--

Select distinct occupation from customers;

--Percentage of customers per occupuation--

Select count(*) * 100.0 / (select count(*) from customers) as Percentage, occupation,
count(occupation) as total
from Customers
group by occupation
order by percentage DESC;


---DISTRIBUTION BY AGE---

Select distinct age_group from customers;
--------
select count(*) * 100.0 / (select count(*) from customers) as Percentage, age_group,
count(age_group) as total
from Customers
group by age_group
order by percentage DESC;


--------DISTRIBUTION BY GENDER-------

select count(*) * 100.0 / (select count(*) from customers) as Percentage, gender,
count(gender) as total
from Customers
group by gender
order by percentage DESC;


-------DISTIBUTION BY MARITAL STATUS---------

Select distinct Marital_status from customers;
-----

select count(*) * 100.0 / (select count(*) from customers) as Percentage, Marital_status,
count(Marital_status) as total
from Customers
group by Marital_status
order by percentage DESC;


--INCOME AND AVERAGE INCOME UTILIZATION:----------------

---Ultimate Average income--
Select Avg (avg_income) from customers;

------- Average Spend------
Select avg(spend) from facts_spends;

--Find average income utilization % of credit card users avg spend/avg income---
Select customers.customer_id, customers.age_group, Payment_type, (AVG(spend) / avg_income) * 100 
AS Average_income_utilization
from customers
join facts_spends on customers.customer_id = facts_spends.customer_id
where payment_type ='Credit Card'
group by customers.customer_id, customers.age_group, avg_income, Payment_type
order by Average_income_utilization DESC;

----- Find average income utilization % of customers who do not have credit cards as a payment type--
Select distinct customers.customer_id, customers.age_group, gender, Marital_status, City, Occupation, payment_type, avg_income, spend, 
(AVG(spend)/avg_income)* 100
as Average_income_utilization 
from customers
inner join facts_spends on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card' 
group by customers.customer_id, customers.age_group, payment_type, gender, City, Occupation,
customers.avg_income, customers.Marital_status, spend
order by Average_income_utilization DESC;


---SPENDING INSIGHTS-----
-- Average spend by category for credit card users---

Select Category, AVG(spend) as average_spend
from facts_spends
where payment_type = 'Credit Card'
group by category
order by average_spend DESC;

-- Average spend by category for non credit card users---

Select Category, AVG(spend) as average_spend
from facts_spends
where payment_type != 'Credit Card'
group by category
order by average_spend DESC;

---Combining tables together--
Select Customers.customer_id, gender, age_group, Occupation, City, marital_status, Payment_type,
month, Category, avg_income, spend, 
(AVG(spend)/avg_income)* 100 as average_income_utilization from customers
join facts_spends on facts_spends.customer_id = customers.customer_id
group by Customers.customer_id, gender, age_group, Occupation, City, marital_status,
month, Category, Payment_type, avg_income, spend


---the average income utilization of Credit cards users--

Select distinct customers.customer_id, payment_type, (avg(spend)/ avg_income)* 100 as average_income_utilization
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type = 'Credit Card' 
group by customers.avg_income, facts_spends.payment_type, customers.customer_id
order by average_income_utilization DESC;

-- The average income utilization per customer_id and their categories.
---The higher, the more likely Credit cards will be used--

Select customers.customer_id, payment_type, (avg(spend)/ avg_income)* 100 as average_income_utilization, Category
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by customers.avg_income, facts_spends.payment_type, customers.customer_id, facts_spends.category
order by average_income_utilization DESC;

----- customers' average income utilization-------

SELECT Distinct facts_spends.customer_id, gender, age_group, Occupation, city, Marital_status, Payment_type, 
Month, Category,avg_income, spend,  
(AVG(facts_spends.spend) / customers.avg_income) * 100 AS average_income_utilization
FROM 
    facts_spends
JOIN 
    customers ON customers.customer_id = facts_spends.customer_id

GROUP BY
    facts_spends.customer_id, customers.avg_income, Customers.gender, customers.age_group, customers.occupation, 
	Customers.Marital_status, customers.City, facts_spends.payment_type, Category, month, customers.avg_income, facts_spends.spend;

-----Create view of non credit card users----

CREATE VIEW Non_Credit_card_Utilization AS
SELECT Distinct Customers.Customer_id, gender, age_group, Occupation, city, Marital_status, Payment_type,  
(AVG(facts_spends.spend) / customers.avg_income) * 100 AS average_income_utilization
FROM 
    facts_spends
JOIN 
    customers ON customers.customer_id = facts_spends.customer_id
where Payment_type != 'Credit Card'
GROUP BY
    customers.customer_id, customers.avg_income, Customers.gender, customers.age_group, customers.occupation, 
	Customers.Marital_status, customers.City, facts_spends.payment_type
HAVING 
    (AVG(facts_spends.spend) / customers.avg_income) * 100 > 1.225
order by average_income_utilization DESC;
	
	

----- Spending by Occupation--

Select  Occupation, (AVG(spend)/avg_income)* 100 as average_income_utilization
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
group by  Occupation, avg_income
order by average_income_utilization  DESC;


---Spending by age group--

Select distinct age_group, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
group by age_group
order by average_spend DESC;

----Spend by Credit card users by age group---
Select distinct age_group, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type ='Credit Card'
group by age_group
order by average_spend DESC;

----Spend by Non-Credit card users by age group---
Select distinct age_group, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type !='Credit Card'
group by age_group
order by average_spend DESC;



----- Average spends by city---

Select distinct City, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
group by City
order by average_spend DESC;


----Spending by Gender and Marital Status--

Select distinct gender, Marital_status, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
group by gender, Marital_Status
order by average_spend DESC;

----Spending of all customers per category--
Select distinct category, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
group by Category
order by average_spend DESC;

--Spending preference between Credit and Non-Credit Card Users:
---Spending by Category of credit card users---
Select distinct category, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type = 'Credit Card'
group by Category
order by average_spend DESC;

---Spending by Category of non credit card users---
Select distinct category, avg(spend) as average_spend
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by Category
order by average_spend DESC;













