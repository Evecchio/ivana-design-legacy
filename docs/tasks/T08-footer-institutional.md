# T08 - Footer e institucionales

Estado: `pending`

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
