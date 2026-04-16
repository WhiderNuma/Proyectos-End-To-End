## 02. Auditoría de Calidad y Diagnóstico de Anomalías (Sanity Check)

**Contexto del Negocio:** Con el ecosistema mapeado, el siguiente paso fue aislar exclusivamente las tablas que impactan en la rentabilidad logística: transacciones (`items`), especificaciones físicas (`product`) y el flujo de compras (`orders`). Ejecutar modelos financieros sobre datos crudos sin auditar conlleva el riesgo de generar falsos positivos (*Garbage In, Garbage Out*).

* **El Escáner de Integridad (`02_perfilado_anomalias.sql`):** Se desarrolló un script de diagnóstico preventivo (*Data Profiling*) para someter las variables críticas a una prueba de estrés antes de la extracción final. Mediante funciones de agregación condicional (`COUNTIF`), se obtuvieron los siguientes resultados exactos:
  * **Tabla `items` (Eje Financiero):** 100% de integridad. 0 nulos o valores inválidos en precios y tarifas de flete.
  * **Tabla `orders` (Eje Transaccional):** 100% de integridad. 0 errores o duplicados en el registro de órdenes.
  * **Tabla `product` (Eje Físico/Categórico):** Se detectaron anomalías específicas: 610 productos sin categoría asignada, 2 nulos en gramaje y 4 registros con pesos inválidos (cero o negativo).

**Valor Estratégico:** Conocer estos resultados fue determinante. El hallazgo de esos errores aislados en la tabla de productos dictó exactamente qué filtros de exclusión (`WHERE`) debían aplicarse en el paso siguiente. Esto garantiza que cada dólar reportado como "pérdida" en la auditoría final sea consecuencia de un problema real del negocio (asimetría entre flete y comisión) y no un sesgo provocado por 616 filas de datos corruptos.