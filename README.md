# Coordinación Horaria

App para coordinar horarios entre conservatorios de música/danza y centros de enseñanza general (CEIP/IES).

![Pantalla de inicio](screenshots/01-pantalla-inicio.png)

## Privacidad y seguridad

- **No se instala nada.** Es un único archivo HTML que se abre en el navegador.
- **Funciona sin conexión.** La app no descarga nada de internet: el lector de Excel viaja dentro del propio archivo HTML. Puedes desconectar la red y seguirá funcionando igual.
- **No se suben datos a internet.** Todo el procesamiento ocurre localmente en tu navegador. Ningún dato sale de tu ordenador.
- **No se almacenan datos.** La app no guarda nada: ni cookies, ni bases de datos, ni archivos temporales. Al cerrar el navegador, desaparece todo.
- **La app NO escribe en el Excel.** Solo lee los datos para mostrarlos de forma visual. Tu archivo Excel nunca se modifica.
- **Los datos están en tu Excel local.** Tú controlas dónde está el archivo y quién tiene acceso a él.

> Los filtros y la vista que tengas activos se guardan en la dirección del navegador (después de la `#`), para que puedas recargar o guardar el enlace. Eso ocurre solo en tu navegador: esa dirección no se envía a ningún sitio.

---

## Cómo empezar

### 1. Descargar la app

