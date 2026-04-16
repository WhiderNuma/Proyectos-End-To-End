# 🚀 Proyecto: Diagnóstico de Rentabilidad y Fuga de Capital (E-commerce)

## 🎯 El Desafío de Negocio (Contexto)
Este proyecto surge ante una alerta crítica de la gerencia: la facturación de la empresa está en niveles récord, pero la ganancia neta no se ve reflejada en el flujo de caja. Se sospecha que la compañía está "comprando trabajo", perdiendo capital en cada venta debido a la falta de control sobre las comisiones del marketplace y los costos logísticos de productos pesados.

> **La Pregunta del Jefe:**
> *"Necesito que encuentres la fuga. Quiero saber qué productos nos están desangrando, en qué regiones el costo logístico nos mata el margen y dónde tenemos que dejar de invertir mañana mismo para dejar de perder capital. No me traigas reportes de cuánto vendimos; traeme la respuesta de dónde está la plata."*

---

## 🛠️ Metodología Aplicada: "Precision-First"
Para resolver este problema de manera profesional y segura, implementé una metodología de 5 pasos diseñada para entornos corporativos de alto nivel:

1.  **Desglose del Problema:** Traducción de la inquietud humana a una fórmula financiera operativa: $Ganancia = Precio - (Comisión + Flete)$, condicionada por la volumetría del producto.
2.  **Mapeo Seguro del Esquema:** En lugar de manipular bases de datos completas, utilicé consultas a `INFORMATION_SCHEMA.COLUMNS` para extraer el "esqueleto" técnico (metadatos) sin comprometer datos sensibles de clientes.
3.  **Búsqueda Asistida (Semántica):** Uso de IA como buscador semántico para identificar qué tablas y columnas exactas (ej. `freight_value`, `price`) contenían la información necesaria, descartando el "ruido" de tablas irrelevantes.
4.  **Perfilado de Datos (El Escáner):** Antes de la extracción, realicé un diagnóstico de anomalías mediante funciones de agregación para descubrir datos corruptos, como productos sin categoría o pesos inválidos.
5.  **Limpieza en Tránsito y Extracción Gold:** Creación del "Dataset Oro". La limpieza ocurrió durante la consulta SQL, filtrando errores y aplicando la lógica de negocio (comisión del 15% y cálculo de margen neto) para alimentar directamente la capa de visualización.

---

## 📂 Estructura del Repositorio
Los archivos están organizados cronológicamente según el flujo del dato, partiendo desde la fuente primaria:

* **`Olist_Raw_Data.zip`**: Carpeta original comprimida que contiene todos los archivos del dataset íntegro y sin procesar.
* **`01- Exploration`**: Extracción inicial del esquema técnico para entender las relaciones entre tablas (Customers, Orders, Items, Products, etc.).
* **`02- Cleaning`**: Script de auditoría que detectó 610 productos sin categoría y registros con pesos inválidos que afectaban el cálculo logístico.
* **`03- Modeling`**: Motor lógico del proyecto. Calcula el margen neto real restando la comisión de plataforma y el costo de flete e incluye el dataset refinado para la toma de decisiones.
* **`04- Tableu`**: Capa de Visualización Estratégica en Tableau. Un tablero interactivo diseñado para identificar mapas de calor de pérdidas y el punto de quiebre financiero.

---

## 💡 Valor Estratégico y Resultados
Este pipeline de análisis permite a la gerencia pasar de la sospecha a la acción proactiva. A través del dashboard generado, se pueden identificar instantáneamente las "zonas rojas" donde el costo de envío supera el precio de venta, permitiendo decidir en segundos en qué regiones suspender promociones de envío gratis o dónde renegociar contratos logísticos.

**Este proyecto demuestra mi capacidad para transformar datos crudos en un diagnóstico financiero accionable que impacta directamente en el EBITDA de la compañía.**