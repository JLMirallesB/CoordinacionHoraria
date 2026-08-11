#!/usr/bin/env node
/**
 * Incrusta vendor/xlsx.mini.min.js dentro de index.html, entre los marcadores
 * <!-- vendor:xlsx --> y <!-- /vendor:xlsx -->.
 *
 * La app se distribuye como UN SOLO archivo HTML que debe funcionar sin
 * conexion a internet, asi que la libreria viaja dentro del propio HTML.
 * Para actualizar SheetJS:
 *   1. descarga la nueva version en vendor/xlsx.mini.min.js
 *   2. npm run vendor
 *
 * Es idempotente: se puede ejecutar tantas veces como haga falta.
 */
const fs = require('fs');
const path = require('path');

const root = path.join(__dirname, '..');
const htmlPath = path.join(root, 'index.html');
const libPath = path.join(root, 'vendor', 'xlsx.mini.min.js');

const START = '<!-- vendor:xlsx -->';
const END = '<!-- /vendor:xlsx -->';

const html = fs.readFileSync(htmlPath, 'utf8');
const lib = fs.readFileSync(libPath, 'utf8');

const start = html.indexOf(START);
const end = html.indexOf(END);
if (start === -1 || end === -1 || end < start) {
  console.error(`No encuentro los marcadores ${START} ... ${END} en index.html`);
  process.exit(1);
}

const version = (lib.match(/version\s*=\s*"([\d.]+)"/) || [])[1] || 'desconocida';
const block =
  START +
  '\n<script>/*! SheetJS ' + version + ' (Apache-2.0) - https://sheetjs.com - ver vendor/xlsx-LICENSE.txt */\n' +
  lib.trim() +
  '\n</script>\n' +
  END;

fs.writeFileSync(htmlPath, html.slice(0, start) + block + html.slice(end + END.length));
console.log(`SheetJS ${version} incrustado en index.html (${(lib.length / 1024).toFixed(0)} KB).`);
