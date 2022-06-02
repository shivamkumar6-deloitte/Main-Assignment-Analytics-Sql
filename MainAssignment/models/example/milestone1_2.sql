select q1.code, q1.name, q1.maximumNav,q1.nav_date as Max,  q2.minimumNav ,q2.nav_date  from 
(select t2.code ,t2.name, t2.maximumNav , t1.nav_date from "ANALYTICS"."MAINASSIGNEMT"."navhistory" t1 ,
(select na.code ,mu.name, max(na.nav) as maximumNav  from "ANALYTICS"."MAINASSIGNEMT"."navhistory" na, "ANALYTICS"."MAINASSIGNEMT"."mutualfund" mu where na.code = mu.code group by  na.code, mu.name) t2 where t1.code =t2.code and t1.nav = t2.maximumNav ) q1
join
(select t2.code ,t2.name, t2.minimumNav , t1.nav_date from "ANALYTICS"."MAINASSIGNEMT"."navhistory" t1 ,
(select na.code ,mu.name, min(na.nav) as minimumNav  from "ANALYTICS"."MAINASSIGNEMT"."navhistory" na, "ANALYTICS"."MAINASSIGNEMT"."mutualfund" mu where na.code = mu.code group by  na.code, mu.name) t2 where t1.code =t2.code and t1.nav = t2.minimumNav ) q2 on q1.code = q2.code 
