# T06 - Pagina de producto

Estado: `pending`

## Objetivo

Redisenar la pagina de producto preservando variantes, stock, precios, cuotas, transferencia, envios, add to cart, descripcion y relacionados.

## Contexto de la spec

- Ver `4.3 Producto`.
- Ver `7. Backlog tecnico > Epica 6 - Producto`.
- Ver `8. Checklist QA por pagina > Producto`.
- Ver `2.3 Que no debe modificarse sin validacion funcional`.

## Archivos candidatos a modificar

- `templates/product.tpl`
- `snipplets/product/product-image.tpl`
- `snipplets/product/product-form.tpl`
- `snipplets/product/product-description.tpl`
- `snipplets/product/product-related.tpl`
- `snipplets/product/product-variants.tpl`
- `snipplets/product/product-quantity.tpl`
- `snipplets/product/product-payment-details.tpl`
- `static/css/ivana-design.css`
- `static/css/ivana-product-mobile-20260610-24.css` o reemplazo versionado equivalente.

## Archivos/hooks que no deben tocarse

- Preservar `id="single-product"`, `data-variants`, `data-store="product-detail"`.
- Preservar `js-product-detail`, `js-product-container`, `js-has-new-shipping`, `js-shipping-calculator-container`.
- No romper `js-product-name`, `js-price-display`, `js-compare-price-display`, `js-prod-submit-form`.
- No cambiar logica de variantes, stock, quantity ni add to cart sin QA.
- No tocar checkout.

## Pasos de implementacion

1. Relevar producto actual con variantes, sin variantes, con descuento, sin stock y bajo stock.
2. Redisenar layout mobile-first: galeria, info comercial, variantes, CTA y envios.
3. Mejorar bloque de precio, cuotas y transferencia.
4. Ajustar descripcion para lectura clara.
5. Revisar relacionados y video si existe.
6. Validar cambios de variante, cantidad, stock y add to cart.

## Criterios de aceptacion

- Galeria carga y no se desborda en mobile.
- Variantes actualizan precio, imagen y stock.
- CTA agrega al carrito correctamente.
- Shipping calculator y free shipping funcionan.
- Descripcion es legible.
- Relacionados renderizan con card consistente.
- No hay errores JS visibles.

## Checklist QA

- Producto con multiples variantes.
- Producto sin variantes.
- Producto con descuento y sin descuento.
- Producto sin stock.
- Producto bajo stock.
- Cambio de cantidad.
- Add to cart y notificacion.
- Calculadora de envio.

## Riesgos

- Romper contrato entre markup y `store.js.tpl`.
- Ocultar controles de variante o mensajes de stock.
- Reintroducir problemas recientes de galeria/envios mobile.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de cambios en producto.
- QA funcional de variantes, stock, add to cart y envios.
