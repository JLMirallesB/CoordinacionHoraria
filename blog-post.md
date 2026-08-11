# Coordinación Horaria: una app para que conservatorios y centros educativos se entiendan mejor

Si trabajas en un conservatorio de música o danza, o en un CEIP o IES que tiene alumnado compartido con un conservatorio, seguramente conoces el lío que supone la coordinación horaria. Alumnos que van y vienen entre centros, cursos que no coinciden, desfases que nadie tiene claros hasta que se sienta con un Excel delante... Pues bien, he creado una herramienta para hacer ese proceso un poco menos doloroso.

Se llama **Coordinación Horaria** y es una app gratuita, sin instalación, que funciona directamente en el navegador. Solo necesitas un archivo HTML y tu Excel con los datos. Nada más.

[IMAGEN: pantalla de inicio con la zona de subida del Excel]

## Por qué he creado esto

La idea surgió de una necesidad real. Cuando varios centros educativos se coordinan con uno o varios conservatorios, hay que cruzar mucha información: en qué curso está cada alumno en el conservatorio, en qué curso está en el instituto o colegio, si hay desfase entre ambos, quién es el tutor de cada lado, cómo contactar con la jefatura de estudios del otro centro... Todo eso suele vivir en un Excel que hay que mirar con lupa, filtrar manualmente y enviar por email a medio mundo.

Esta app no sustituye el Excel. Lo que hace es **leerlo y mostrarlo de una forma visual e interactiva** para que tomar decisiones sea más fácil.

## Lo primero: tus datos no salen de tu ordenador

Esto es importante y quiero dejarlo claro desde el principio. La app es un único archivo HTML que se abre en el navegador. **No se instala nada, no se suben datos a ningún servidor, no se almacena nada.** Cuando cierras el navegador, desaparece todo. Y la app jamás escribe ni modifica tu Excel: solo lo lee.

De hecho, la app **funciona sin conexión a internet**: no descarga absolutamente nada. Si quieres comprobarlo, desconecta el wifi y verás que sigue funcionando igual. Tus datos son tuyos y se quedan en tu ordenador. Punto.

## Cómo funciona

Te descargas el archivo `index.html` desde GitHub, lo abres en el navegador, arrastras tu Excel y listo. La app lee las tres hojas del Excel (Centros, Conservatorios y Alumnado) y te muestra toda la información organizada y coloreada.

[IMAGEN: vista general con los centros, filtros y barra de resumen]

Lo primero que ves es un resumen: cuántos alumnos hay, cuántos centros, cuántos conservatorios, y cómo se distribuyen los desfases (cuántos van bien, cuántos tienen un desfase leve y cuántos uno grande). Todo con colores para que de un vistazo sepas cómo está la situación.

## El desfase, esa cosa que nunca queda clara

El concepto central de la app es el **desfase**. Cada curso del conservatorio tiene un curso equivalente en enseñanza general (por ejemplo, 1º EEM equivale a 3º de Primaria, 1º EPM a 1º de ESO, y así). Si un alumno está en 2º EEM pero en el colegio está en 5º de Primaria en vez de en 4º, tiene un desfase de +1.

La app clasifica estos desfases con colores:

- **Verde**: curso equivalente exacto, todo bien
- **Amarillo**: un curso de diferencia, desfase leve
- **Rojo**: dos cursos o más de diferencia, ojo que aquí hay que mirar
- **Gris**: no se puede calcular, porque falta algún curso o está escrito de una forma que la app no reconoce

Estos colores aparecen en todas partes: en la barra de cada centro, en cada curso, y en los grupos de alumnos. Así, sin abrir nada, ya ves de un vistazo dónde están los problemas. Y hay un filtro para quedarte solo con los que tienen desfase, que suele ser justo lo que necesitas mirar.

## La app revisa tus datos por ti

Al cargar el Excel, la app hace una pasada de revisión y te avisa de lo que conviene mirar: NIA repetidos, alumnado al que le falta el curso, cursos escritos de una forma que no reconoce, centros que aparecen en la hoja de Alumnado pero no en la de Centros, nombres que solo se diferencian en un acento o un espacio... Nada de esto bloquea la app, pero te ahorra descubrir el error tres semanas después.

## Dos formas de ver los datos

La app tiene dos vistas. La **vista Cards** es la principal: cada centro aparece como una tarjeta que puedes abrir. Dentro ves los cursos, y dentro de cada curso los alumnos agrupados por desfase. Es como ir abriendo cajones.

[IMAGEN: detalle de un centro expandido con cursos y alumnos]

La **vista Tabla** es más clásica: todos los alumnos en una tabla plana, con todas las columnas, que puedes ordenar haciendo clic en la cabecera que quieras. Útil cuando necesitas buscar algo concreto o quieres ver todo de golpe.

