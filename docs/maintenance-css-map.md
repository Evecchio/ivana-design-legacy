# Mapa CSS y candidatos de limpieza

Fecha: 2026-06-12

Fuente: `docs/maintenance-tasks/M02-css-map-and-dead-rules.md`.

## Objetivo

Mapear `static/css/ivana-design.css` por dominios y detectar zonas de duplicacion o reglas candidatas a limpieza. Esta tarea no elimina CSS productivo: deja el mapa para que los cortes posteriores sean chicos, verificables y seguros.

## Resumen tecnico

Archivo principal:

- `static/css/ivana-design.css`
- Lineas: 6055.
- Peso: ~168.5 KB.
- `!important`: 1822.
- Selectores repetidos detectados: 317.

Reporte local generado:

- `output/maintenance-baseline/m02-css-map.json`
- `output/maintenance-baseline/m02-class-reference.json`

## Mapa por dominios

| Dominio aproximado | Lineas | Lectura | Riesgo |
| --- | --- | --- | --- |
| Refresh/base legacy inicial | 1-1624 | Capa amplia con reglas base, producto, categoria, carrito, footer e institucionales. Muchas reglas son pisadas por capas activas posteriores. | Medio-alto |
| Producto mobile/soporte | 1625-2157 | Ajustes de producto, soporte mobile y bloques visuales sensibles. | Alto |
| Fundaciones visuales activas | 2158-2889 | Tokens visuales, page shells, footer/blog/404 y base activa post-release. | Medio |
| Header | 2890-3217 | Header, buscador, nav y utilidades. | Medio |
| Cards/grillas | 3218-3249 y 4640-5070 aprox. | Reglas de grillas y card activa, con repeticiones por home/categoria/busqueda. | Alto |
| Producto activo | 3250-3639 y 5200-5750 aprox. | Sistema de producto aprobado; muchas reglas con `!important`. | Alto |
| Categoria/listado | 3640-3901 y final activo | Filtros modales, layout categoria y busqueda. | Medio-alto |
| Responsive/hotfixes | 3902-final | Incluye fixes post-release, imagenes completas, filtros, 404 y spacing home. | Medio-alto |

## Hotspots de `!important`

| Lineas | `!important` | Lectura |
| --- | ---: | --- |
| 4751-5000 | 157 | Cards activas y responsive de grillas. |
| 5251-5500 | 143 | Producto activo. |
| 5501-5750 | 115 | Producto mobile/relacionados. |
| 4001-4250 | 113 | Responsive/header/categoria. |
| 4251-4500 | 101 | Responsive/cards. |
| 1001-1250 | 96 | Legacy intermedio. |
| 5001-5250 | 95 | Cards/home/producto. |
| 5751-6000 | 91 | Fixes finales activos. |
| 2751-3000 | 86 | Footer/blog/404/header base activa. |
| 3001-3250 | 84 | Header/nav y grillas. |

## Selectores mas repetidos

| Selector | Apariciones | Lectura |
| --- | ---: | --- |
| `.ivana-product-shell .product-images` | 19 | Producto tiene multiples generaciones. Alto riesgo. |
| `.ivana-product-shell .product-info` | 15 | Producto tiene multiples generaciones. Alto riesgo. |
| `.ivana-category-products` | 10 | Categoria/listado tiene capas viejas y fixes finales. |
| `.ivana-product-shell .product-columns` | 9 | Producto desktop/mobile, alto riesgo. |
| `.ivana-cart-shell .cart-page-products` | 8 | Carrito tiene capas repetidas, pero ya estable. |
| `.ivana-cart-shell .cart-page-summary` | 8 | Carrito tiene capas repetidas, pero sensible. |
| `.ivana-category-heading` | 7 | Categoria y search comparten layout. |
| `.search-container` | 7 | Header/buscador tiene reglas dispersas. |
| `.ivana-category-filter-card` | 7 | Filtros tienen legacy + implementacion activa. |
| `.ivana-product-shell .free-shipping-message` | 7 | Envio en producto, alto riesgo. |
| `.ivana-footer-grid` | 6 | Buen candidato para futura reduccion de `!important`. |

## Candidatos y clasificacion

### Bajo riesgo

- Footer e institucionales: buen primer dominio para `M03-css-important-reduction`.
- Blog y page shells: reglas recientes, visibles y con QA simple.
- Comentarios/encabezados mojibake: se pueden normalizar cuando se toque el bloque, sin cambiar comportamiento.
- `#page-error`/404: mantener como compatibilidad, no borrar hasta resolver cache/HTML de Tiendanube.

### Riesgo medio

- Header/buscador: hay duplicacion, pero toca menu, buscador y carrito badge.
- Categoria/filtros: hay reglas viejas y activas; tocar solo con QA en categoria, busqueda, filtros y desktop-mode mobile.
- Home product grids: clases dinamicas Twig pueden parecer no referenciadas (`js-products-sale-grid`, `js-products-new-grid`) pero se generan desde `snipplets/home/home-featured-grid.tpl`.

### Alto riesgo

- Producto: `product-images`, `product-info`, `product-columns`, variantes, envio gratis, transferencia y relacionados.
- Cards: precio, descuento, cuotas, transferencia, stock e imagen completa dependen de cascada + JS.
- `ivana-product-mobile-20260610-24.css`: override sensible, tratar en `M04`.
- `ivana-card.js.tpl`: no eliminar sin `M05`.

## Falsos positivos detectados

Estas clases no deben marcarse como muertas solo por busqueda literal:

- `js-products-sale-grid`
- `js-products-new-grid`
- `js-products-featured-grid`
- `js-products-{{ section_slider_id }}-grid`

Motivo: se generan dinamicamente desde `snipplets/home/home-featured-grid.tpl`.

## Primer corte recomendado

Para `M03`, empezar por footer/institucionales:

1. Medir `!important` solo en bloque footer/blog/page/contact.
2. Reducir `!important` donde el selector ya esta suficientemente acotado por `.ivana-footer`, `.ivana-page-shell`, `.ivana-contact-shell` o `.ivana-blog-*`.
3. Validar home, contacto, page, blog y footer mobile/desktop.
4. No tocar producto, cards ni categoria en ese primer corte.

## No borrar todavia

- Bloques iniciales de producto aunque parezcan pisados.
- Reglas de card en lineas finales.
- Reglas de `free-shipping`, `shipping`, `payment-discount`, variantes o stock.
- Clases `js-*` aunque parezcan no usadas en templates, porque pueden ser usadas por JS de Tiendanube o generadas dinamicamente.
