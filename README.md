# Coordinación Horaria

App para coordinar horarios entre conservatorios de música/danza y centros de enseñanza general (CEIP/IES).

Funciona como **un único archivo HTML** que se abre en el navegador. No requiere instalación, servidor ni conexión a internet (salvo la primera carga para las librerías CDN).

---

## Cómo empezar

### 1. Descargar la app

Ve a la [última release en GitHub](https://github.com/JLMirallesB/CoordinacionHoraria/releases/latest) y descarga el archivo **`index.html`**. Guárdalo donde quieras en tu ordenador.

### 2. Descargar el Excel de ejemplo

En la misma release encontrarás el archivo **`ejemplo_coordinacion.xlsx`**. Descárgalo para probar la app antes de usar tus propios datos.

### 3. Abrir la app

Haz doble clic en `index.html`. Se abrirá en tu navegador (Chrome, Firefox, Edge, Safari...). Verás la pantalla de inicio con la zona para subir el Excel.

### 4. Cargar el Excel

Arrastra el archivo Excel sobre la zona de subida o haz clic en "Seleccionar archivo" para buscarlo en tu ordenador. Los datos se procesan localmente en tu navegador — **no se envían a ningún servidor**.

---

## Cómo preparar tu propio Excel

El Excel debe tener **tres hojas** (los nombres deben contener estas palabras):

### Hoja "Centros"

Datos de los centros de enseñanza general coordinados. Columnas:

| Columna | Descripción | Ejemplo |
|---------|-------------|---------|
| Tipo | CEIP o IES | CEIP |
| Denominación | Nombre completo del centro | CEIP San José |
| Distancia (km) | Distancia al conservatorio | 0.8 |
| Distancia (min a pie) | Tiempo a pie | 10 |
| Mail contacto | Email general del centro | centro@edu.gva.es |
| Director/a | Nombre del/la director/a | Ana López |
| Mail director/a | Email del/la director/a | ana@edu.gva.es |
| Jefe/a estudios | Nombre del/la jefe/a de estudios | Pedro García |
| Mail jefatura | Email de jefatura | pedro@edu.gva.es |
| Coordinador/a | Nombre del/la coordinador/a | María Ruiz |
| Mail coordinador/a | Email del/la coordinador/a | maria@edu.gva.es |

### Hoja "Conservatorios"

Datos de los conservatorios. Columnas:

| Columna | Descripción | Ejemplo |
|---------|-------------|---------|
| Denominación | Nombre del conservatorio | Conservatorio Municipal de Música |
| Distancia (km) | Distancia al centro ERG | 1.2 |
| Distancia (min a pie) | Tiempo a pie | 15 |
| Mail contacto | Email general | info@conservatorio.es |
| Director/a | Nombre | Alberto Roca |
| Mail director/a | Email | a.roca@conservatorio.es |
| Jefe/a estudios | Nombre | Pilar Esteve |
| Mail jefatura | Email | p.esteve@conservatorio.es |
| Coordinador/a | Nombre | Mª Carmen Bellés |
| Mail coordinador/a | Email | mc.belles@conservatorio.es |

### Hoja "Alumnado"

Listado completo del alumnado. Columnas:

| Columna | Descripción | Ejemplo |
|---------|-------------|---------|
| NIA | Número de identificación del alumno/a | 10000001 |
| Apellidos | Apellidos | García López |
| Nombre | Nombre | Juan |
| Centro ERG | Nombre del centro (debe coincidir con la hoja Centros) | CEIP San José |
| Conservatorio | Nombre del conservatorio (debe coincidir con la hoja Conservatorios) | Conservatorio Municipal de Música |
| Curso Conservatorio | Curso en el conservatorio | 2º EEM |
| Especialidad | Instrumento o especialidad | Piano |
| Curso ERG | Curso en el centro de enseñanza general | 4º Primaria |
| Modalidad/Turno | Modalidad y turno | Ordinaria/Mañana |
| Tutor/a Conservatorio | Nombre del tutor/a en el conservatorio | Francisco Pérez |
| Mail tutor/a Conservatorio | Email del tutor/a del conservatorio | f.perez@conservatorio.es |
| Tutor/a ERG | Nombre del tutor/a en el CEIP/IES | Roberto Ibáñez |
| Mail tutor/a ERG | Email del tutor/a del CEIP/IES | r.ibanez@edu.gva.es |
| Observaciones | Notas relevantes (opcional) | Solicita adaptación horaria |

**Importante:** Los valores de "Centro ERG" y "Conservatorio" en la hoja de Alumnado deben coincidir exactamente con los de "Denominación" en las hojas de Centros y Conservatorios.

### Cursos válidos del conservatorio

| Conservatorio | Equivalente ERG |
|---------------|-----------------|
| 1º EEM | 3º Primaria |
| 2º EEM | 4º Primaria |
| 3º EEM | 5º Primaria |
| 4º EEM | 6º Primaria |
| 1º EPM | 1º ESO |
| 2º EPM | 2º ESO |
| 3º EPM | 3º ESO |
| 4º EPM | 4º ESO |
| 5º EPM | 1º Bachillerato |
| 6º EPM | 2º Bachillerato |

---

## Funciones de la app

### Sistema de desfase

La app calcula automáticamente el desfase entre el curso del conservatorio y el curso real en el centro ERG:

- **Verde (0)**: el alumno/a está en el curso equivalente exacto
- **Amarillo (±1)**: desfase de un curso (leve)
- **Rojo (±2 o más)**: desfase de dos o más cursos (grande)

### Vistas

- **Vista Cards**: vista jerárquica con tarjetas colapsables. Centro/Conservatorio → Curso → Alumnos agrupados por desfase
- **Vista Tabla**: tabla plana con todos los alumnos, ordenable por cualquier columna haciendo clic en la cabecera

### Toggles de agrupación

- **Agrupar por**: Centro ERG (por defecto) o Conservatorio. Cambia qué aparece como tarjeta principal
- **Agrupar cursos por**: Curso Conservatorio (por defecto) o Curso ERG. Cambia cómo se organizan los alumnos dentro de cada tarjeta

### Filtros

6 filtros combinables que se aplican en ambas vistas:

1. **Tipo enseñanza**: EEM (Elemental) o EPM (Profesional)
2. **Curso Conservatorio**: filtrar por un curso concreto del conservatorio
3. **Curso ERG**: filtrar por un curso concreto del centro
4. **Especialidad**: filtrar por instrumento/especialidad
5. **Centro ERG**: filtrar por un centro concreto
6. **Conservatorio**: filtrar por un conservatorio concreto

### Buscador

Campo de búsqueda por nombre o NIA. Al escribir:

- Resalta en amarillo todos los resultados
- Auto-despliega las tarjetas y cursos donde están los resultados
- Flechas arriba/abajo o Enter para navegar entre resultados
- Escape o ✕ para limpiar

### Información de contacto

- **Botón "Info"** en cada centro y conservatorio: muestra datos de contacto (director/a, jefe/a de estudios, coordinador/a) con enlaces de email
- **Botón (i)** en cada alumno/a: muestra tutores del conservatorio y del centro ERG con emails, más observaciones si las hay. El icono se destaca en naranja si hay observaciones

### Email grupal

Botón ✉ en cada centro/conservatorio y en cada curso que abre el cliente de correo con todos los tutores de ese grupo como destinatarios.

### Exportar PDF

Botón "Exportar PDF" que genera un documento con todo el contenido visible (respetando los filtros activos). El PDF se genera en formato A4 horizontal.

---

## Autor

**José Luis Miralles Bono** — [www.jlmirall.es](https://www.jlmirall.es)

Blog: [El pulpo en el vaso](https://elpulpoenelvaso.jlmirall.es)

App creada con ayuda de Claude (Anthropic).

### Invítame a una horchata

Si esta app te resulta útil, puedes invitarme a una horchata en [ko-fi.com/miralles](https://ko-fi.com/miralles). ¡Gracias!

---

## Licencia

Este proyecto es software libre. Consulta el repositorio para más detalles.
