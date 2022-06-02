select m.category_id,fc.category ,max(p.Performance) , min(p.Performance) 
from "ANALYTICS"."MAINASSIGNEMT"."mutualfund" m,"ANALYTICS"."MAINASSIGNEMT"."fundcategory" fc,
(select q2.code, q1.name ,  (q1.lastNav - q2.firstNav) as Performance  from
(select  na.code,y.name, na.nav as lastNav  from {{ ref('timespan') }} y, "ANALYTICS"."MAINASSIGNEMT"."navhistory" na where na.nav_date = y.lastdate and y.code = na.code) q1 inner join 
(select  na.code,y.name, na.nav as FirstNav  from {{ ref('timespan') }} y, "ANALYTICS"."MAINASSIGNEMT"."navhistory" na where na.nav_date = y.firstdate and y.code = na.code) q2 on (q1.code = q2.code)) p where p.code = m.code and fc.id = m.category_id group by m.category_id, fc.category 