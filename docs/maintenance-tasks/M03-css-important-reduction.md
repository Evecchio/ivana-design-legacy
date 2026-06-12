# M03 - Reduccion de important

Estado: `done`

## Objetivo

Reducir `!important` en un dominio de bajo riesgo manteniendo la misma apariencia.

## Archivos candidatos

- `static/css/ivana-design.css`

## No tocar

- Producto, carrito, variantes, stock, precios, checkout y envios en el primer corte.

## Pasos

1. Elegir un dominio de bajo riesgo, preferentemente footer/institucionales.
2. Reemplazar `!important` por selectores mas acotados cuando sea equivalente.
3. Mantener cambios chicos.
4. Validar mobile/desktop.

## Criterios de aceptacion

- Baja el conteo de `!important`.
- No cambia el layout visible.
- No aparecen errores JS ni scroll horizontal.

## QA

- Footer.
- Contacto.
- Pagina institucional.
- Blog.

## Resultado

- Corte aplicado sobre el bloque legacy de footer en `static/css/ivana-design.css`.
- Conteo global de `!important`: 1822 -> 1784.
- No se tocaron producto, categoria, cards, carrito, variantes, stock, precios, checkout ni envios.
- Validacion requerida al desplegar: home/footer, contacto, pagina institucional, blog y 404 en mobile/desktop.