[IMAGEN: vista tabla con los alumnos]

## Filtra como quieras

Hay siete filtros que puedes combinar libremente: por tipo de enseñanza (elemental o profesional), por curso del conservatorio, por curso del centro, por especialidad, por centro concreto, por conservatorio y por desfase. Los filtros se aplican a ambas vistas y al buscador, se marcan en azul para que veas cuáles tienes puestos, y hay un botón para quitarlos todos de golpe.

También hay un **buscador** por nombre o NIA que resalta los resultados en amarillo y despliega automáticamente las tarjetas donde están. Muy útil cuando tienes 100 alumnos y necesitas encontrar a uno rápido.

## Múltiples conservatorios, sin problema

La app está pensada para que un centro de enseñanza general pueda gestionar la coordinación con **varios conservatorios a la vez**. Cada alumno indica a qué conservatorio pertenece, y puedes agrupar la vista por Centro ERG o por Conservatorio con un simple toggle. Así ves la misma información desde dos perspectivas distintas.

[IMAGEN: vista agrupada por conservatorio]

## Información de contacto siempre a mano

Cada centro y cada conservatorio tiene un botón "Info" que despliega los datos de contacto: director/a, jefe/a de estudios y coordinador/a, con sus emails como enlaces directos. Y cada alumno tiene un botón (i) que muestra sus tutores (del conservatorio y del centro) con emails, además de las observaciones si las tiene. Los alumnos con observaciones se destacan con un icono naranja para que no se te pasen.

También hay botones de **email grupal** en cada centro y en cada curso: un clic y se abre tu cliente de correo con todos los tutores de ese grupo como destinatarios. Para cuando necesitas enviar una circular o convocar una reunión.

## Llevarte lo que ves: Excel, CSV o papel

Si necesitas sacar los datos de la app, hay tres botones. **Excel** y **CSV** te descargan exactamente el alumnado que estés viendo, con los filtros aplicados y con la columna de desfase ya calculada, lista para pegar en un informe. Y el botón **Imprimir / PDF** abre el diálogo de impresión del navegador, donde puedes elegir "Guardar como PDF": sale todo desplegado, con el texto seleccionable y las tarjetas sin partirse entre páginas. Cada centro tiene además su propio botón de imprimir, por si solo necesitas la hoja de un colegio concreto para llevarla a una reunión.

## Cómo descargar y empezar a usarla

La app se descarga desde GitHub, que es una plataforma donde se comparte código. No necesitas cuenta ni saber programar, solo descargar dos archivos. Aquí te explico cómo paso a paso:

[BOTON: Ir a la página de descarga](https://github.com/JLMirallesB/CoordinacionHoraria/releases/latest)

1. Haz clic en el botón de arriba (o copia el enlace en tu navegador). Se abrirá la página de descargas del proyecto.
2. Verás una sección llamada **"Assets"** al final de la página. Si no la ves, haz clic en el triángulo o en "Assets" para desplegarla.
3. Descarga los dos archivos que aparecen ahí:
   - **`index.html`** — es la app en sí, el único archivo que necesitas
   - **`ejemplo_coordinacion.xlsx`** — un Excel con datos ficticios para probar
4. Guárdalos en una carpeta de tu ordenador (por ejemplo, en el Escritorio o en Documentos).
5. Haz doble clic en `index.html`. Se abrirá en tu navegador habitual.
6. Arrastra el archivo Excel sobre la zona de subida (o haz clic en "Seleccionar archivo").
7. ¡Listo! Ya puedes explorar los datos de ejemplo.

Cuando quieras usar tus datos reales, abre el Excel de ejemplo con LibreOffice, Excel o Google Sheets y modifícalo con la información de tu centro. Las columnas con desplegables te ayudarán a rellenar los datos sin errores.

No hace falta rellenar todos los campos. Los nombres de tutores, emails, distancias y datos de equipo directivo son opcionales. La app funciona perfectamente sin ellos, pero si los completas tendrás toda esa información accesible desde el visor.

## Es gratuita y de código abierto

La app es completamente gratuita y el código está disponible en [GitHub](https://github.com/JLMirallesB/CoordinacionHoraria). Si encuentras algún problema o tienes alguna sugerencia, puedes escribirme a [jl.mirallesbono@edu.gva.es](mailto:jl.mirallesbono@edu.gva.es).

Y si te resulta útil y quieres invitarme a una horchata, puedes hacerlo en [ko-fi.com/miralles](https://ko-fi.com/miralles). ¡Se agradece!

---

*App creada por [José Luis Miralles Bono](https://www.jlmirall.es) con ayuda de Claude.*
