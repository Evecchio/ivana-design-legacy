# T03 - Header, navegacion mobile y buscador

Estado: `pending`

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
