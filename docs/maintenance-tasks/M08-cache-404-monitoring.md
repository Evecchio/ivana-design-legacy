# M08 - Cache y 404

Estado: `pending`

## Objetivo

Revisar el comportamiento residual de cache/404 observado en T09 y definir si requiere accion o solo monitoreo.

## Archivos candidatos

- `templates/404.tpl`
- `static/css/ivana-design.css`
- `layouts/layout.tpl`
- `docs/tasks/T09-qa-release.md`

## No tocar

- Paginas principales.
- Producto/carrito/checkout.

## Pasos

1. Revisar asset version cargado en 404 vs home/producto.
2. Validar si el HTML de 404 ya toma el template actualizado.
3. Confirmar si sigue habiendo overflow residual.
4. Documentar decision: corregir, monitorear o consultar soporte Tiendanube.

## Criterios de aceptacion

- Riesgo de 404 actualizado.
- No se afecta compra ni navegacion principal.

## QA

- 404 mobile y desktop.
- Home smoke.
- Producto -> carrito smoke.
