
select  code,avg(nav) as MonthlyNav,avg(repurchase_price) as repurchase_average, avg(sale_price) as sale_average  
from "ANALYTICS"."MAINASSIGNEMT"."navhistory"  
group by code, EXTRACT( MONTH FROM nav_date)  
