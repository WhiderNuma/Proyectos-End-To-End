## 01. Fase de Mapeo Seguro y Descubrimiento de Datos (Data Discovery)

**Contexto del Negocio:** El proyecto inicia con un ecosistema de datos crudos compuesto por 9 tablas transaccionales masivas (clientes, geolocalización, pagos, productos, órdenes, reseñas, vendedores, ítems y traducciones). 

En lugar de realizar extracciones directas (`SELECT *`) que consumen recursos computacionales innecesarios y exponen información sensible en etapas tempranas, la primera fase consistió en un mapeo de metadatos. Este enfoque arquitectónico permite entender el terreno antes de operar.

* **El Motor de Extracción (`01_mapeo_metadatos.sql`):** Se desarrolló una consulta orientada a la vista interna del motor de base de datos (`INFORMATION_SCHEMA.COLUMNS`). Esta instrucción escanea las 9 tablas simultáneamente para extraer exclusivamente sus "planos estructurales" (nombres de tablas, nombres de columnas y tipos de datos), garantizando cero exposición a Información de Identificación Personal (PII) de los clientes reales.

* **El Diccionario de Datos (`01_esquema_raw.csv`):** El resultado de la consulta SQL generó un archivo plano que actúa como el Diccionario de Datos unificado del ecosistema. Este documento es vital para la planificación estratégica, ya que permite:
  * Identificar las llaves primarias y foráneas para orquestar los cruces (`JOINs`) futuros.
  * Validar tipados críticos sin tocar la base productiva (ej. confirmar que `freight_value` y `price` operan como `FLOAT64` y las fechas como `TIMESTAMP`).

**Valor Estratégico:** Esta aproximación (*Secure-First*) reduce los costos de procesamiento en entornos Cloud, mitiga riesgos de seguridad y establece una base documentada y confiable antes de inyectar cualquier regla de negocio o cálculo financiero.