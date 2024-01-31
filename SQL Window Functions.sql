create database bank;

use  bank;

SELECT * FROM bank.`bank-full`;

-- Windows Functions 

-- Balance Based on Education 

SELECT education,
    sum(balance) over (partition by education) as Total_bal
FROM bank.`bank-full`;

SELECT education,
    avg(balance) over (partition by education) as Avg_bal
FROM bank.`bank-full`;

SELECT education,
    count(balance) over (partition by education) as Count_bal
FROM bank.`bank-full`;

-- Balance Based on Education  using Group by and comapring both 

SELECT education,
sum(balance) as Total_bal
FROM bank.`bank-full`
group by education
order by 2 desc;

-- We can use order by in window function

SELECT education, balance,
    sum(balance) over (partition by education order by balance desc) as Total_bal
FROM bank.`bank-full`;

-- Defining window function separatly Aliasing the function 

SELECT education, balance ,
    sum(balance) over Window_fun as Total_bal,
    avg(balance) over Window_fun as Avg_bal,
    count(balance) over Window_fun as Count_bal
FROM bank.`bank-full`
WINDOW Window_fun as (partition by education);

SELECT * FROM bank.`bank-full`;


-- Balance Based on Job

SELECT job, balance,
    sum(balance) over (partition by job) as Total_bal,
    avg(balance) over (partition by job) as Avg_bal,
    count(balance) over (partition by job) as count_bal
FROM bank.`bank-full`;


-- Balance Based on Job using Alias window function 

SELECT job, balance,
    sum(balance) over fun as Total_bal,
    avg(balance) over fun as Avg_bal,
    count(balance) over fun as count_bal
FROM bank.`bank-full`
WINDOW fun as (partition by job);



SELECT * FROM bank.`bank-full`;

-- Age  Based on Marital status

SELECT marital, 
    avg(age) over (partition by marital) as Avg_Age,
    max(age) over (partition by marital) as Max_Age,
    min(age) over (partition by marital) as Min_Age
FROM bank.`bank-full`;


SELECT job, 
    avg(age) over (partition by job) as Avg_Age,
    max(age) over (partition by job) as Max_Age,
    min(age) over (partition by job) as Min_Age
FROM bank.`bank-full`;


SELECT education, 
    avg(age) over (partition by education) as Avg_Age,
    max(age) over (partition by education) as Max_Age,
    min(age) over (partition by education) as Min_Age
FROM bank.`bank-full`;


SELECT * FROM bank.`bank-full`;


-- Using Rank () function 

SELECT education, balance,
    rank() over (partition by education order by balance desc) as Bal_Rank
FROM bank.`bank-full`;

SELECT education, age,
    rank() over (partition by education order by age desc) as Age_rank
FROM bank.`bank-full`;

SELECT * FROM bank.`bank-full`;


SELECT education, pdays,
    rank() over (partition by education order by pdays desc) as Pdays_rank
FROM bank.`bank-full`;

SELECT education, pdays, 
    rank() over (partition by education order by pdays desc) as Pdays_rank
FROM bank.`bank-full`;

SELECT marital, balance, 
    rank() over (partition by marital order by balance desc) as Marital_bal_rank
FROM bank.`bank-full`;

SELECT job, balance, 
    rank() over (partition by job order by balance desc) as bal_rank
FROM bank.`bank-full`;

-- using NTILE()

SELECT education, pdays, 
ntile(2)  over (partition by education order by pdays desc) as Pdays_rank
FROM bank.`bank-full`;


SELECT education, pdays, 
ntile(4)  over (partition by education order by pdays desc) as Pdays_rank
FROM bank.`bank-full`;

-- Using the first Value 

SELECT education, marital, balance, 
    first_value(education) over (partition by marital order by balance desc) as first_value_education
FROM bank.`bank-full`;

SELECT job, marital, balance, 
    first_value(job) over (partition by marital order by balance desc) as first_value_job
FROM bank.`bank-full`;

SELECT job, marital, age, 
    first_value(job) over (partition by marital order by age desc) as first_value_job
FROM bank.`bank-full`;

SELECT job, marital, pdays, 
    first_value(job) over (partition by marital order by pdays desc) as first_value_job
FROM bank.`bank-full`;









