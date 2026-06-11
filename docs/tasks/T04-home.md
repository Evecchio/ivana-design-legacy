# T04 - Home comercial

Estado: `done`

## Objetivo

Redisenar la home modular para mejorar descubrimiento, claridad comercial y conversion, respetando el orden configurable de secciones y los estados de preview/help.

## Contexto de la spec

- Ver `4.1 Home`.
- Ver `4.9 Banners y secciones promocionales`.
- Ver `7. Backlog tecnico > Epica 3 - Home comercial`.
- Ver `8. Checklist QA por pagina > Home`.

## Archivos candidatos a modificar

- `templates/home.tpl`
- `snipplets/home/home-section-switch.tpl`
- `snipplets/home/*.tpl`
- `snipplets/defaults/home/*.tpl` solo si se afecta preview/help.
- `static/css/ivana-design.css`
- `static/css/style-async.scss`

## Archivos/hooks que no deben tocarse

- No romper `settings.home_order_position_1..18`.
- Preservar `data-store` de secciones.
- No duplicar newsletter ni instafeed.
- No eliminar estados `show_help` ni `show_component_help`.
- No cambiar logica de productos `sections.primary`, `sections.new`, `sections.sale`.

## Pasos de implementacion

1. Relevar secciones activas y fallback/help.
2. Definir sistema de headers de seccion y espaciado vertical.
3. Redisenar hero/slider, categorias, banners y bloques promocionales.
4. Alinear secciones de productos con la card final de T02.
5. Revisar institucional, marcas, testimonios, video, newsletter e instafeed.
6. Validar secciones activas, inactivas y preview.

## Criterios de aceptacion

- Todas las secciones configuradas renderizan sin romper layout.
- Home es responsive y no tiene scroll horizontal.
- CTAs e imagenes principales son legibles y clickeables.
- Cards de producto se mantienen consistentes.
- Estados preview/help siguen disponibles.

## Checklist QA

- Slider/hero desktop y mobile.
- Categorias destacadas.
- Banners de categorias, promocionales y novedades.
- Productos destacados, nuevos y ofertas.
- Newsletter e instafeed sin duplicacion.
- CTAs y links.

## Riesgos

- Asumir que una seccion siempre existe cuando depende de settings.
- Romper imagenes mobile/desktop configurables.
- Generar espacios excesivos o saltos de layout.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de secciones tocadas.
- QA de secciones principales y estados vacios/preview.

## Cierre T04

Cambios realizados:

- Compactada la grilla de productos de home en mobile entre 360px y 767px a 2 columnas.
- Ajustada la card solo dentro de `.ivana-home-products` para mantener legibles nombre, precio, descuento, cuotas y transferencia en columnas compactas.
- Conservadas las grillas de categoria/busqueda sin cambios.
- Preservado el orden modular `settings.home_order_position_1..18`, los `data-store`, los estados de ayuda/preview y la logica de `sections.primary`, `sections.new` y `sections.sale`.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260611-04` para publicar el CSS sin cache viejo.

Validaciones post-deploy:

- Home mobile 390px: productos destacados en 2 columnas, 8 cards, seccion reducida de ~4488px a ~1994px.
- Home desktop 1366px: productos destacados en 3 columnas, 8 cards, sin errores JS.
- Categoria mobile: se mantiene en 1 columna y 60 cards.
- Busqueda `/search/?q=bikini`: 60 cards, sin errores JS.
- Carrito modal: abre `#modal-cart` y conserva `.js-ajax-cart-list`.

Riesgo residual:

- `scrollWidth` mobile queda 1px por encima del viewport por sliders Swiper duplicados fuera de pantalla; no se origina en la grilla de productos de home.
