# Performance y assets

Fecha: 2026-06-12

Fuente: `docs/maintenance-tasks/M06-performance-assets.md`.

## Resumen

Se midio la carga de home, categoria y producto en desktop/mobile contra la tienda publicada. La tarea se mantuvo conservadora: no se tocaron checkout, scripts nativos de Tiendanube, GoCuotas, tracking ni imagenes administrables.

Reporte local generado:

- `output/maintenance-baseline/m06-performance-assets/report.json`

## Assets locales principales

| Archivo | Peso aprox. |
| --- | ---: |
| `static/css/ivana-design.css` | 172 KB |
| `static/js/store.js.tpl` | 141 KB |
| `static/js/external.js.tpl` | 106 KB |
| `static/js/external-no-dependencies.js.tpl` | 96 KB |
| `static/css/style-critical.scss` | 97 KB |
| `static/css/style-async.scss` | 54 KB |
| `static/css/ivana-product-overrides.css` | 24 KB |
| `static/css/style-utilities.scss` | 22 KB |
| `static/js/ivana-card.js.tpl` | 15 KB |

## Medicion publicada

| Pagina | Viewport | JS transferido aprox. | CSS detectados | Imagenes detectadas | Scroll horizontal |
| --- | --- | ---: | ---: | ---: | --- |
| Home | Desktop | 99 KB | 5 | 15 | No |
| Categoria | Desktop | 99 KB | 5 | 8 | No |
| Producto | Desktop | 99 KB | 5 | 9 | No |
| Home | Mobile | 130 KB | 5 | 11 | No |
| Categoria | Mobile | 99 KB | 5 | 4 | No |
| Producto | Mobile | 99 KB | 5 | 9 | No |

Notas:

- Los CSS aparecen con `transferSize` 0 en esta medicion por cache/inline/CDN, pero se detectan 5 hojas relevantes.
- Home carga YouTube widget por el video embebido y genera warnings externos de `postMessage`.
- Facebook, GTM, Clarity, Cloudflare, GoCuotas y scripts de Tiendanube son externos o funcionales; no se modifican en esta tarea.

## Cambio aplicado

Se retiro de `layouts/layout.tpl` el preload explicito de la hoja de Google Fonts:

- Removido: `<link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400,700') }}" />`
- Se mantiene `preconnect` a Google Fonts/Gstatic.
- Se mantiene el componente nativo `component('fonts')`, que sigue cargando las fuentes.

Motivo:

- El preload de CSS de fuentes competia con preloads de imagen/script criticos.
- El componente de fuentes ya gestiona la carga real.
- El cambio es de bajo riesgo y reversible.

## Hallazgos

- `ivana-design.css` sigue siendo el principal peso propio a optimizar.
- `store.js.tpl` y `external.js.tpl` son grandes, pero contienen logica base de Tiendanube/theme; no conviene tocarlos sin una tarea especifica.
- `ivana-card.js.tpl` ya fue auditado en M05 y pesa poco frente al resto.
- Las imagenes administrables y de producto son el mayor frente visual, pero no deben reemplazarse desde el theme sin revisar origen/calidad.
- El preload de imagen LCP existe en home/producto/categoria via `snipplets/preload-images.tpl`.

## Proximos cortes recomendados

1. CSS: continuar reduccion por dominios en `ivana-design.css`.
2. Imagenes: revisar en admin banners/video poster y peso real de media first viewport.
3. JS: no recortar tracking/GoCuotas desde theme; documentar si el negocio quiere revisar integraciones externas.
4. Producto: mantener preload de primera imagen.

## QA requerido

- Home, categoria y producto en desktop/mobile.
- Sin errores JS propios.
- Sin scroll horizontal.
- Fuentes cargan correctamente.
- Imagen principal/hero sigue visible.
