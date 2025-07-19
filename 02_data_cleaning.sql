WITH median_and_cleaned_products AS (
    SELECT product_id,

        -- Limpieza de product_type: Estandariza y reemplaza nulos con 'Unknown'
        CASE 
            WHEN LOWER(TRIM(product_type)) IN ('produce', 'meat', 'dairy', 'bakery', 'snacks') THEN INITCAP(LOWER(TRIM(product_type)))
            ELSE 'Unknown'
        END AS product_type_cleaned,

        -- Limpieza de brand: Reemplaza nulos o valores inválidos con 'Unknown'
        CASE 
            WHEN TRIM(LOWER(brand)) IN ('', 'unknown', 'null', '-', 'missing') OR brand IS NULL THEN 'Unknown'
            ELSE TRIM(brand)
        END AS brand_cleaned,

        -- Limpieza de weight: Elimina ' grams', convierte a NUMERIC, reemplaza nulos/invalidos con la mediana, redondea a 2 decimales
        ROUND(
            COALESCE(
                NULLIF(
                    CAST(NULLIF(REPLACE(LOWER(TRIM(weight)), ' grams', ''), '') AS NUMERIC),
                    0
                ),
                (
                    SELECT PERCENTILE_CONT(0.5)
                    WITHIN GROUP (
                        ORDER BY CAST(REPLACE(LOWER(TRIM(weight)), ' grams', '') AS NUMERIC)
                    )
                    FROM products
                    WHERE TRIM(LOWER(weight)) NOT IN ('', '-', 'null', 'missing') AND weight IS NOT NULL
                )
            )::NUMERIC,
            2
        ) AS weight_cleaned,

        -- Limpieza de price: Reemplaza nulos o 0 con la mediana, redondea a 2 decimales
        ROUND(
            COALESCE(
                NULLIF(price, 0),
                (
                    SELECT PERCENTILE_CONT(0.5)
                    WITHIN GROUP (ORDER BY price)
                    FROM products
                    WHERE price IS NOT NULL AND price != 0
                )
            )::NUMERIC,
            2
        ) AS price_cleaned,

        -- Limpieza de average_units_sold: Convierte a INTEGER y reemplaza nulos con 0
        COALESCE(average_units_sold, 0) AS average_units_sold_cleaned,

        -- Limpieza de year_added: Reemplaza nulos con 2022
        COALESCE(year_added, 2022) AS year_added_cleaned,

        -- Limpieza de stock_location: Estandariza y reemplaza nulos/inválidos con 'Unknown'
        CASE
            WHEN UPPER(TRIM(stock_location)) IN ('A', 'B', 'C', 'D') THEN UPPER(TRIM(stock_location))
            ELSE 'Unknown'
        END AS stock_location_cleaned

    FROM products
)
-- Selección de columnas limpias
SELECT product_id,
    product_type_cleaned AS product_type,
    brand_cleaned AS brand,
    weight_cleaned AS weight,
    price_cleaned AS price,
    average_units_sold_cleaned AS average_units_sold,
    year_added_cleaned AS year_added,
    stock_location_cleaned AS stock_location
FROM median_and_cleaned_products;