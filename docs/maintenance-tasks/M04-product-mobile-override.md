# M04 - Estrategia CSS mobile producto

Estado: `done`

## Objetivo

Decidir si `static/css/ivana-product-mobile-20260610-24.css` queda como override versionado, se renombra/documenta o se consolida parcialmente en `ivana-design.css`.

## Archivos candidatos

- `static/css/ivana-product-overrides.css`
- `static/css/ivana-design.css`
- `layouts/layout.tpl`

## No tocar

- Logica de variantes.
- Add to cart.
- Precios, descuentos, cuotas, transferencia, envio y stock.

## Pasos

1. Mapear reglas del override por bloque funcional.
2. Identificar reglas ya duplicadas en `ivana-design.css`.
3. Proponer estrategia: mantener, consolidar o reemplazar por archivo nuevo.
4. Ejecutar solo un corte chico si el riesgo es bajo.

## Criterios de aceptacion

- Estrategia documentada.
- Producto mobile mantiene imagenes completas, precio, variantes y add to cart.
- No se rompe relacionados ni cards.

## QA

- Producto mobile.
- Producto desktop.
- Add to cart.
- Carrito.

## Resultado

- El override se mantiene separado y cargado despues de `ivana-design.css`.
- Se renombro de `static/css/ivana-product-mobile-20260610-24.css` a `static/css/ivana-product-overrides.css`.
- Se actualizo `layouts/layout.tpl`; el cache busting queda en `asset_version`.
- Se documento el mapa y la estrategia en `docs/maintenance-product-mobile-override.md`.
- No se consolido contenido en `ivana-design.css` porque el archivo protege producto, cards, relacionados, home categories, transferencia, envio e imagenes completas.
- Validacion post-deploy:
  - `ivana-product-overrides.css` carga en producto publicado.
  - `ivana-product-mobile-20260610-24.css` ya no aparece en el HTML publicado.
  - Producto mobile y desktop mantienen imagen completa con `object-fit: contain`.
  - Producto mobile y desktop no presentan scroll horizontal.
  - Mobile: add to cart suma item al carrito y muestra checkout disponible.
  - Desktop: el boton de add to cart esta disponible, pero la variante visible respondio `out_of_stock`; queda registrado como condicion de stock, no como regresion de CSS.
