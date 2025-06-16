SELECT
n1.entity_id from_entity_id1
,n1.entity_type from_entity_type1
,n1.entity_value from_entity_value1
,reln1.predicate Relationship1
,n2.entity_id to_entity_id2
,n2.entity_type to_entity_type2
,n2.entity_value to_entity_value2
,reln2.predicate Relationship3
,n3.entity_id to_entity_id3
,n3.entity_type to_entity_type3
,n3.entity_value to_entity_value3
FROM
combine_nodeview n1
,combine_relation_edgeview reln1
,combine_nodeview n2
,combine_relation_edgeview reln2
,combine_nodeview n3
WHERE
 n1.entity_id =reln1.from_id
 and reln1.to_id = n2.entity_id
 and n2.entity_id= reln2.from_id
 and reln2.to_id = n3.entity_id
 and reln2.to_id<>n1.entity_id
 and n1.entity_id='customer:c1'
--and n3.entity_id='address:a1'
 and n3.entity_id='product_type:p1'