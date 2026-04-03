create table zepto_v3(
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
	sku_id int PRIMARY KEY,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock varchar(120),
    quantity INTEGER
);
#Data exploration
## count of rows validation
select count(*) from zepto_v3;

##sample data 
select * from zepto_v3;

##null lookup
select * from zepto_v3
where Category is null
or
name is null
or
SKUid is null
or
mrp is null
or
discountPercent  is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;


##duplicate name (product)
select name, count(skuid) as 'number of skus'
from zepto_v3
group by name
having count(skuid)>1
order by count(skuid) desc;

##data cleaning
##product with price =0

select * from zepto_v3
where mrp=0 or discountedSellingPrice =0;

##deleting the rows with 0 values
SET SQL_SAFE_UPDATES = 0;
delete from zepto_v3
where  mrp=0;

##convert paise to rupees
update zepto_v3
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

## column rename
alter table zepto_v3
rename column `product-id` to `SKUid`;

##--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v3
ORDER BY discountPercent DESC
LIMIT 10;

##--Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp
FROM zepto_v3
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

##--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v3
GROUP BY category with rollup
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v3
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v3
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_v3
WHERE weightInGms >= 100
ORDER BY price_per_gram desc;

##--Q7.Group the products into categories like Low, Medium, high.

select name,weightInGms,
case 
when weightInGms  <1000 then 'low'
when weightInGms  <5000 then 'medium'
else 'High'
end as weight_category
from zepto_v3
order by weight_category;

##--8.What is the Total Inventory Weight Per Category 

select Category,
sum(weightInGms*availableQuantity) as Total_Inventory_Weight
from zepto_v3
group by Category
order by Total_Inventory_Weight desc;

##Q9.list diff product categories

select distinct category from zepto_v3
order by Category;

##Q10. number of categories available

SELECT COUNT(DISTINCT category) 
FROM zepto_v3;

##Q11.product in vs out stoct
select outofstock,count(skuid)
from zepto_v3
group by outofstock;
























