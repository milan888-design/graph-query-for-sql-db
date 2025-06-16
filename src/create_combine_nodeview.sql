CREATE OR REPLACE VIEW public.combine_nodeview_test  AS
SELECT 'sales_order' || ':' ||cast(sales_order.order_id as text) AS entity_id,'sales_order' AS entity_type,sales_order.description AS entity_value FROM sales_order
  UNION 
SELECT 'address' || ':' ||cast(address.address_id as text) AS entity_id,'address' AS entity_type,address.address AS entity_value FROM address
  UNION 
SELECT 'order_type' || ':' ||cast(order_type.order_type as text) AS entity_id,'order_type' AS entity_type,order_type.order_type AS entity_value FROM order_type
  UNION 
SELECT 'customer' || ':' ||cast(customer.customer_id as text) AS entity_id,'customer' AS entity_type,customer.customer_name AS entity_value FROM customer
  UNION 
SELECT 'product_type' || ':' ||cast(product_type.product_type_id as text) AS entity_id,'product_type' AS entity_type,product_type.product_type_name AS entity_value FROM product_type
  UNION 
SELECT 'sales_order_shipto_address' || ':' ||cast(sales_order_shipto_address.id as text) AS entity_id,'sales_order_shipto_address' AS entity_type,sales_order_shipto_address.id AS entity_value FROM sales_order_shipto_address
 ;