#!/bin/zsh
#
# Publica la app en la carpeta compartida de OneDrive.
#
#   npm run publicar
#
# Se copia UN SOLO archivo HTML autocontenido. Es a propósito: si publicaras una
# carpeta con varios archivos, alguien podría cargar la app con el HTML nuevo y
# el JavaScript viejo. Con un archivo único la actualización es atómica.
#
# La copia la hace el Finder por AppleScript, no `cp`: en los Mac de Conselleria
# la terminal no puede acceder a OneDrive (Operation not permitted por política
# MDM) aunque tenga Acceso total al disco, pero el Finder sí.
#
set -euo pipefail

cd "$(dirname "$0")/.."
RAIZ="$(pwd)"
NOMBRE_PUBLICADO="Coordinacion Horaria.html"

rojo()  { print -P "%F{red}$1%f" }
verde() { print -P "%F{green}$1%f" }
gris()  { print -P "%F{242}$1%f" }

# --- 1. El árbol tiene que estar limpio -------------------------------------
if [[ -n "$(git status --porcelain)" ]]; then
  rojo "Hay cambios sin commitear."
  gris "Publica solo lo que esté commiteado, para que el sello de versión sirva de algo."
  git status --short
  exit 1
fi

# --- 2. Destino -------------------------------------------------------------
CONF="herramientas/destino.local"
if [[ ! -f "$CONF" ]]; then
  rojo "Falta $CONF"
  gris "Copia herramientas/destino.local.example a herramientas/destino.local y pon dentro"
  gris "la ruta de tu carpeta de OneDrive. Ese archivo no se sube al repositorio."
  exit 1
fi
DESTINO="$(grep -v '^[[:space:]]*#' "$CONF" | grep -v '^[[:space:]]*$' | head -1)"
DESTINO="${DESTINO%/}"
if [[ -z "$DESTINO" ]]; then
  rojo "$CONF está vacío."
  exit 1
fi

# El Finder sí puede mirar en OneDrive, la terminal no
EXISTE="$(/usr/bin/osascript -e "tell application \"Finder\" to return (exists (POSIX file \"$DESTINO\" as text))" 2>/dev/null || echo false)"
if [[ "$EXISTE" != "true" ]]; then
  rojo "El Finder no encuentra la carpeta de destino:"
  gris "  $DESTINO"
  gris "Compruébala en el Finder (ojo a los espacios y a las mayúsculas) y corrige $CONF."
  exit 1
fi

# --- 3. Sello de versión ----------------------------------------------------
SELLO="$(git describe --tags --always --dirty)"
FECHA="$(date '+%Y-%m-%d %H:%M')"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
SALIDA="$TMP/$NOMBRE_PUBLICADO"

/usr/bin/sed "s|window.COORDINACION_BUILD = '[^']*'; /\*BUILD\*/|window.COORDINACION_BUILD = '$SELLO ($FECHA)'; /*BUILD*/|" \
  index.html > "$SALIDA"

if ! grep -q "window.COORDINACION_BUILD = '$SELLO" "$SALIDA"; then
  rojo "No he podido sellar la versión en el HTML."
  gris "¿Sigue existiendo la marca /*BUILD*/ en index.html?"
  exit 1
fi

# --- 4. Copiar por Finder ---------------------------------------------------
copiar() {  # copiar <archivo-origen> <carpeta-destino>
  /usr/bin/osascript - "$1" "$2" <<'FIN'
on run argv
	set origen to POSIX file (item 1 of argv)
	set destino to POSIX file (item 2 of argv) as text
	tell application "Finder"
		duplicate origen to folder destino with replacing
	end tell
end run
FIN
}

copiar "$SALIDA" "$DESTINO" > /dev/null
[[ -f "$RAIZ/LEEME.md" ]] && copiar "$RAIZ/LEEME.md" "$DESTINO" > /dev/null

TAM="$(/usr/bin/stat -f %z "$SALIDA")"
verde "Publicado «$NOMBRE_PUBLICADO» ($((TAM / 1024)) KB, versión $SELLO)"
gris  "  en $DESTINO"
gris  ""
gris  "Recuerda: los datos viven en la subcarpeta datos/ y no se tocan al publicar."
gris  "Si alguien tiene la app abierta, tendrá que recargar la página para ver la versión nueva."
