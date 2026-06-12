# M03 - Reduccion de important

Estado: `pending`

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
