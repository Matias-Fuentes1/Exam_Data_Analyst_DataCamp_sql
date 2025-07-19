# Analisis de Productos (SQL)
Proyecto final de SQL centrado en la limpieza de datos y el análisis exploratorio de la información de productos minoristas.
-- ¿Que hay dentro?
Su estructura se basa en 4 pasos:
1. 🧩Detección de datos faltantes**
Determine la cantidad de productos que carecen del campo `year_added`, marca de tiempo esencial en cualquier conjunto de datos minoristas.
2. 🧹Limpieza de datos**
Utilice CTE y funciones SQL como `COALESCE`, `PERCENTILE_CONT` y `CASE` para estandarizar `product_type`, corregir inconsistencias de `brand`, extraer y desinfectar pesos, precios y más.
3. 📊Rango de precios por tipo de producto**
Para comprender el rango de precios y los valores atípicos, observe los precios más bajos y más altos agrupados por tipo de producto.
4. 🔍 Filtrado por productos destacados**
Me enfoqué en productos de Carne y Lácteos con ventas promedio altas para apoyar marketing e inventario.


