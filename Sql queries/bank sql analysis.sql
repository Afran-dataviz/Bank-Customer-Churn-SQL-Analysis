create database bank;

use bank;

select * from dbo.Bank_Churn;

--Show all customers from Germany
select * from dbo.Bank_Churn
where Geography = 'Germany';


--Find customers whose age is greater than 40.
select * from dbo.Bank_Churn
where Age > 40;


--Display the top 10 customers with the highest balance.
select top 10 *
from dbo.Bank_Churn
order by Balance desc;


--Count the total number of customers in each country.
select Geography,count(CustomerId) as Total_customer
from dbo.Bank_Churn
group by Geography;


--Find the average estimated salary of female customers.
select avg(EstimatedSalary) as Female_avg_salary
from dbo.Bank_Churn
where Gender = 'Female';

--Show customers who have exited the bank.
select * from dbo.Bank_Churn
where Exited = 1;

--Find the maximum, minimum, and average credit score.
select 
min(CreditScore) as Min_score,
max(CreditScore) as max_score,
avg(CreditScore) as avg_score
from dbo.Bank_Churn;


-- Count active and inactive members
select IsActiveMember,
count(*) as Member_Count
from dbo.Bank_Churn
group by IsActiveMember;



--Find countries having more than 2000 customers.
select Geography,count(customerId) as customer_count
from dbo.Bank_Churn
group by Geography
having count(customerId) > 2000
order by customer_count;


--Display customers whose balance is greater than the average balance of all customers.
select * 
from dbo.Bank_Churn 
where Balance > 
(
	select avg(Balance)
	from dbo.Bank_Churn
);


--Find customers who have both a credit card and are active members.
select * 
from dbo.Bank_Churn
where HasCrCard = 1 
and IsActiveMember = 1;

--Find the second highest estimated salary in the dataset.
select max(EstimatedSalary) as Second_High_salary
from dbo.Bank_Churn
where EstimatedSalary < (
	select max(EstimatedSalary)
	from dbo.Bank_Churn
);
