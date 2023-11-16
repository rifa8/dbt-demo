select
   orders.order_date
   , details.quantity
   , details.price
   , brands.name as brand_name
   , products.name as product_name
from {{ source ('store', 'orders')}} as orders
left join {{ source ('store', 'order_details') }} as details
   on orders.order_id = details.order_id
left join {{ source ('store', 'products') }} as products
   on details.product_id = products.product_id
left join {{ source ('store', 'brands') }} as brands
   on brands.brand_id = products.brand_id
