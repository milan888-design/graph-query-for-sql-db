SELECT
n1.entity_id
,n1.entity_type
,n1.entity_value
,sum(1) count_from
FROM 
combine_nodeview n1
,combine_relation_edgeview reln1
,combine_nodeview n2 
WHERE 
reln1.from_id = n1.entity_id 
 and reln1.to_id = n2.entity_id 
 group by 
 n1.entity_id
,n1.entity_type
,n1.entity_value
 order by count_from desc