# M05 - Auditoria JS de cards

Estado: `pending`

## Objetivo

Auditar `static/js/ivana-card.js.tpl` para confirmar que responsabilidades siguen siendo necesarias despues del redisenio.

## Archivos candidatos

- `static/js/ivana-card.js.tpl`
- `snipplets/product-item.tpl`
- `static/css/ivana-design.css`

## No tocar

- Precios.
- Descuentos.
- Cuotas.
- Transferencia.
- Links de producto.

## Pasos

1. Relevar que transforma el JS en cards.
2. Comparar con markup actual de `snipplets/product-item.tpl`.
3. Identificar funciones redundantes vs necesarias.
4. Proponer cortes seguros.

## Criterios de aceptacion

- Existe mapa de responsabilidades.
- No se elimina logica sin QA visual/funcional.
- Cards mantienen precio, descuento, cuotas y transferencia.

## QA

- Categoria.
- Busqueda.
- Home.
- Relacionados de producto.
