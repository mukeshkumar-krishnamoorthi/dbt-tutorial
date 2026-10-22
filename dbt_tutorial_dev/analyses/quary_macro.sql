SELECT
    sales_id,
    {{ multiply('quantity', 'unit_price') }} AS total_amount
FROM {{ ref("bronze_sales") }}