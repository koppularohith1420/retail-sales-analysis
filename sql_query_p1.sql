1. ##Write a SQL query to retrieve all columns for sales made on '2022-11-05**:

select * from retail_sales
where sale_date='2022-11-05';

2. ##Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
SELECT 
   *
FROM
    retail_sales
WHERE
    category = 'clothing' 
    AND 
    (sale_date , 'yyyy-mm') = '2022-11'
    AND 
    quantity >= 4
       
        
	
SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4
    
    
 ##Write a SQL query to calculate the total sales (total_sale) for each category.**:
 select category,sum(total_sale) as total_sale from retail_sales
 group by category;
 
 
 4. ##Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
 select cast(avg(age) as decimal (10,2)) from retail_sales
 where category= 'beauty'
 
 
 5. ##Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
 select * from retail_sales
 where total_sale>1000
 
 6. ##Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
 select gender,category,count(transactions_id) from retail_sales
 group by gender,category
 
 7. ##Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:

 
 select year(sale_date),
 month(sale_date),
 avg(total_sale) as avg_sale,
 RANK() OVER( partition by year(sale_date) order by avg(total_sale) desc )
 from retail_sales
 group by year(sale_date),month(sale_date);
 
select year(sale_date),
 month(sale_date),
 avg(total_sale) as avg_sale
 from retail_sales
 group by year(sale_date),month(sale_date)
 order by year(sale_date),avg_sale desc limit 1;
 
 
 
 8. ##Write a SQL query to find the top 5 customers based on the highest total sales **:
 select customer_id,sum(Total_sale) as total_sale 
 from retail_sales
 group by customer_id 
 order by total_sale desc limit 5
 
 9. #Write a SQL query to find the number of unique customers who purchased items from each category.**:
 select category,count(distinct(customer_id) )as customers
 from retail_sales
 group by category;
 
 10. ##Write a SQL query to create each shift and number of orders (Example Morning <12, 
 ##Afternoon Between 12 & 17, Evening >17)**:
 
 with hourly_sales as
 (
 select *,
case
 when hour(sale_time)<12 then 'morning'
 when hour(sale_time) between 12 and 17 then 'afternoon'
 else 'evening'
 end as shift
 from retail_sales
 )
 SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sales
GROUP BY shift
 


 
 
 
 

 

 


 


 

 
 
 
 