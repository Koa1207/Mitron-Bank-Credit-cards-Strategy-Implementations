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

----DISTIBUTION BY OCCUPATION that do not use Credit cards--

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

---Average income--

------- Average Spend------
Select avg(spend) from facts_spends;

--Find average income utilization where avg spend/avg income---
Select customers.customer_id, customers.age_group, Payment_type, (AVG(spend) / avg_income) * 100 
AS Average_income_utilization
from customers
join facts_spends on customers.customer_id = facts_spends.customer_id
group by customers.customer_id, customers.age_group, avg_income, Payment_type
order by Average_income_utilization DESC;

----- Find average income utilization of customers who do not have credit cards as a payment type--
Select customers.customer_id, customers.age_group, Marital_status,Payment_type, (AVG(spend)/avg_income)* 100
as Average_income_utilization 
from customers
join facts_spends on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by customers.customer_id, customers.age_group, Payment_type, 
customers.avg_income, customers.Marital_status
order by Average_income_utilization DESC;




---SPENDING INSIGHTS-----

-- Total spent by category for non credit card users---

Select Category, AVG(spend) as average_spend, Category
from facts_spends
where payment_type != 'Credit Card'
group by category
order by average_spend DESC;

---the average income utilization of Credit cards users--

Select customers.customer_id, payment_type, (avg(spend)/ avg_income)* 100 as average_income_utilization
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

----- Non credit card users' average income utilization-------

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
    (AVG(facts_spends.spend) / customers.avg_income) * 100 > 2.1
order by average_income_utilization DESC;

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
    (AVG(facts_spends.spend) / customers.avg_income) * 100 > 2.1
order by average_income_utilization DESC;
	
	

----- Spending by Occupation--

Select  Occupation, (AVG(spend)/avg_income)* 100 as average_income_utilization
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by  Occupation, avg_income
order by average_income_utilization  DESC;


---Spending by age group--

Select  age_group,(AVG(spend)/avg_income)* 100 as average_income_utilization
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by age_group, avg_income
order by average_income_utilization DESC;



----- Total spends by city---

Select  city,(AVG(spend)/ avg_income)* 100 as average_income_utilization
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by city, avg_income
order by average_income_utilization DESC;


----Spending by gender--

Select gender, (AVG(spend)/avg_income)* 100 as average_income_utilization, payment_type
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by gender, avg_income, payment_type
order by average_income_utilization DESC;



-----Spending by Marital status---

Select Marital_status, (AVG(spend)/avg_income)* 100 as average_income_utilization, payment_type
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by Marital_status, avg_income, payment_type
order by average_income_utilization DESC;

---Spending by Category---
Select Category, (AVG(spend)/avg_income)* 100 as average_income_utilization, payment_type
from facts_spends
join customers on customers.customer_id = facts_spends.customer_id
where payment_type != 'Credit Card'
group by Category, avg_income, payment_type
order by average_income_utilization DESC;




---- The average spend and its correlation with the cities and the age groups--

select city, age_group, AVG(spend) as average_spend from customers 
join facts_spends on facts_spends.customer_id = customers.customer_id
where payment_type != 'Credit Card'
group by city, age_group
order by average_spend DESC;










