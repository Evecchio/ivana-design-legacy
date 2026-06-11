# T02 - Card de producto

Estado: `pending`

## Objetivo

Redisenar la card de producto para que sea consistente, comercial y mobile-first, preservando precios, descuentos, cuotas, transferencia, stock, sliders, quick shop e infinite scroll.

## Contexto de la spec

- Ver `4.2 Categoria/listado`.
- Ver `5.5 Cards de producto`.
- Ver `7. Backlog tecnico > Epica 4 - Card de producto`.
- Ver `8. Checklist QA por pagina`.

## Archivos candidatos a modificar

- `snipplets/product-item.tpl`
- `snipplets/product_grid.tpl`
- `snipplets/grid/products-list.tpl`
- `static/css/ivana-design.css`
- `static/css/ivana-product-mobile-20260610-24.css` o reemplazo versionado equivalente.
- `static/js/ivana-card.js.tpl` solo si el markup visual lo exige.

## Archivos/hooks que no deben tocarse

- No romper `component('product-item')`.
- Preservar `js-product-container`, `js-item-product`, `js-price-display`, `js-compare-price-display` y clases privadas de producto item.
- No cambiar logica de precio, descuento, stock, variantes ni money filters.
- No tocar `store.js.tpl` salvo bug probado y acotado.

## Pasos de implementacion

1. Relevar card actual en home, categoria, busqueda, relacionados y sliders.
2. Definir estructura visual estable: imagen, nombre, precio, descuento, cuotas, transferencia y stock.
3. Ajustar CSS para aspect ratio, alturas estables, responsive y estados hover/focus.
4. Mantener badges condicionales solo cuando existan datos reales.
5. Validar que `ivana-card.js.tpl` no duplique ni contradiga el nuevo orden visual.
6. Probar con productos con descuento, sin descuento, bajo stock, sin stock y con multiples imagenes.

## Criterios de aceptacion

- La card se ve consistente en todos los listados y sliders.
- El precio actual y compare price son correctos.
- El descuento no aparece si no hay descuento real.
- Cuotas y transferencia son legibles en mobile.
- Bajo stock y sin stock no rompen layout.
- Sliders de producto item, quick shop e infinite scroll siguen funcionando.

## Checklist QA

- Home: destacados, nuevos, ofertas y producto principal si aplica.
- Categoria: grilla con 1 y 2 columnas mobile, 4/5/6 desktop segun settings.
- Busqueda: resultados y sugeridos sin resultados.
- Producto: relacionados.
- Probar hover desktop y foco por teclado.
- Confirmar ausencia de errores JS.

## Riesgos

- Romper hooks de Tiendanube usados por variantes en card.
- Desalinear badges recientes de transferencia.
- Generar layout shift por imagenes sin dimensiones.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de cambios visuales en card.
- Evidencia de QA por contexto de render.
