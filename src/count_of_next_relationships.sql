SELECT
n1.entity_id from_entity_id
,n1.entity_type from_entity_type
,n1.entity_value from_entity_value
,sum(1) nextstepcount
FROM 
combine_nodeview n1
,combine_relation_edgeview reln1
,combine_nodeview n2 
WHERE 
reln1.from_id = n1.entity_id 
 and reln1.to_id = n2.entity_id 
 and n1.entity_id='sales_order:ord1'
group by n1.entity_id,n1.entity_type,n1.entity_value;
