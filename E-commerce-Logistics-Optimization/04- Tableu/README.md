## 04. Capa de Visualización Estratégica y Storytelling

**Contexto del Negocio:** La fase final del pipeline consiste en la entrega de valor. Un dataset de 110,000 registros es inmanejable para la toma de decisiones si no se traduce a una interfaz visual que priorice los hallazgos críticos. Esta capa de Business Intelligence (BI) actúa como el puente entre el análisis técnico y la ejecución comercial.

* **El Dashboard de Auditoría (`04_dashboard_logistica.twb`):** Se desarrolló una visualización interactiva en Tableau conectada directamente al "Gold Record" generado en la fase anterior. El diseño se centró en tres pilares de decisión:
  * **Geolocalización de Pérdidas:** Un mapa de calor que identifica instantáneamente los estados de Brasil donde la logística es inviable para ciertas categorías.
  * **Análisis de Dispersión (Peso vs. Flete):** Gráficos que evidencian la correlación directa entre la volumetría del producto y la erosión del margen, permitiendo visualizar el punto de quiebre financiero.
  * **Ranking de Categorías Críticas:** Una vista jerárquica que expone las "zonas rojas" (ej. muebles de oficina o señalización) donde la comisión del marketplace sumada al flete supera el precio de venta.

**Valor Estratégico:** El dashboard no es solo un reporte de lo que pasó; es una herramienta de diagnóstico proactivo. Permite que la gerencia de logística o ventas pueda, con un solo clic, decidir en qué regiones suspender promociones de "envío gratis" o dónde renegociar contratos con transportistas, impactando directamente en el EBITDA de la compañía al eliminar operaciones de margen negativo.