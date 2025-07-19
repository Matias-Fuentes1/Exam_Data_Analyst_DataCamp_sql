-- Write your query for task 3 in this cell
WITH median_and_cleaned_products AS (
    SELECT product_id,
        
        -- Limpieza de product_type: Estandariza y reemplaza nulos con 'Unknown'
        CASE
            WHEN LOWER(TRIM(product_type)) = 'produce' THEN 'Produce'
            WHEN LOWER(TRIM(product_type)) = 'meat' THEN 'Meat'
            WHEN LOWER(TRIM(product_type)) = 'dairy' THEN 'Dairy'
            WHEN LOWER(TRIM(product_type)) = 'bakery' THEN 'Bakery'
            WHEN LOWER(TRIM(product_type)) = 'snacks' THEN 'Snacks'
            ELSE 'Unknown'
        END AS product_type_cleaned, 

        -- Limpieza de brand: Reemplaza nulos con 'Unknown'
        COALESCE(TRIM(brand), 'Unknown') AS brand_cleaned, 

        -- Limpieza de weight: Elimina ' grams', convierte a NUMERIC, reemplaza nulos con la mediana, y redondea a 2 decimales
        ROUND(
            CAST(
                COALESCE(
                    CAST(REPLACE(LOWER(TRIM(weight)), ' grams', '') AS NUMERIC),
                    (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CAST(REPLACE(LOWER(TRIM(weight)), ' grams', '') AS NUMERIC)) FROM products)
                ) AS NUMERIC
            ), 2
        ) AS weight_cleaned, --

        -- Limpieza de price: Reemplaza nulos con la mediana, y redondea a 2 decimales
        ROUND(
            CAST(
                COALESCE(
                    price,
                    (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) FROM products)
                ) AS NUMERIC
            ), 2
        ) AS price_cleaned, --

        -- Limpieza de average_units_sold: Convierte a INTEGER y reemplaza nulos con 0
        COALESCE(CAST(average_units_sold AS INTEGER), 0) AS average_units_sold_cleaned, --

        -- Limpieza de year_added: Reemplaza nulos con 2022
        COALESCE(year_added, 2022) AS year_added_cleaned, --

        -- Limpieza de stock_location: Estandariza a mayúsculas y reemplaza nulos/inválidos con 'Unknown'
        CASE
            WHEN UPPER(TRIM(stock_location)) IN ('A', 'B', 'C', 'D') THEN UPPER(TRIM(stock_location))
            ELSE 'Unknown'
        END AS stock_location_cleaned --
    FROM products
)
SELECT product_type_cleaned AS product_type, -- Renombrar a 'product_type' para la salida final
    MIN(price_cleaned) AS min_price,      -- Columna 'min_price'
    MAX(price_cleaned) AS max_price       -- Columna 'max_price'
FROM median_and_cleaned_products
GROUP BY product_type_cleaned;