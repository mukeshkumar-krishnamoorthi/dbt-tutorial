WITH dedup_query AS (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY id ORDER BY updated_at DESC) AS deduplication_id
    FROM {{ source('source', 'items') }}
)
SELECT 
    id,
    name,
    category,
    created_at,
    updated_at
FROM dedup_query
WHERE deduplication_id = 1