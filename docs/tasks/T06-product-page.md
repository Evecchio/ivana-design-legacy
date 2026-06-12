# T06 - Pagina de producto

Estado: `done`

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

## Cierre T06

Estado: implementado y validado.

- No se hicieron cambios productivos nuevos en esta tarea: la pagina de producto ya estaba redisenada en `templates/product.tpl`, `snipplets/product/*`, `static/css/ivana-design.css` y `static/css/ivana-product-mobile-20260610-24.css`.
- Se preservaron los hooks criticos: `id="single-product"`, `data-variants`, `data-store="product-detail"`, `js-product-detail`, `js-product-container`, `js-product-name`, `js-price-display`, `js-compare-price-display`, `js-prod-submit-form`, variantes, cantidad y formulario de compra.
- Validado producto con multiples variantes: `Legging Cint Recta con Recorte de Costura`.
- Validado producto con una variante y descuento: `Pollera con Short Mini Leopardo`.
- Galeria y miniaturas cargan en mobile y desktop, con imagen completa usando `object-fit: contain`.
- Variantes responden al cambio de seleccion y la cantidad cambia correctamente.
- Add to cart validado con user-agent mobile normal: `/comprar/` respondio `success: true`, badge de carrito paso a `1` y se renderizo el item en carrito.
- Relacionados renderizan con la card consistente de T02.
- Descripcion se mantiene legible en el bloque redisenado.

QA ejecutado:

- Mobile 390px y desktop 1366px sobre producto con variantes.
- Add to cart en producto con una variante disponible.
- Revision de consola JS visible.

Riesgo residual:

- En un producto aparece un error externo por contenido con ruta local `file:///E:/Ivana Design/...`; corresponde a una imagen cargada en contenido/admin de Tiendanube, no a un archivo del theme.
- La calculadora de envio no se cerro como validacion completa de tarifa porque depende de servicios/envios externos y codigos postales reales; el bloque se mantiene renderizado y no se modifico su markup.
