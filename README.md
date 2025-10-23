# FoodYum — Análisis de precios por tipo de producto

Descripcion general
- FoodYum es una cadena de supermercados con sede en Estados Unidos que comercializa una amplia variedad de productos: frutas y verduras, carne, lácteos, productos horneados, snacks y otros alimentos básicos del hogar.
- Con el aumento de los precios de los alimentos, FoodYum busca mantener un inventario equilibrado que cubra distintas categorías y rangos de precios, asegurando opciones accesibles para todos los segmentos de clientes.

Objetivo del análisis
analizar la distribución de precios dentro de cada tipo de producto y detectar posibles oportunidades para:
· Mantener un rango de precios adecuado en todas las categorías.
· Identificar productos fuera de rango (outliers).
· Evaluar diferencias entre las medianas y los cuartiles por tipo de producto.

Datos utilizados
El dataset incluye información sobre productos y precios, con las siguientes variables relevantes:
· product_type: categoría del producto (Meat, Dairy, Bakery, Produce, Snacks).
· price: precio individual del producto.
Durante el análisis se realizaron tareas de limpieza y transformación:
· Reemplazo de valores faltantes (NULL) por la moda o mediana.
· Estandarización de categorías.

# Analisis complementario

Este análisis se desarrolló de manera independiente al flujo principal del proyecto, con el fin de profundizar en la relación entre precios y ventas por tipo de producto.
- Precio promedio y ventas:
· Meat y Dairy tienen los precios más altos y mayores ventas promedio, indicando una fuerte rotación incluso con valores elevados.
· Snacks y Produce son los más accesibles y presentan ventas moderadas.
- Correlación negativa entre precio y ventas:
· Todas las categorías presentan correlaciones negativas, lo que indica que al aumentar el precio, las ventas tienden a disminuir.
· Dairy y Bakery muestran mayor sensibilidad al precio (correlación cercana a -0.65), mientras que Snacks es la categoría menos afectada (-0.43).

* Estrategias sugeridas:
· Mantener un rango de precios variado dentro de cada categoría.
· Ajustar precios de Dairy y Bakery para evitar caídas de ventas.
· Promocionar Snacks y Meat como productos con menor elasticidad de demanda.
