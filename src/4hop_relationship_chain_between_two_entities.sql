SELECT 
n1.entity_id
,n1.entity_type
,n1.entity_value
,reln1.predicate
,n2.entity_id
,n2.entity_type
,n2.entity_value
,reln2.predicate
,n3.entity_id
,n3.entity_type
,n3.entity_value
,reln3.predicate
 FROM 
combine_nodeview  n1
,combine_relation_edgeview reln1
,combine_nodeview  n2
,combine_relation_edgeview reln2
,combine_nodeview  n3
,combine_relation_edgeview reln3
,combine_nodeview  n4
 WHERE 
  n1.entity_id=reln1.from_id
 and reln1.to_id=n2.entity_id
 and n2.entity_id=reln2.from_id
 and reln2.to_id=n3.entity_id
 and n3.entity_id=reln3.from_id
 and reln3.to_id=n4.entity_id
 and reln2.to_id<>n1.entity_id
 and reln3.to_id<>n1.entity_id
 and reln3.to_id<>n2.entity_id
 and n1.entity_id='customer:c1'
 and n4.entity_id='address:a2'
ORDER BY  n1.entity_id,n1.entity_type,n1.entity_value