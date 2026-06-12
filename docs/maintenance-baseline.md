# Baseline mantenimiento post-release

Fecha: 2026-06-12

Fuente: `docs/maintenance-optimization.md` y `docs/maintenance-tasks/M01-baseline-maintenance.md`.

## Objetivo

Registrar el estado tecnico y visual despues del release del redisenio para que las tareas de limpieza y optimizacion tengan un punto de comparacion.

## Archivos medidos localmente

| Archivo | KB | `!important` |
| --- | ---: | ---: |
| `static/css/ivana-design.css` | 168.5 | 1822 |
| `static/css/ivana-product-mobile-20260610-24.css` | 23.7 | 307 |
| `static/css/style-critical.scss` | 94.8 | 153 |
| `static/css/style-async.scss` | 52.6 | 22 |
| `static/css/style-utilities.scss` | 21.4 | 356 |
| `static/js/store.js.tpl` | 138.2 | 0 |
| `static/js/ivana-card.js.tpl` | 13.8 | 0 |
| `static/js/external.js.tpl` | 103.4 | 0 |

## Capturas locales

Guardadas en `output/maintenance-baseline/`:

- `home-mobile.png`
- `home-desktop.png`
- `category-mobile.png`
- `category-desktop.png`
- `search-mobile.png`
- `search-desktop.png`
- `product-mobile.png`
- `product-desktop.png`
- `cart-empty-mobile.png`
- `cart-empty-desktop.png`
- `contact-mobile.png`
- `contact-desktop.png`
- `404-mobile.png`
- `404-desktop.png`
- `flow-product-mobile.png`
- `flow-cart-mobile.png`

Reportes locales:

- `output/maintenance-baseline/m01-assets-local.json`
- `output/maintenance-baseline/m01-page-baseline.json`
- `output/maintenance-baseline/m01-flow-baseline.json`

## QA produccion

Paginas validadas en mobile 390px y desktop 1366px:

- Home.
- Categoria/listado.
- Busqueda con resultados.
- Producto.
- Carrito vacio modal.
- Contacto.
- 404.

Resultado:

- Tienda publicada responde.
- Sin errores JS propios en las paginas relevadas.
- Sin scroll horizontal en la pasada baseline.
- Header y footer presentes.
- Newsletter presente.
- Contacto renderiza formulario.

## Flujo compra baseline

Producto usado:

- `https://www.ivanadesign.com.ar/productos/pollera-c-short-mini-leopardo-apodj/`

Resultado:

- Producto renderiza titulo `Pollera con Short Mini Leopardo`.
- Precio visible: `$31.190`.
- Add to cart visible.
- Carrito modal muestra item y total.
- Incrementar cantidad actualiza contador a `2`.
- Calculo de envio con CP `1414` devuelve respuesta.
- Checkout handoff abre `/checkout/v3/start/...` con titulo `Datos personales - Ivana Design`.
- Sin errores JS propios filtrados.

## Riesgos registrados

- El peso y cantidad de `!important` en `ivana-design.css` siguen siendo el principal frente de mantenimiento.
- `ivana-product-mobile-20260610-24.css` sigue funcionando como override versionado y debe tratarse con cuidado.
- Las capturas y reportes de `output/` son evidencia local, no artefactos versionados.
