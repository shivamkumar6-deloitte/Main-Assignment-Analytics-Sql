select q2.code, q1.name ,  (q1.lastNav - q2.firstNav) as Performance  from
(select  na.code,y.name, na.nav as lastNav  from {{ ref('liquid') }} y, "ANALYTICS"."MAINASSIGNEMT"."navhistory" na where na.nav_date = y.lastdate and y.code = na.code) q1 inner join 
(select  na.code,y.name, na.nav as FirstNav  from {{ ref('liquid') }} y, "ANALYTICS"."MAINASSIGNEMT"."navhistory" na where na.nav_date = y.firstdate and y.code = na.code) q2 on (q1.code = q2.code);  
