select code, max(nav_date) as maximum from "ANALYTICS"."MAINASSIGNEMT"."navhistory" group by code
having max(nav_date) < (select max(nav_date) as maximum from "ANALYTICS"."MAINASSIGNEMT"."navhistory" where year(nav_date)=2018)  
  