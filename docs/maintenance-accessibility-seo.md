# M07 - Accesibilidad y SEO tecnico

Fecha: 2026-06-12

## Objetivo

Mejorar accesibilidad basica y SEO tecnico sin redisenar pantallas ni tocar flujo de compra.

## Auditoria inicial

- El foco visible global ya existe en `static/css/ivana-design.css`.
- El logo principal ya tiene `alt` y `aria-label` basados en el nombre de la tienda.
- El buscador del header no tenia landmark `search` explicito.
- El icono desktop de cuenta funcionaba como link visual sin texto visible.
- El link de carrito dependia del icono y contador, sin nombre accesible explicito.
- Los enlaces externos de WhatsApp, redes e Instagram abrian en pestana nueva sin `rel="noopener noreferrer"`.
- Algunos SVG de iconos decorativos quedaban expuestos a tecnologias asistivas.
- Las categorias destacadas de home tenian labels genericos por posicion, no por nombre de categoria.
- El formulario de newsletter ya tenia input con `aria-label`, pero no tenia nombre accesible para el formulario ni regiones vivas para mensajes AJAX.

## Cambios aplicados

- `snipplets/header/header.tpl`
  - Se agrego `role="search"` y `aria-label` al contenedor del buscador.
- `snipplets/header/utilities/account.tpl`
  - Se agrego `aria-label` al link desktop de cuenta.
  - Se marcaron iconos de usuario como decorativos.
- `snipplets/header/utilities/cart.tpl`
  - Se agrego `aria-label` al link del carrito.
  - Se marco el icono del carrito como decorativo.
- `snipplets/social/social-links.tpl`
  - Se agrego `rel="noopener noreferrer"` a links externos.
  - Se marcaron iconos sociales como decorativos.
- `snipplets/home/home-instafeed.tpl`
  - Se agrego `rel="noopener noreferrer"` a links externos de Instagram.
  - Se marco el icono de Instagram como decorativo.
- `snipplets/home/home-categories.tpl`
  - Se reemplazo el label generico por categoria por un label con nombre de categoria.
- `snipplets/forms/newsletter.tpl`
  - Se agrego nombre accesible al formulario.
  - Se agregaron regiones `aria-live` para mensajes AJAX.
  - Se marco el spinner como decorativo.
- `snipplets/whatsapp-chat.tpl`
  - Se agrego `rel="noopener noreferrer"`.
  - Se marco el icono de WhatsApp como decorativo.
- `snipplets/footer/footer-legal.tpl`
  - Se agrego `rel="noopener noreferrer"` al sello externo configurable.
- `snipplets/footer/footer-navigation.tpl`
  - Se agrego `rel="noopener noreferrer"` a links externos del menu de footer.
- `snipplets/navigation/navigation-secondary.tpl`
  - Se agrego `rel="noopener noreferrer"` a links externos de navegacion secundaria.
- `snipplets/shipping/shipping-calculator.tpl`
  - Se agrego `rel="noopener noreferrer"` al link externo de ayuda de codigo postal.
- `snipplets/social/social-share.tpl`
  - Se agrego `rel="noopener noreferrer"` a acciones de compartir en pestana nueva.
  - Se marcaron iconos de compartir como decorativos.

## Fuera de alcance

- Reordenar headings de paginas.
- Cambiar copy visible.
- Cambiar estilos visuales.
- Modificar formularios funcionales mas alla de atributos seguros.
- Cambiar checkout, variantes, stock, precios, envios o carrito.
- Links de pago, seguimiento y estado de orden dentro de cuenta.

## QA ejecutado

Validado en produccion despues del deploy del commit `fa8fe69`.

- Home mobile `390x844` y desktop `1366x900`.
- Producto `https://www.ivanadesign.com.ar/productos/enteriza-lisa-c-vivos-de-color-oke3n/` en mobile y desktop.
- Contacto `https://www.ivanadesign.com.ar/contacto/` en mobile y desktop.
- Sin errores JS visibles en consola durante la carga.
- Sin scroll horizontal nuevo.
- Buscador con `role="search"` presente.
- Carrito y cuenta con labels accesibles presentes.
- Categorias destacadas con labels por nombre de categoria.
- Links de compartir producto y ayuda de codigo postal sin faltantes de `rel="noopener noreferrer"`.
- Formulario de newsletter con nombre accesible.

## Limitaciones detectadas

- Quedan links externos generados por componentes nativos de Tiendanube sin `rel="noopener noreferrer"`:
  - Defensa del consumidor dentro de `component('claim-info')`.
  - Link de creditos/powered by Tiendanube generado por `new_powered_by_link`.
- No se modificaron porque no salen de markup controlado directamente por snippets del theme y conviene no reemplazar componentes nativos legales/de plataforma en esta etapa.
