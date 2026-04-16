## 03. Motor de Rentabilidad y Generación del "Gold Record"

**Contexto del Negocio:** Una vez auditada la integridad de los datos, se procedió a la fase de ingeniería financiera. El objetivo fue transformar la hipótesis de "pérdida por logística" en una métrica auditable: el Margen Neto Real por transacción.

* **El Corazón del Pipeline (`03_extraccion_rentabilidad.sql`):** Se desarrolló una consulta de alta complejidad que consolida cuatro entidades transaccionales. La lógica de negocio se inyectó directamente en el motor SQL para maximizar la eficiencia:
  * **Cálculo de Margen:** Se implementó la fórmula `Margen = Precio - Flete - (Precio * 15%)`, capturando tanto el costo logístico como el costo financiero de la plataforma.
  * **Filtros de Calidad:** Se aplicaron exclusiones basadas en el perfilado previo (eliminación de nulos y pesos inválidos) para garantizar un resultado libre de sesgos técnicos.
  * **Segmentación Estratégica:** Mediante la cláusula `HAVING`, el sistema aísla exclusivamente los clústeres donde la rentabilidad es negativa, permitiendo un enfoque directo en la resolución de problemas (*Problem-Solving orientation*).

* **El Output Certificado (`03_dataset_gold.csv`):** El resultado es un "Gold Record" que resume la hemorragia financiera por categoría y estado de destino. Este dataset es el activo final que alimenta la capa de Business Intelligence, conteniendo métricas críticas como el peso promedio y el margen total perdido por cada segmento en crisis.

**Valor Estratégico:** Esta etapa representa la transición de "Datos" a "Insights". Al agrupar las pérdidas por geografía y volumetría, el pipeline entrega una hoja de ruta clara para que el departamento de logística renegocie tarifas o ajuste subsidios de envío en las regiones detectadas.