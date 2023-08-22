
select 
ord.order_id,
concat(cus.first_name,'',cus.last_name) as 'Customer',
cus.city,
cus.state,
ord.order_date,
SUM(ite.quantity) as 'Total_units',
SUM(ite.quantity*ite.list_price) as 'Revenue',
pro.product_name,
cat.category_name,
sto.store_name,
bra.brand_name,
concat(sta.first_name,'',sta.last_name) as 'sales_rep'
from sales.orders ord
join sales.customers cus
ON ord.customer_id= cus.customer_id
join sales.order_items ite
on ord.order_id= ite.order_id
join production.products pro
on ite.product_id=pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sto
on ord.store_id= sto.store_id
join sales.staffs sta
on ord.staff_id= sta.staff_id
join production.brands bra
on bra.brand_id = pro.brand_id
group by 
ord.order_id,
concat(cus.first_name,'',cus.last_name) ,
cus.city,
cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
bra.brand_name,
concat(sta.first_name,'',sta.last_name)
;


select* from sales.orders
select* from production.products