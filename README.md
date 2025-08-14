# Analisis de Productos (SQL)
Proyecto final de SQL centrado en la limpieza de datos y el análisis exploratorio de la información de productos minoristas.
-- ¿Que hay dentro?
Su estructura se basa en 4 pasos:
1. 🧩Detección de datos faltantes**
Determine la cantidad de productos que carecen del campo `year_added`, marca de tiempo esencial en cualquier conjunto de datos minoristas.
2. 🧹Limpieza de datos**
 Uso de **CTE** y funciones SQL (`COALESCE`, `PERCENTILE_CONT`, `CASE`) para:
   - Estandarizar `product_type` y `brand`.
   - Corregir inconsistencias.
   - Limpiar y normalizar nombres, precios y otros campos.
3. 📊Rango de precios por tipo de producto**
Para comprender el rango de precios y los valores atípicos, observe los precios más bajos y más altos agrupados por tipo de producto.
4. 🔍 Filtrado por productos destacados**
Filtrado específico para **Carne** y **Lácteos**, con ventas promedio altas, ideal para campañas de marketing e inventario.


