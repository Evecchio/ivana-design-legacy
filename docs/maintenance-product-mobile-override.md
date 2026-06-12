# Estrategia CSS producto y overrides

Fecha: 2026-06-12

Fuente: `docs/maintenance-tasks/M04-product-mobile-override.md`.

## Resumen

El archivo versionado `static/css/ivana-product-mobile-20260610-24.css` funcionaba como capa final de correcciones cargada despues de `static/css/ivana-design.css`. El nombre sugeria que era solo mobile/producto, pero el contenido real tambien cubre cards de producto relacionados, cards de home, imagenes completas y home categories.

Para reducir ambiguedad sin cambiar comportamiento, se renombro a:

- `static/css/ivana-product-overrides.css`

El cache busting queda a cargo de `asset_version` en `layouts/layout.tpl`, por lo que no hace falta versionar el nombre del archivo.

## Como se carga

Orden actual en `layouts/layout.tpl`:

1. `css/ivana-design.css`
2. `css/ivana-product-overrides.css`

La segunda hoja pisa reglas sensibles de producto/cards. No debe moverse antes de `ivana-design.css`.

## Mapa de bloques

| Bloque | Lineas aproximadas | Funcion | Riesgo |
| --- | ---: | --- | --- |
| Producto/media global | 1-69 | Oculta breadcrumbs, fuerza imagen completa, colores de precio/transferencia y badges. | Alto |
| Home categories/home spacing | 70-88 | Ajusta circulos de colecciones y espaciado entre secciones. | Medio |
| Card transferencia global | 90-138 | Ordena caption, precio y badge de transferencia. | Alto |
| Producto transferencia/descripcion | 139-260 | Transferencia de producto, descripcion y notas. | Alto |
| Producto mobile | 262-520 | Layout mobile, precios, transferencia, envio gratis, calculador de envio y contenedores. | Alto |
| Home categories mobile | 521-534 | Tamano de circulos en mobile. | Medio |
| Relacionados/cards mobile | 536-589 | Cards dentro de productos relacionados. | Alto |
| Descripcion mobile | 590-604 | Descripcion de producto en mobile. | Medio |
| Cards home mobile | 606-final | Transferencia e imagen completa en cards de home. | Alto |

## Duplicacion con `ivana-design.css`

Hay reglas similares en `ivana-design.css`, especialmente para:

- Imagenes de producto con `object-fit: contain`.
- Transferencia en cards.
- Descripcion de producto.
- Producto relacionados.
- Home categories.

No se consolidan todavia porque esta hoja se carga al final y actua como garantia sobre reglas que Tiendanube/JS pueden reordenar o recalcular. Absorberla completa en `ivana-design.css` requiere screenshots baseline especificos de producto mobile, producto desktop, relacionados, home y cards.

## Decision

Mantener una hoja separada de overrides por ahora, pero con nombre estable y documentado.

No consolidar en `ivana-design.css` hasta que se puedan hacer cortes chicos por dominio:

1. Home categories.
2. Cards home.
3. Producto descripcion.
4. Producto media.
5. Envio/calculador/transferencia.

## Reglas de seguridad

- No tocar selectores `js-*`, `data-store`, `data-component` ni markup funcional.
- No quitar `!important` en esta hoja sin validar producto mobile y desktop.
- No cambiar orden de carga.
- No mezclar este archivo con estilos generales de footer, header o categoria.
- Cualquier consolidacion futura debe mantener producto, variantes, stock, precio, transferencia, envio y add to cart.

## QA requerido

- Producto mobile: imagen completa, precio, descuento, transferencia, variantes, stock, envio y add to cart.
- Producto desktop: galeria, thumbnails, precio, variantes, add to cart.
- Relacionados: cards completas, transferencia y layout sin overflow.
- Home mobile: cards y circulos de coleccion.
- Carrito: producto agregado y checkout handoff.
