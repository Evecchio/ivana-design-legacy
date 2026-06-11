# T03 - Header, navegacion mobile y buscador

Estado: `done`

## Objetivo

Mejorar header, navegacion mobile, utilidades y buscador para que sean claros, tactiles y consistentes, sin romper componentes nativos de Tiendanube.

## Contexto de la spec

- Ver `4.5 Header`.
- Ver `4.7 Navegacion mobile`.
- Ver `4.8 Buscador`.
- Ver `7. Backlog tecnico > Epica 2 - Header, navegacion y busqueda`.

## Archivos candidatos a modificar

- `snipplets/header/header.tpl`
- `snipplets/header/header-modals.tpl`
- `snipplets/header/utilities/*.tpl`
- `snipplets/navigation/*.tpl`
- `static/css/ivana-design.css`
- `static/css/style-critical.scss`
- `static/css/style-async.scss`

## Archivos/hooks que no deben tocarse

- Preservar `component('search/search-form')`.
- Preservar `component('notification')` para add to cart, cookies y order status.
- No eliminar utilities de cuenta, carrito, idioma ni menu.
- No romper `js-head-main`, `js-head-row`, `js-main-categories-container` ni nav desktop hooks.

## Pasos de implementacion

1. Relevar estructura actual del header, modales y navegacion.
2. Ajustar layout mobile-first: menu, logo, buscador, cuenta y carrito.
3. Mejorar targets tactiles y focus visible.
4. Estilizar buscador sin reemplazar el componente nativo.
5. Revisar navegacion desktop y categorias mobile.
6. Validar que notificaciones y modales sigan apareciendo correctamente.

## Criterios de aceptacion

- Header funciona en mobile y desktop.
- Menu mobile abre y cierra correctamente.
- Buscador envia query y mantiene sugerencias si Tiendanube las provee.
- Badge de carrito se mantiene visible y funcional.
- Barras de anuncio no tapan contenido.
- Header sticky no bloquea filtros, anchors ni CTAs.

## Checklist QA

- Mobile 320, 375 y 390px: logo, menu, search y carrito sin overflow.
- Desktop 1024 y 1366px: nav desktop y buscador alineados.
- Probar busqueda desde header.
- Probar add to cart y notificacion.
- Probar cuenta/carrito/idioma si estan activos.

## Riesgos

- Romper el componente de busqueda por cambiar clases internas.
- Crear overlays que tapen CTA de producto o filtros.
- Desalinear header sticky con controles de categoria.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de cambios de header/nav/search.
- Validaciones de navegacion y buscador documentadas.

## Cierre T03

Cambios realizados:

- Ajustados los targets tactiles del header mobile para menu y carrito a 44x44px sin modificar los hooks nativos.
- Ampliado el buscador mobile para ocupar el ancho util del grid del header.
- Preservado `component('search/search-form')`, `component('notification')`, `js-head-main`, `js-head-row`, `js-main-categories-container`, `#nav-hamburger` y `#modal-cart`.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260611-03` para evitar cache viejo del CSS principal.

Validaciones post-deploy:

- Mobile 320px: menu 44x44, carrito 44x44, buscador 291px, sin errores JS.
- Mobile 375px: menu 44x44, carrito 44x44, buscador 344px, sin errores JS.
- Mobile 390px: menu 44x44, carrito 44x44, buscador 358px, sin errores JS.
- Desktop 1024/1366px: nav desktop visible y buscador alineado.
- Menu mobile abre `#nav-hamburger` y muestra navegacion principal.
- Busqueda desde header navega a `/search/?q=bikini` y renderiza resultados.
- Carrito abre `#modal-cart` y conserva `.js-ajax-cart-list`.

Riesgo residual:

- `scrollWidth` mobile queda 1-3px por encima del viewport por slides duplicados de Swiper fuera de pantalla, no por el header. Revisar junto con T04/T05 si aparece scroll horizontal perceptible.