Ve a la [última release en GitHub](https://github.com/JLMirallesB/CoordinacionHoraria/releases/latest) y descarga el archivo **`index.html`**. Guárdalo donde quieras en tu ordenador.

### 2. Descargar el Excel de ejemplo

En la misma release encontrarás el archivo **`ejemplo_coordinacion.xlsx`**. Descárgalo para probar la app antes de usar tus propios datos.

### 3. Abrir la app

Haz doble clic en `index.html`. Se abrirá en tu navegador (Chrome, Firefox, Edge, Safari...). Verás la pantalla de inicio con la zona para subir el Excel.

El archivo ocupa unos 400 KB porque lleva dentro el lector de Excel. Gracias a eso no necesita conexión a internet.

### 4. Cargar el Excel

Arrastra el archivo Excel sobre la zona de subida o haz clic en "Seleccionar archivo" para buscarlo en tu ordenador.

El formato admitido es `.xlsx` (y `.xlsm`). Si tienes un `.xls` antiguo, ábrelo en Excel o LibreOffice y guárdalo como `.xlsx`.

Para cargar otro archivo después, usa el botón **"Cargar otro Excel"** de la barra de herramientas; no hace falta recargar la página.

![Vista general tras cargar el Excel](screenshots/02-vista-general.png)

---

## Cómo preparar tu propio Excel

Puedes partir del Excel de ejemplo y adaptarlo a tu centro. La app **solo lee** el archivo, nunca lo modifica, así que puedes editarlo con total tranquilidad en Excel, LibreOffice, Google Sheets, etc.

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

**Campos opcionales:** No es obligatorio rellenar los nombres y emails de tutores, miembros de equipo directivo, coordinadores ni las distancias. La app funciona sin ellos. Sin embargo, si quieres tener esa informacion a mano en el visor (botones "Info", datos de tutores, enlaces mailto grupales), se recomienda completarlos.

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
- **Gris (?)**: no se puede calcular porque algún curso está vacío o escrito de una forma que la app no reconoce. Estos alumnos **no** se cuentan como "curso equivalente": salen aparte y aparecen listados en el panel de revisión de datos

### Revisión de los datos

Al cargar el Excel, la app revisa los datos y avisa (sin bloquear nada) de lo que conviene mirar:

- NIA duplicados
- Alumnado con el curso o el centro sin rellenar
- Cursos de conservatorio o de ERG escritos de una forma no reconocida
- Centros o conservatorios que aparecen en Alumnado pero no en sus hojas correspondientes (se muestran igual, pero sin datos de contacto)
- Nombres que solo coinciden ignorando mayúsculas, acentos o espacios sobrantes (la app los agrupa juntos, pero conviene unificarlos)
- Alumnado sin NIA

Las filas completamente vacías del Excel se ignoran.

### Vista Cards

Vista jerárquica con tarjetas colapsables. Cada centro o conservatorio se muestra como una tarjeta que al expandir muestra los cursos, y dentro de cada curso los alumnos agrupados por desfase con fondo coloreado.

![Detalle de un centro expandido con cursos, desfases y datos de tutor](screenshots/03-detalle-centro.png)

### Vista Tabla

Tabla plana con todos los alumnos filtrados. Ordenable por cualquier columna haciendo clic en la cabecera (el NIA ordena como número y los cursos en su orden natural, no alfabético). Un segundo clic invierte el orden y la flecha indica en qué sentido está ordenada. Incluye columna de desfase coloreada e indicador de observaciones.

![Vista tabla con todos los alumnos](screenshots/04-vista-tabla.png)

### Toggles de agrupación

- **Agrupar por**: Centro ERG (por defecto) o Conservatorio. Cambia qué aparece como tarjeta principal.
- **Agrupar cursos por**: Curso Conservatorio (por defecto) o Curso ERG. Cambia cómo se organizan los alumnos dentro de cada tarjeta.

![Vista agrupada por conservatorio](screenshots/05-vista-conservatorio.png)

### Filtros

7 filtros combinables que se aplican en ambas vistas:

1. **Tipo enseñanza**: EEM (Elemental) o EPM (Profesional)
2. **Curso Conservatorio**: filtrar por un curso concreto del conservatorio
3. **Especialidad**: filtrar por instrumento/especialidad
4. **Curso ERG**: filtrar por un curso concreto del centro
5. **Centro ERG**: filtrar por un centro concreto
6. **Conservatorio**: filtrar por un conservatorio concreto
7. **Desfase**: solo los equivalentes, solo los leves, solo los grandes, solo los que tienen algún desfase, o solo los que están sin determinar

Los filtros activos se marcan en azul y hay un contador con un botón para limpiarlos todos de golpe. La combinación de filtros y la vista quedan guardadas en la dirección del navegador, así que puedes recargar la página o guardar el enlace (tendrás que volver a seleccionar el Excel, pero los filtros se recuperan).

### Buscador

Campo de búsqueda por nombre o NIA, que funciona en las dos vistas. Al escribir:

- Resalta en amarillo todos los resultados, y en un amarillo más intenso el resultado actual
- Auto-despliega las tarjetas y cursos donde están los resultados
- Flechas arriba/abajo o Enter para navegar entre resultados (Mayús+Enter hacia atrás)
- Escape o el botón X para limpiar
- Ctrl+F (Cmd+F en Mac) lleva el cursor al buscador
- La búsqueda se mantiene al cambiar de filtro, de vista o de orden

### Información de contacto

- **Botón "Info"** en cada centro y conservatorio: muestra datos de contacto (director/a, jefe/a de estudios, coordinador/a) con enlaces de email
- **Botón (i)** en cada alumno/a: muestra tutores del conservatorio y del centro ERG con emails, y observaciones si las hay. El icono se destaca en naranja cuando hay observaciones

### Email grupal

Botón de email en cada centro/conservatorio y en cada curso que abre el cliente de correo con todos los tutores de ese grupo como destinatarios.

### Expandir y contraer

Botones "Expandir todo" y "Contraer todo" para abrir o cerrar de golpe todas las tarjetas y cursos. Lo que tengas abierto sigue abierto aunque cambies de filtro.

### Exportar

- **Excel**: descarga un `.xlsx` con el alumnado que estés viendo (filtros y orden incluidos) y una columna de desfase ya calculada
- **CSV**: lo mismo en `.csv`, con `;` como separador para que Excel en español lo abra directamente

Ninguna de las dos exportaciones toca tu archivo original: crean un archivo nuevo.

### Imprimir y PDF

El botón **"Imprimir / PDF"** abre el diálogo de impresión del navegador; ahí puedes elegir "Guardar como PDF". Se imprime lo que tengas filtrado, con todas las tarjetas y cursos desplegados, el texto seleccionable y los cortes de página respetando las tarjetas. La vista Cards se imprime en vertical y la vista Tabla en horizontal.

Cada centro tiene además un botón 🖨 en su cabecera para imprimir **solo ese centro**.

---

## Accesibilidad

Las tarjetas y los cursos se pueden abrir con el teclado (Tab para moverse, Enter o Espacio para abrir), el foco se ve siempre, las cabeceras de la tabla indican el orden a los lectores de pantalla y las animaciones se desactivan si el sistema tiene activado "reducir movimiento".

---

## Para desarrolladores

Todo el código está en `index.html`: HTML, CSS y JavaScript en un único archivo, sin framework ni proceso de compilación.

La única dependencia es [SheetJS](https://sheetjs.com) (Apache-2.0), que lee el Excel y va **incrustada dentro del HTML** para que la app funcione sin conexión. Vive en `vendor/xlsx.mini.min.js` y se incrusta entre los marcadores `<!-- vendor:xlsx -->` con:

```bash
npm run vendor
```

Para actualizar SheetJS, descarga la nueva versión en `vendor/xlsx.mini.min.js` y vuelve a ejecutar ese comando.

---

## Autor

**Jose Luis Miralles Bono** - [www.jlmirall.es](https://www.jlmirall.es)

Blog: [El pulpo en el vaso](https://elpulpoenelvaso.jlmirall.es)

Contacto para sugerencias o problemas: [jl.mirallesbono@edu.gva.es](mailto:jl.mirallesbono@edu.gva.es)

App creada con ayuda de Claude (Anthropic).

### Invitame a una horchata

Si esta app te resulta util, puedes invitarme a una horchata en [ko-fi.com/miralles](https://ko-fi.com/miralles). Gracias!

---

## Licencia

Este proyecto es software libre. Consulta el repositorio para mas detalles.
