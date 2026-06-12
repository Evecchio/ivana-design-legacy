# M02 - Mapa CSS y reglas candidatas

Estado: `pending`

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
