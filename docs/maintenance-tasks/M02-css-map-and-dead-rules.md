# M02 - Mapa CSS y reglas candidatas

Estado: `done`

## Objetivo

Mapear `static/css/ivana-design.css` por dominios y detectar reglas duplicadas, obsoletas o reemplazadas por reglas posteriores.

## Archivos candidatos

- `static/css/ivana-design.css`
- `static/css/ivana-product-mobile-20260610-24.css`
- `docs/cleanup-audit.md`

## No tocar

- Templates funcionales.
- JS de producto/carrito.
- Hooks `js-*`, `data-store`, `data-component`.

## Pasos

1. Separar inventario por dominio: base, header, cards, home, categoria, producto, carrito, footer, institucionales, responsive, hotfixes.
2. Identificar bloques duplicados y su orden de cascada.
3. Marcar candidatos de bajo/medio/alto riesgo.
4. No eliminar en esta tarea salvo duplicado trivial y validado.

## Criterios de aceptacion

- Existe lista de candidatos con riesgo.
- Se propone primer corte seguro.
- No hay cambios productivos grandes.

## QA

- Si se elimina algo, validar home/categoria/producto/carrito.

## Cierre

Cambios realizados:

- Se genero mapa versionado en `docs/maintenance-css-map.md`.
- Se generaron reportes locales en `output/maintenance-baseline/m02-css-map.json` y `output/maintenance-baseline/m02-class-reference.json`.
- No se modificaron archivos productivos.

Hallazgos:

- `static/css/ivana-design.css` tiene 6055 lineas, 1822 `!important` y 317 selectores repetidos.
- Los mayores hotspots estan en cards, producto activo, responsive y fixes finales.
- Producto/cards/categoria son dominios de alto riesgo por cascada y hooks.
- Footer/institucionales es el primer dominio recomendado para reducir `!important`.

Riesgos:

- Algunas clases son dinamicas en Twig y aparecen como no referenciadas si se busca literal, por ejemplo `js-products-sale-grid` y `js-products-new-grid`.
- No se debe borrar CSS de producto, cards, stock, envio o transferencia sin QA funcional.
