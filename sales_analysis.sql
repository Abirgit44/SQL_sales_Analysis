--viewing the data
SELECT*from sales;

--So hello, we will analyze the sales dataset in SQL now...

--Checking unique values
select distinct status from sales;
select distinct year_id from sales;
select distinct PRODUCTLINE from sales; 
select distinct COUNTRY from sales; 
select distinct DEALSIZE from sales; 
select distinct TERRITORY from sales; 

---ANALYSIS
----Let's first do grouping of sales by productline
select PRODUCTLINE, sum(sales) Revenue
from sales
group by PRODUCTLINE
order by 2 desc
--From here we learn Classic Cars are sold most by them followed by Vintage Cars and Motorcycles respectively as 2nd and 3rd most.
--Trains are the least sold Product.

select YEAR_ID, sum(sales) Revenue
from sales
group by YEAR_ID
order by 2 desc
--2004 was the most succesful year followed by 2003 where as 2005 was much lower.
--we need to check month_id to see whether they operated for all the months or not for all years and after checking we can see they didn't frequently operate in 2005.
select distinct MONTH_ID from sales
where year_id = 2005

select  DEALSIZE,  sum(sales) Revenue
from sales
group by  DEALSIZE
order by 2 desc
--most were medium deals followed by small which is closer to lowest made deals which were large.

----What was the best month for sales in a specific year? How much was earned that month? 
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from sales
where YEAR_ID = 2004 --change the year to see which year you want
group by  MONTH_ID
order by 2 desc
--here for 2004 november was best month with most orders and revenue.
--November seems to be the month, what product do they sell in November, Classic I believe
select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from sales
where YEAR_ID = 2004 and MONTH_ID = 11 --change year to see the rest
group by  MONTH_ID, PRODUCTLINE
order by 3 desc
--As predicted It Was Classic

--What city has the highest number of sales in a specific country
select city, sum (sales) Revenue
from sales
where country = 'USA' --change as you like
group by city
order by 2 desc
--Suprisingly San Rafael,California is the city with most revenue in USA

---What is the best product in a certain country?
select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from sales
where country = 'USA' --change as you like
group by  country, YEAR_ID, PRODUCTLINE
order by 4 desc
--As expected it is Classic car.

--Which Country bought the most train?
select distinct Country,quantityordered
from sales
WHERE PRODUCTLINE = 'Trains'
order by quantityordered desc LIMIT 1
--USA bought the most trains.