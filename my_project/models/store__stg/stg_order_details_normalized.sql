with details as (
  select
    orders.order_date
    , details.quantity
    , details.price
    , brands.name as brand_name
    , products.name as product_name
    , orders.customer_phone
    , {{ normalize_phone_number ('orders.customer_phone') }} as normalized_customer_phone
  from {{ source ('store', 'orders')}} as orders
  left join {{ source ('store', 'order_details') }} as details
    on orders.order_id = details.order_id
  left join {{ source ('store', 'products') }} as products
    on details.product_id = products.product_id
  left join {{ source ('store', 'brands') }} as brands
    on brands.brand_id = products.brand_id
)
select
  *
  , case
      when normalized_customer_phone like '62%' then 'Indonesia'
      when normalized_customer_phone like '91%' then'India'
  end as country
from details
