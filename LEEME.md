# Coordinación Horaria

Esta carpeta contiene la aplicación de coordinación horaria y sus datos.

## Cómo se abre

Haz doble clic en **`Coordinacion Horaria.html`**.

**Ábrelo con Chrome o con Edge.** Con Firefox o Safari podrás consultar los datos,
pero no guardarlos: esos navegadores no permiten que una página escriba en una carpeta.

La primera vez te pedirá dos cosas:

1. **Elegir la carpeta**: selecciona *esta misma carpeta*, la que contiene el archivo que acabas de abrir.
2. **Permiso para editar archivos**: dile que sí.

El navegador recuerda la carpeta, pero **vuelve a pedirte permiso cada vez que lo cierras del todo**.
Cuando pase, pulsa el botón **"↻ Reconectar con la última carpeta"** y sigue donde lo dejaste.

Si prefieres mirar un Excel antes de nada, puedes: arrástralo a la zona de abajo. Luego, con el
botón **"Conectar carpeta para guardar"** de la barra de arriba, lo llevas a esta carpeta sin perder
nada. Eso sí, si la carpeta ya tiene datos no se sobrescriben: primero se abren los de la carpeta.

## Qué hay aquí

| | |
|---|---|
| `Coordinacion Horaria.html` | La aplicación. Es lo único que se abre. |
| `datos/coordinacion.json` | **Los datos.** No lo abras ni lo muevas a mano. |
| `datos/copias/` | Copias de seguridad automáticas: una por cada vez que alguien guarda. Se conservan las 30 últimas. |

La regla es sencilla: **fuera se abre, dentro de `datos/` no se toca.**

## Guardar

Los cambios **no se guardan solos**. Cuando cambies algo, el botón **Guardar** se pone
en azul y parpadea: púlsalo (o Ctrl+S, Cmd+S en Mac). Si cierras la pestaña con cambios
sin guardar, el navegador te avisa.

Es a propósito: en una carpeta sincronizada, guardar a cada tecla multiplica las
probabilidades de que dos personas se pisen.

## Si estáis varias personas

Antes de guardar, la app comprueba si alguien más ha guardado mientras tanto. Si es así,
te dice quién y te deja elegir entre recargar lo suyo, sobrescribirlo o cancelar.
**Léelo antes de pulsar**: sobrescribir borra el trabajo de la otra persona.

Para evitar sustos, avisad por el chat antes de sentaros a hacer cambios grandes.

## Si algo va mal

- **"El archivo está dañado"**: la app ofrece la copia de seguridad buena más reciente. Acéptala y guarda.
- **Has borrado algo sin querer**: botón **Copias**, elige la de antes del error y restaura. No se escribe nada hasta que pulses Guardar.
- **Quieres ver quién cambió qué**: botón **Historial**.

## Modo solo lectura

Si la app pide un código para editar, es el **código del centro**. Sirve para no tocar
datos sin querer mientras consultas; no es una contraseña de seguridad.

---

Dudas o problemas: jl.mirallesbono@edu.gva.es
