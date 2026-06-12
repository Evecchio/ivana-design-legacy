# M01 - Baseline mantenimiento

Estado: `done`

## Objetivo

Crear una linea base tecnica y visual post-release para comparar futuras limpiezas sin depender de memoria o percepcion.

## Archivos candidatos

- `docs/maintenance-optimization.md`
- `docs/cleanup-audit.md`
- `output/` para capturas locales no versionadas

## No tocar

- Templates productivos.
- CSS/JS productivo.
- Checkout, producto, carrito, filtros o envios.

## Pasos

1. Registrar pesos actuales de CSS/JS principales.
2. Registrar conteo de `!important`.
3. Tomar capturas de home, categoria, busqueda, producto, carrito, contacto y 404 en mobile/desktop.
4. Ejecutar flujo producto -> carrito -> checkout.
5. Guardar resultados en documentacion de mantenimiento.

## Criterios de aceptacion

- Existe baseline versionado con metricas.
- Capturas quedan en `output/`.
- Flujo de compra validado.
- Riesgos residuales actualizados.

## QA

- Tienda publicada responde.
- No se hacen cambios productivos.

## Cierre

Cambios realizados:

- Se genero baseline tecnico versionado en `docs/maintenance-baseline.md`.
- Se guardaron capturas y reportes locales en `output/maintenance-baseline/`.
- No se modificaron templates, CSS ni JS productivos.

Validaciones:

- Mobile 390px y desktop 1366px para home, categoria, busqueda, producto, carrito vacio, contacto y 404.
- Flujo producto -> add to cart -> carrito -> cantidad -> envio CP `1414` -> checkout.
- Sin errores JS propios ni scroll horizontal en la pasada baseline.

Riesgos:

- La deuda principal sigue concentrada en `static/css/ivana-design.css`: 168.5 KB y 1822 `!important`.
- El override `static/css/ivana-product-mobile-20260610-24.css` sigue siendo sensible: 23.7 KB y 307 `!important`.
