# T08 - Footer e institucionales

Estado: `done`

## Objetivo

Mejorar footer, paginas institucionales, contacto, blog y cuenta con una capa visual consistente y segura, sin interferir con formularios ni contenido administrable.

## Contexto de la spec

- Ver `4.6 Footer`.
- Ver `4.10 Paginas institucionales`.
- Ver `7. Backlog tecnico > Epica 8 - Institucionales, footer y contenido rico`.
- Ver `8. Checklist QA por pagina > Footer e institucionales`.

## Archivos candidatos a modificar

- `snipplets/footer/footer.tpl`
- `snipplets/footer/footer-navigation.tpl`
- `snipplets/footer/footer-legal.tpl`
- `templates/page.tpl`
- `templates/contact.tpl`
- `templates/blog.tpl`
- `templates/blog-post.tpl`
- `templates/404.tpl`
- `templates/password.tpl`
- `templates/account/*.tpl` solo ajustes visuales acotados.
- `static/css/ivana-design.css`

## Archivos/hooks que no deben tocarse

- Preservar `data-store="footer"`.
- No romper `snipplets/forms/newsletter.tpl`.
- No cambiar action ni campos de contacto/cancelacion.
- No aplicar CSS invasivo a `page.content` o contenido rico.
- No modificar flujos de cuenta salvo estilos seguros.

## Pasos de implementacion

1. Relevar footer con logo/redes/contacto/menus/newsletter activos e inactivos.
2. Redisenar footer responsive.
3. Mejorar rich content de paginas institucionales.
4. Ajustar contacto y estados success/error.
5. Aplicar mejoras visuales basicas a blog, 404, password y cuenta si corresponde.
6. Validar formularios y links.

## Criterios de aceptacion

- Footer es responsive y legible.
- Menus, redes, contacto y newsletter funcionan.
- Paginas genericas no rompen contenido del admin.
- Contacto muestra errores y success correctamente.
- Blog, 404, password y cuenta mantienen funcionalidad.

## Checklist QA

- Footer mobile y desktop.
- Newsletter.
- Contacto normal.
- Cancelacion/arrepentimiento si esta disponible.
- Page generica con contenido rico.
- Blog y blog post.
- 404 y password.
- Login/registro/cuenta con revision visual basica.

## Riesgos

- Romper formularios por cambiar estructura.
- Afectar contenido HTML arbitrario del admin.
- Ocultar legales o informacion obligatoria.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de cambios en footer/institucionales.
- QA de formularios y contenido administrable.

## Cierre

Cambios implementados:

- Se reforzo la capa visual del footer: grilla responsive, redes, newsletter, medios de pago/envio y legales.
- Se mantuvo `data-store="footer"` y no se modifico `snipplets/forms/newsletter.tpl`.
- Se envolvieron blog y blog post en shells visuales consistentes con paginas institucionales.
- Se agrego una capa de compatibilidad para la 404 publica servida por Tiendanube, evitando scroll horizontal y mejorando legibilidad.
- Se incremento `asset_version` para invalidar cache del CSS.

Validaciones realizadas en tienda publicada:

- Footer mobile y desktop presente con `data-store="footer"`.
- Newsletter conserva `action="/winnie-pooh"`, `data-store="newsletter-form"`, input email y submit.
- Contacto conserva `action="/winnie-pooh"`, `data-store="contact-form"`, `type=contact` y campos `name`, `email`, `phone`, `message`.
- Pagina generica `quienes-somos` renderiza contenido rico sin scroll horizontal.
- Blog renderiza con shell visual y footer.
- Login/cuenta renderiza formulario y footer sin errores JS.
- 404 devuelve status HTTP 404 esperado, mantiene footer y no genera scroll horizontal.

Riesgos restantes:

- La 404 publica mantiene markup propio/cacheado de Tiendanube y no reflejo inmediatamente el cambio estructural de `templates/404.tpl`; por eso el cierre se valido con CSS compatible sobre `#page-error`.
- No se envio newsletter ni formulario de contacto para evitar registros reales; se valido estructura, action y campos.
