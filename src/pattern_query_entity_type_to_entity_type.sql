SELECT
n1.entity_type from_entity_type
,n1.entity_value from_entity_value
,reln1.predicate Relationship
,n2.entity_type to_entity_type
,n2.entity_value to_entity_value
FROM 
combine_nodeview n1
,combine_relation_edgeview reln1
,combine_nodeview n2 
WHERE 
reln1.from_id = n1.entity_id 
 and reln1.to_id = n2.entity_id 
 and n1.entity_type='sales_order'
 and n2.entity_type='customer'	
order by from_entity_type,from_entity_value,to_entity_type,to_entity_value;