SELECT
  {{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as skorders,
  o.orderid,
  o.orderdate,
  o.shipdate,
  o.shipmode,
  o.ordersellingprice - o.ordercostprice AS orderprofit,
  o.ordersellingprice,
  o.ordercostprice,
  c.customerid,
  c.customername,
  c.segment,
  c.country,
  p.category,
  p.productid,
  p.productname,
  p.subcategory,
  {{ markup ('ordersellingprice','ordercostprice') }} as markup,
  d.delivery_team
FROM {{ ref('raw_orders') }} AS o
LEFT JOIN {{ ref('raw_customer') }} AS c 
  ON o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} AS p
  ON o.productid = p.productid
left JOIN {{ ref('delivery_team') }} as d
 on o.shipmode = d.shipmode 

