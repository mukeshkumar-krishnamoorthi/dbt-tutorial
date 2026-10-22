WITH sales AS (
    SELECT 
        sales_id,
        date_sk,
        store_sk,
        product_sk,
        customer_sk,
        {{ multiply('quantity', 'unit_price') }} AS calculated_gross_amount,
        payment_method
    FROM {{ ref('bronze_sales') }}
),

product AS (
    SELECT
        product_sk,
        category
    FROM {{ ref('bronze_product') }}
),

customer AS (
    SELECT
        customer_sk,
        gender
    FROM {{ ref("bronze_customer") }}
)

SELECT
    p.category,
    c.gender,
    SUM(s.calculated_gross_amount) AS total_gross_amount
FROM sales s
JOIN product p ON s.product_sk = p.product_sk
JOIN customer c ON s.customer_sk = c.customer_sk
GROUP BY c.gender, p.category
ORDER BY SUM(s.calculated_gross_amount) DESC;