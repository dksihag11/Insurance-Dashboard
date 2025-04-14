
CREATE database Project;
USE Project;
----## TOP 4 OPEN OPPORTUNITY 
SELECT 
opportunity_name,
CONCAT(FORMAT( revenue_amount/1000,0),'K') AS revenue_amount
FROM(
SELECT opportunity_name, revenue_amount
FROM opportunity
WHERE stage IN ('qualify opportunity','negotiate','propose solution')
ORDER BY revenue_amount DESC
LIMIT 4)
 AS ranked_opportunities;

----##  TOP 4 BY REVENUE 
SELECT opportunity_name,
CONCAT(FORMAT(revenue_amount/1000,0),'K') AS revenue_amount
FROM (
SELECT opportunity_name,revenue_amount 
FROM opportunity
WHERE stage IN ('qualify opportunity','negotiate','propose solution')
ORDER BY revenue_amount DESC 
LIMIT 4)
AS ranked_opportunities;

----## PRODUCT DISTRIBUTION
use Project;
SELECT product_group AS category,
COUNT(*) AS product_count
FROM opportunity
GROUP BY product_group
ORDER BY product_count DESC;

----##TOTAL OPPORTUNITIES & OPEN OPPORTUNITIES
SELECT DISTINCT stage FROM opportunity;
SELECT
(SELECT COUNT(*)FROM opportunity) AS total_opportunities,
(SELECT COUNT(*) FROM opportunity )
 AS total_open_opportunities;

 
 
 ----##INVOICE 
 create database InvoiceDATA;
 use invoicedata;
 SELECT 
    "Account Executive", 
    "income_class", 
    COUNT("invoice_number") AS Invoice_Count
FROM invoice
GROUP BY "Account Executive", "income_class"
ORDER BY "Account Executive", "income_class";
 
 SELECT 
    `Account Executive`, 
    COUNT(`invoice_number`) AS Total_Invoice_Count
FROM invoice
GROUP BY `Account Executive`
ORDER BY `Account Executive` desc;



----## NO OF INVOICE BY ACCOUNT EXECUTIVE
SELECT 
    `Account Executive`, 
    `income_class`, 
    COUNT(`invoice_number`) AS Invoice_Count
FROM invoice
GROUP BY `Account Executive`, `income_class`
ORDER BY `Account Executive`, `income_class` DESC;

----## NO OF MEETING BY ACCOUNT EXECUTIVES 
create database AccountsExc;
use AccountsExc;
Create table Meeting
(AccountID int(20) not null,
AccountExc varchar(100) not null,
branch_name varchar (100) not null,
global_attendees varchar(100),
meeting_date date not null);
insert into Meeting values
(2, 'Abhinav Shivam', 'Ahmedabad', 'Alex Johnson', '2019-10-17'),
(2, 'Abhinav Shivam', 'Ahmedabad', 'Emily Thompson', '2019-10-17'),
(2, 'Abhinav Shivam', 'Ahmedabad', 'Liam Smith', '2019-12-24'),
(2, 'Abhinav Shivam', 'Ahmedabad', 'Ava Davis', '2020-01-03'),
(2, 'Abhinav Shivam', 'Ahmedabad', 'Noah Wilson', '2020-01-08'),
(2, 'Abhinav Shivam', 'Ahmedabad', 'Olivia Brown', '2020-01-08'),
(2, 'Abhinav Shivam', 'Ahmedabad', 'William Martinez', '2020-01-09'),
(1, 'Vinay', 'Ahmedabad', 'Sophia Garcia', '2020-01-02'),
(1, 'Vinay', 'Ahmedabad', 'James Miller', '2020-01-03'),
(1, 'Vinay', 'Ahmedabad', 'Mia Rodriguez', '2020-01-06'),
(1, 'Vinay', 'Ahmedabad', 'Benjamin Anderson', '2020-01-07'),
(1, 'Vinay', 'Ahmedabad', 'Charlotte Taylor', '2020-01-08'),
(3, 'Animesh Rawat', 'Ahmedabad', 'Lucas Hernandez', '2020-01-13'),
(3, 'Animesh Rawat', 'Ahmedabad', 'Amelia Moore', '2020-01-13'),
(3, 'Animesh Rawat', 'Ahmedabad', 'Henry Thomas', '2020-01-09'),
(3, 'Animesh Rawat', 'Ahmedabad', 'Harper Martin', '2020-01-10'),
(6, 'Ketan Jain', 'Ahmedabad', 'Alexander Jackson', '2020-01-03'),
(6, 'Ketan Jain', 'Ahmedabad', 'Ella White', '2020-01-08'),
(6, 'Ketan Jain', 'Ahmedabad', 'Michael Lee', '2020-01-13'),
(6, 'Ketan Jain', 'Ahmedabad', 'Grace Harris', '2020-01-09'),
(4, 'Gilbert', 'Ahmedabad', 'Daniel Clark', '2020-01-06'),
(4, 'Gilbert', 'Ahmedabad', 'Scarlett Lewis', '2020-01-20'),
(4, 'Gilbert', 'Ahmedabad', 'Matthew Walker', '2020-01-20'),
(12, 'Shivani Sharma', 'Ahmedabad', 'Madison Robinson', '2020-01-21'),
(12, 'Shivani Sharma', 'Ahmedabad', 'David Hall', '2020-01-21'),
(12, 'Shivani Sharma', 'Ahmedabad', 'Lily Young', '2020-01-21'),
(12, 'Shivani Sharma', 'Ahmedabad', 'Samuel Allen', '2020-01-22'),
(9, 'Manish Sharma', 'Ahmedabad', 'Chloe King', '2020-01-13'),
(9, 'Manish Sharma', 'Ahmedabad', 'Joseph Scott', '2020-01-09'),
(9, 'Manish Sharma', 'Ahmedabad', 'Evelyn Wright', '2020-01-21'),
(11, 'Raju Kumar', 'Ahmedabad', 'Andrew Adams', '2020-01-22'),
(11, 'Raju Kumar', 'Ahmedabad', 'Aria Baker', '2020-01-20'),
(10, 'Mark', 'Ahmedabad', 'Christopher Campbell', '2020-01-22'),
(10, 'Mark', 'Ahmedabad', 'Zoe Rivera', '2020-01-13');
drop table meeting;
select * from Meeting;
-- No. of meetings by Account Exc
SELECT 
    AccountID, 
    AccountExc, 
    branch_name, 
    COUNT(DISTINCT meeting_date) AS total_meetings
FROM meeting 
GROUP BY AccountID, AccountExc, branch_name
ORDER BY total_meetings DESC;

USE insurance_project;

-- Check product_group
SELECT DISTINCT product_group FROM opportunity;

-- Check product_sub_group
SELECT DISTINCT product_sub_group FROM opportunity;

-- Check specialty
SELECT DISTINCT specialty FROM opportunity;

USE insurance_project;

SELECT 
    CASE 
        WHEN product_group IN ('Terrorism', 'Miscellaneous') THEN 'Cross Sell'
        WHEN product_group IN ('Marine', 'Fire', 'Liability') THEN 'New Policy'
        WHEN product_group IN ('Employee Benefits', 'Engineering') THEN 'Renewal'
        ELSE 'Other'
    END AS Category,
    
    COUNT(DISTINCT opportunity_id) AS New,
    SUM(premium_amount) AS Achieve

FROM opportunity
GROUP BY Category;

--##Stage funnel by revenue
create database funnelrev;
use  funnelrev;
SELECT stage, SUM(revenue_amount) AS total_revenue
FROM funnelrev.opportunity
GROUP BY stage
ORDER BY total_revenue DESC;












