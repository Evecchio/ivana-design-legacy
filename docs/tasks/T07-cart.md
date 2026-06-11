# T07 - Carrito y conversion final

Estado: `pending`

## Objetivo

Mejorar carrito para revisar productos, editar cantidades, ver totales/envios y avanzar a checkout sin friccion, preservando el flujo de compra Tiendanube.

## Contexto de la spec

- Ver `4.4 Carrito`.
- Ver `7. Backlog tecnico > Epica 7 - Carrito y conversion final`.
- Ver `8. Checklist QA por pagina > Carrito`.
- Ver `12. Criterios de aceptacion generales`.

## Archivos candidatos a modificar

- `templates/cart.tpl`
- `snipplets/cart-item-ajax.tpl`
- `snipplets/cart/cart-summary.tpl`
- `snipplets/cart/cart-totals.tpl`
- `snipplets/cart/cart-fulfillment.tpl`
- `snipplets/shipping/shipping-free-rest.tpl`
- `static/css/ivana-design.css`
- `static/css/style-async.scss`

## Archivos/hooks que no deben tocarse

- Preservar `form action="{{ store.cart_url }}" method="post"`.
- Preservar `data-store="cart-form"`, `data-component="cart"` y `.js-ajax-cart-list`.
- No cambiar nombres de inputs ni estructura funcional de cantidades.
- No romper errores de stock, shipping calculator ni free shipping data.
- No tocar checkout ni URLs de Tiendanube.

## Pasos de implementacion

1. Relevar carrito con items, carrito vacio, errores de stock y envio gratis.
2. Redisenar items mobile/desktop con informacion clara.
3. Mejorar panel de resumen y CTA checkout.
4. Ajustar fulfillment y calculadora de envio sin cambiar logica.
5. Mejorar estado vacio.
6. Validar cambios de cantidad, eliminacion, subtotal, totales y handoff a checkout.

## Criterios de aceptacion

- Items muestran imagen, nombre, variante, cantidad, precio y subtotal.
- Cambiar cantidad actualiza totales.
- Eliminar item funciona.
- Errores de stock se muestran.
- Envio gratis/fulfillment funcionan.
- CTA a checkout funciona.
- Estado vacio ofrece salida clara.

## Checklist QA

- Carrito vacio.
- Carrito con un producto.
- Carrito con multiples productos/variantes.
- Incrementar y reducir cantidad.
- Eliminar producto.
- Error de stock.
- Calcular envio.
- Avanzar a checkout.

## Riesgos

- Romper AJAX cart por cambiar wrappers.
- Tapar CTA con panel sticky en mobile.
- Alterar totales o subtotales visualmente.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de cambios en carrito.
- QA de flujo compra desde producto hasta checkout.
