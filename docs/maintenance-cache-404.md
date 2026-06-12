# M08 - Cache y 404

Fecha: 2026-06-12

## Objetivo

Revisar el comportamiento residual de cache/404 observado en `T09` y decidir si requiere correccion productiva o solo monitoreo.

## Hallazgos

- `layouts/layout.tpl` define `asset_version = '20260612-07'`.
- Home y producto cargan:
  - `ivana-design.css?v=20260612-07`
  - `ivana-product-overrides.css?v=20260612-07`
- La 404 publicada carga:
  - `ivana-design.css?v=20260612-07`
  - `ivana-product-mobile-20260610-24.css?v=20260612-07`
- `ivana-product-mobile-20260610-24.css` ya no existe en el repo actual.
- La URL legacy del CSS sigue respondiendo `200` desde CloudFront.
- El HTML de 404 ya usa el template actualizado:
  - `body.template-404`
  - `.ivana-error-shell`
  - `#page-error`
- Las reglas compatibles agregadas durante release siguen activas:
  - `#page-error .js-products-featured-grid` se renderiza como `display: grid`.
  - El transform del swiper queda en `none`.

## QA ejecutado

Validado en produccion con Playwright.

### 404

URL probada: `https://www.ivanadesign.com.ar/__m08-cache-404-check-*`

Viewports:

- `320x720`
- `390x844`
- `768x1024`
- `1366x900`

Resultado:

- HTTP `404` correcto.
- Sin errores JS propios; el unico error de consola esperado es el recurso/documento 404.
- Sin scroll horizontal.
- `scrollWidth` igual a `innerWidth` en todos los viewports.
- Template actualizado presente.
- Grilla destacada contenida.

### Smoke home

URL: `https://www.ivanadesign.com.ar/`

- HTTP `200`.
- Sin errores JS visibles.
- Sin scroll horizontal.
- Assets principales con `asset_version=20260612-07`.

### Smoke producto

URL: `https://www.ivanadesign.com.ar/productos/enteriza-lisa-c-vivos-de-color-oke3n/`

- HTTP `200`.
- Sin errores JS visibles.
- Sin scroll horizontal.
- Assets principales con `asset_version=20260612-07`.

## Decision

No aplicar cambios productivos.

La 404 ya no reproduce el overflow residual reportado en `T09`. La diferencia del CSS legacy parece venir de cache/CDN/plataforma y no del repo actual. Como no afecta compra, navegacion principal, producto, carrito ni responsive, queda documentado para monitoreo.

## Riesgo residual

- Bajo: la 404 puede seguir resolviendo el CSS legacy en algunos requests.
- Bajo: si Tiendanube purga o cambia cache, la referencia podria desaparecer sola.
- Bajo-medio: si vuelve overflow en 404, conviene consultar soporte Tiendanube antes de sumar mas parches al theme.

## Recomendacion

Mantener las reglas de compatibilidad actuales de `#page-error` en `static/css/ivana-design.css` hasta confirmar durante varias publicaciones que la 404 ya no carga el asset legacy.
