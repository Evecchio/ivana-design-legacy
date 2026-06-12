# M08 - Cache y 404

Estado: `done`

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

## Cierre

Decision: monitorear sin cambios productivos.

- La 404 publicada responde con HTTP `404` y body `template-404`.
- El HTML publicado ya contiene el template actualizado con `.ivana-error-shell` y `#page-error`.
- La 404 carga `ivana-design.css?v=20260612-07`, igual que home/producto.
- La 404 todavia carga el CSS legacy `ivana-product-mobile-20260610-24.css?v=20260612-07` en lugar de `ivana-product-overrides.css`.
- Esa referencia legacy no existe en el repo actual y parece quedar servida por CDN/plataforma.
- No se detecto overflow horizontal en 320, 390, 768 ni 1366 px.
- La grilla de productos destacados en 404 quedo contenida como `display: grid` y `transform: none`.
- No se tocaron paginas principales, producto, carrito ni checkout.

Riesgo residual:

- Bajo: Tiendanube/CloudFront sigue resolviendo el asset legacy para 404. Mientras no genere overflow ni diferencias visuales criticas, no justifica tocar produccion. Si vuelve el overflow o aparece CSS viejo en paginas principales, consultar soporte Tiendanube o forzar nueva version de asset con una tarea especifica.
