{{ config(materialized='view') }}

select na.code, mu.name, max(na.nav_date) as lastdate , min(na.nav_date) as firstdate 
from "ANALYTICS"."MAINASSIGNEMT"."navhistory" na, "ANALYTICS"."MAINASSIGNEMT"."mutualfund" mu 
where year(nav_date) = 2018 and na.code=mu.code group by na.code, mu.name 
