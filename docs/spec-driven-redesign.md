# Especificacion Spec-Driven Development - Redisenio web Tiendanube

## 1. Estado actual del proyecto

### 1.1 Resumen

Este repositorio contiene el theme Tiendanube de `ivanadesign.com.ar`. Es un theme legacy personalizado, editado directamente sobre archivos `.tpl`, `.scss`, `.css` y `.js.tpl`, sin build local ni dependencias npm visibles.

El redisenio debe implementarse como evolucion visual y UX del theme actual, preservando la compatibilidad con Tiendanube y todos los hooks funcionales que usa la plataforma para producto, variantes, stock, carrito, envios, checkout, busqueda, filtros y cuenta.

### 1.2 Rama actual

- Rama activa relevada: `main`.
- Segun `README.md`, `main` es la unica rama de trabajo y publicacion.
- Los cambios se publican con `git push origin main`.

### 1.3 Stack usado

- Plataforma: Tiendanube.
- Templates: motor propio de Tiendanube con sintaxis tipo Twig/Jinja en archivos `.tpl`.
- CSS: SCSS procesado por Tiendanube y CSS plano adicional.
- JS: JavaScript vanilla y jQuery compatible con Tiendanube mediante `jQueryNuvem` y APIs `LS.*`.
- Assets: archivos dentro de `static/`.
- Deploy: GitHub Actions hacia FTPS usando `lftp`.
- Workflow: `.github/workflows/deploy-ftp.yml`.
- No hay servidor local ni toolchain de build local en el repo.

### 1.4 Estructura de carpetas

- `layouts/`: layout base global del theme.
- `templates/`: templates de pagina completa.
- `templates/account/`: templates de cuenta de usuario.
- `snipplets/`: componentes reutilizables del theme.
- `snipplets/header/`: header, barras de anuncio, modales y utilidades.
- `snipplets/navigation/`: navegacion desktop, mobile, categorias y banners de menu.
- `snipplets/home/`: secciones configurables de home.
- `snipplets/product/`: detalle de producto, imagenes, variantes, cantidad, formulario, descripcion y relacionados.
- `snipplets/cart/`: resumen, totales, panel y fulfillment del carrito.
- `snipplets/grid/`: listado, filtros, paginacion y quick shop.
- `snipplets/footer/`: footer, navegacion y legales.
- `snipplets/forms/`, `snipplets/shipping/`, `snipplets/social/`, `snipplets/svg/`, `snipplets/defaults/`: formularios, envios, redes, iconos y ayudas del editor.
- `static/css/`: estilos del theme.
- `static/js/`: scripts del theme.
- `static/images/`: imagenes estaticas.
- `config/`: settings, defaults, translations, sections, variants y data.
- `docs/`: documentacion del proyecto.

### 1.5 Archivos principales del theme

- `layouts/layout.tpl`: HTML base, head, carga de CSS/JS, header, footer, contenido de templates, quick shop, WhatsApp y datos globales de shipping/cart.
- `templates/home.tpl`: home configurable por orden de secciones.
- `templates/category.tpl`: listado de categoria con banner, breadcrumbs, filtros, ordenamiento y grilla.
- `templates/product.tpl`: detalle de producto con galeria, formulario, descripcion y relacionados.
- `templates/cart.tpl`: carrito, items, fulfillment, resumen y estado vacio.
- `templates/search.tpl`: resultados de busqueda con filtros, ordenamiento y productos sugeridos.
- `templates/page.tpl`: paginas institucionales genericas.
- `templates/contact.tpl`: contacto y cancelacion/arrepentimiento.
- `snipplets/product-item.tpl`: card de producto personalizada con precio, descuento, cuotas, transferencia y stock.
- `snipplets/grid/products-list.tpl`: grilla reutilizada por categoria y busqueda.
- `snipplets/header/header.tpl`: header, logo, buscador, utilidades, navegacion y notificaciones.
- `snipplets/footer/footer.tpl`: footer, contacto, redes, menus, newsletter y legales.
- `static/css/style-tokens.tpl`: tokens CSS configurables.
- `static/css/style-critical.scss`: CSS critico.
- `static/css/style-utilities.scss`: utilidades.
- `static/css/style-async.scss`: CSS no critico.
- `static/css/ivana-design.css`: capa visual personalizada consolidada.
- `static/css/ivana-product-mobile-20260610-24.css`: overrides versionados para producto/mobile y ajustes recientes.
- `static/js/store.js.tpl`: JS principal de Tiendanube/theme.
- `static/js/ivana-card.js.tpl`: normalizacion visual/comercial de cards de producto.

### 1.6 Paginas y layouts existentes

- Layout global: `layouts/layout.tpl`.
- Home: `templates/home.tpl`.
- Categoria/listado: `templates/category.tpl`.
- Producto: `templates/product.tpl`.
- Carrito: `templates/cart.tpl`.
- Busqueda: `templates/search.tpl`.
- Pagina institucional generica: `templates/page.tpl`.
- Contacto/arrepentimiento: `templates/contact.tpl`.
- Blog: `templates/blog.tpl`, `templates/blog-post.tpl`.
- Password: `templates/password.tpl`.
- 404: `templates/404.tpl`.
- Cuenta: login, registro, reset, nueva clave, datos, direcciones, pedidos y detalle de pedido en `templates/account/`.

### 1.7 Componentes ya implementados

- Header con logo, buscador, menu mobile, cuenta, carrito, barras de anuncio, navegacion desktop y categorias mobile.
- Footer con marca/logo, redes, contacto, menus, newsletter y legales.
- Home modular con slider, banners de categorias, banners promocionales, novedades, modulos imagen/texto, institucional, categorias principales, timer offers, video, marcas, testimonios, newsletter, instafeed, destacados, nuevos, ofertas, producto principal e informativos.
- Cards de producto personalizadas con clases `ivana-card`, precio, compare price, descuento, cuotas, precio por transferencia y estados de stock.
- Grilla de productos configurable por columnas mobile/desktop.
- Filtros, modales de filtros, controles y paginacion/infinite scroll.
- Producto con galeria, thumbnails, variantes, cantidad, formulario, medios de pago, envio, descripcion y relacionados.
- Carrito con items AJAX, cambios de cantidad, errores de stock, fulfillment, calculadora/envios, resumen y estado vacio.
- Formularios reutilizables y newsletter.
- WhatsApp chat.
- Quick shop.
- Breadcrumbs, page header, iconos SVG, placeholders y ayudas de editor.

### 1.8 Cambios recientes relevantes

Commits recientes relevados:

- `a12e403` Ajustar espacio superior de categorias destacadas.
- `cb7bd91` Reducir espacio sobre categorias destacadas.
- `dbfc9ad` Equilibrar espaciado de coleccion destacada.
- `131073d` Agrandar coleccion destacada.
- `bcf4819` Alinear badge de transferencia en tarjetas.
- `cb9ef28` Asegurar badge de transferencia en mobile.
- `66ff37d` Alinear badge de transferencia con precio.
- `c62142f` Emprolijar descripcion de producto.
- `9ffb637` Forzar cache busting de producto limpio.
- `8b0c66c` Corregir alineacion de galeria de producto.
- `16bd835` Aplicar preview limpio de producto.
- `6c190c5` Reparar bloque de envios mobile.

Lectura tecnica: los cambios recientes se concentran en producto, cards, transferencia, galeria, descripcion, envios mobile y espaciados de home/categorias destacadas. El redisenio debe partir de esas personalizaciones, no reemplazarlas sin migrar su comportamiento.

### 1.9 Estado del workspace

Al momento del relevamiento habia archivos no trackeados existentes:

- `.codex-remote-attachments/`
- `Previews/preview-featured-collection.html`
- `Previews/preview-product-reference.html`
- `Previews/preview-redesign-completo.html`

No forman parte del deploy por regla de GitHub Actions si terminan como `.html`/no excluidos explicitamente solo dependera de si se commitean. Deben tratarse como previews/reference y no como fuente funcional del theme.

## 2. Contexto Tiendanube

### 2.1 Mapa funcional por area

Layout global:

- `layouts/layout.tpl`
- Incluye head tags, fuentes, tokens, CSS critico, CSS async, CSS Ivana, header, contenido, quick shop, WhatsApp, footer, datos ocultos de free shipping, JS externo, `store.js.tpl`, `ivana-card.js.tpl`, survey y scripts del admin.

Home:

- `templates/home.tpl`
- `snipplets/home/home-section-switch.tpl`
- `snipplets/home/*`
- Depende de `settings.home_order_position_1..18`, assets configurables, `sections.*`, `navigation`, `store.instagram` y flags de preview.

Categoria/listado:

- `templates/category.tpl`
- `snipplets/category-banner.tpl`
- `snipplets/grid/filters-modals.tpl`
- `snipplets/grid/filters-controls.tpl`
- `snipplets/grid/products-list.tpl`
- `snipplets/product_grid.tpl`
- `snipplets/product-item.tpl`
- Usa filtros, ordenamiento, paginacion, infinite scroll y columnas desde settings.

Producto:

- `templates/product.tpl`
- `snipplets/product/product-image.tpl`
- `snipplets/product/product-form.tpl`
- `snipplets/product/product-description.tpl`
- `snipplets/product/product-related.tpl`
- Otros snipplets de producto: variantes, cantidad, pagos, videos, thumbnails, shipping e informative banners.
- Usa `product.variants_object`, `data-store`, clases `js-product-*` y APIs `LS.registerOnChangeVariant`.

Carrito:

- `templates/cart.tpl`
- `snipplets/cart-item-ajax.tpl`
- `snipplets/cart/cart-summary.tpl`
- `snipplets/cart/cart-totals.tpl`
- `snipplets/cart/cart-fulfillment.tpl`
- `snipplets/shipping/*`
- Usa `store.cart_url`, `cart.items`, errores de stock, calculadora de envio y actualizaciones AJAX.

Paginas institucionales:

- `templates/page.tpl`
- `templates/contact.tpl`
- `templates/blog.tpl`
- `templates/blog-post.tpl`
- `templates/404.tpl`
- `templates/password.tpl`
- `templates/account/*`

Header/navegacion:

- `snipplets/header/header.tpl`
- `snipplets/header/header-modals.tpl`
- `snipplets/navigation/*`
- `snipplets/header/utilities/*`
- Usa `component('search/search-form')`, `component('notification')`, settings de logo, nav, colores y utilidades.

Footer:

- `snipplets/footer/footer.tpl`
- `snipplets/footer/footer-navigation.tpl`
- `snipplets/footer/footer-legal.tpl`
- `snipplets/forms/newsletter.tpl`
- `snipplets/contact-links.tpl`
- `snipplets/social/social-links.tpl`

### 2.2 Limitaciones del theme/Tiendanube que deben respetarse

- No introducir build tools obligatorios ni dependencias que Tiendanube no procese.
- Mantener sintaxis `.tpl` compatible con Tiendanube.
- Preservar filtros de Tiendanube como `static_url`, `static_inline`, `translate`, `money`, `product_image_url`, `google_fonts_url`.
- Preservar componentes Tiendanube: `head-tags`, `structured-data`, `fonts`, `sort-by`, `search/search-form`, `product-item`, `notification`, `google-survey`, `image`, alerts y otros.
- No romper `LS.ready`, `LS.*`, `jQueryNuvem`, AJAX cart, shipping calculator, sliders ni infinite scroll.
- Mantener clases `js-*` usadas por Tiendanube y por `store.js.tpl`.
- Mantener atributos `data-store`, `data-component` y formularios con actions/metodos esperados.
- Mantener compatibilidad con el editor/preview de Tiendanube y ayudas en `snipplets/defaults/`.
- Considerar cache/CDN: si se agrega CSS/JS nuevo critico, versionar via `asset_version` o nombre de archivo cuando sea necesario.
- Los archivos `.md` no se deployan segun workflow actual, por lo que esta especificacion no impacta produccion.

### 2.3 Que no debe modificarse sin validacion funcional

No modificar o eliminar sin prueba exhaustiva:

- `store.cart_url` y el `form` principal de carrito.
- `product.variants_object`, `data-variants` y `data-store="product-detail"`.
- Clases `js-product-container`, `js-product-detail`, `js-product-name`, `js-price-display`, `js-compare-price-display`, `js-prod-submit-form`, `js-product-variants-*`, `js-quantity`, `js-cart-*`, `js-ajax-cart-list`.
- Snipplets de variantes, cantidad y formulario de producto si no se conoce el contrato JS.
- `snipplets/cart-item-ajax.tpl`, `snipplets/cart/cart-summary.tpl`, `snipplets/cart/cart-totals.tpl` sin validar AJAX cart.
- `snipplets/shipping/*` y `cart.free_shipping.*` sin validar calculadora y barras de envio gratis.
- `component('product-item')` sin preservar custom content y clases necesarias.
- `component('search/search-form')` sin preservar sugerencias, submit y delete content.
- `component('sort-by')` sin preservar select y comportamiento de ordenamiento.
- `component('notification')` de add to cart, cookies y order status.
- `head_content`, `structured-data`, `google-survey`, `settings.css_code` y `store.assorted_js`.
- Checkout: no intervenir URLs, formularios, parametros ni scripts que Tiendanube usa para iniciar compra.

## 3. Objetivo del redisenio

El objetivo es realizar un redisenio visual completo del theme, con enfoque mobile-first, orientado a conversion y consistencia visual, manteniendo compatibilidad total con Tiendanube.

Objetivos especificos:

- Mejorar UX mobile-first en home, categoria, producto, carrito, header, navegacion y busqueda.
- Reforzar jerarquia comercial: producto, precio, descuento, financiacion, transferencia, stock, envio y CTA.
- Unificar sistema visual: tokens, tipografia, espaciados, botones, cards, formularios y estados.
- Mejorar conversion reduciendo friccion en exploracion, producto y carrito.
- Mejorar performance percibida: CSS acotado, imagenes optimizadas, evitar JS innecesario.
- Mejorar accesibilidad basica: foco visible, labels, contraste, targets tactiles, orden semantico.
- Mantener SEO tecnico provisto por Tiendanube y no romper datos estructurados.
- Evitar regresiones en variantes, stock, precios, carrito, envios y checkout.

## 4. Alcance funcional

### 4.1 Home

Debe cubrir:

- Hero/slider responsive con imagen desktop/mobile y CTA claro.
- Categorias destacadas con mejor ritmo visual y targets tactiles.
- Banners promocionales y novedades.
- Secciones de productos destacados, nuevos y ofertas.
- Producto principal si esta configurado.
- Informative banners/servicios.
- Institucional, testimonios, marcas, video, newsletter e instafeed si existen.
- Ordenamiento por `settings.home_order_position_*`.
- Estado preview/help del editor.

Requisitos:

- Mantener `snipplets/home/home-section-switch.tpl`.
- Respetar `data-store` de cada seccion.
- Evitar duplicar newsletter/instafeed mas de una vez, tal como ya hace `home.tpl`.
- Reutilizar cards de producto existentes.

### 4.2 Categoria/listado

Debe cubrir:

- Header de categoria con breadcrumbs, titulo, descripcion y banner.
- Toolbar desktop con ordenamiento.
- Filtros desktop y mobile.
- Grilla responsive.
- Paginacion o infinite scroll segun settings.
- Estados sin productos y sin resultados de filtros.

Requisitos:

- Mantener `component('sort-by')`.
- Mantener `filters-modals`, `filters-controls`, `products-list`, `pagination`.
- Preservar columnas configurables `settings.grid_columns_mobile` y `settings.grid_columns_desktop`.
- No romper `LS.hybridScroll` ni sliders de producto item.

### 4.3 Producto

Debe cubrir:

- Galeria mobile-first estable, con thumbnails/slider correctos.
- Titulo, precio, compare price, descuento, cuotas y precio por transferencia.
- Variantes, stock, cantidad y CTA principal.
- Mensajes de envio gratis, calculadora y fulfillment.
- Descripcion de producto legible y escaneable.
- Productos relacionados/complementarios.
- Video si existe.

Requisitos:

- Preservar `id="single-product"`, `data-variants`, `data-store`.
- Mantener formulario de producto y clases `js-*`.
- No esconder controles de variante o stock.
- No cambiar logica de add to cart sin test de flujo completo.
- Mantener compatibilidad con productos con una variante, multiples variantes, sin stock y precio no visible.

### 4.4 Carrito

Debe cubrir:

- Lista de items clara en mobile y desktop.
- Controles de cantidad, subtotales y eliminacion.
- Errores de stock.
- Fulfillment y calculadora de envio.
- Barra/mensaje de envio gratis.
- Resumen sticky o visible sin tapar contenido.
- CTA hacia checkout.
- Estado vacio con CTA a productos.

Requisitos:

- Preservar `form action="{{ store.cart_url }}" method="post"`.
- Preservar `.js-ajax-cart-list`, `cart-item-ajax.tpl`, `cart-summary.tpl`.
- No modificar nombres de inputs de cantidades ni estructura critica del componente carrito.
- Validar actualizacion AJAX y errores de stock.

### 4.5 Header

Debe cubrir:

- Logo visible y optimizado.
- Buscador usable en mobile y desktop.
- Menu mobile.
- Acceso a cuenta.
- Carrito con badge.
- Barras de anuncio.
- Navegacion desktop y categorias mobile si estan activadas.

Requisitos:

- Mantener `component('search/search-form')`.
- Mantener utilities de cuenta, carrito, idioma y menu.
- Mantener modales del header.
- Mantener notificacion add to cart si `settings.ajax_cart`.

### 4.6 Footer

Debe cubrir:

- Marca/logo.
- Redes.
- Contacto.
- Menus principal/secundario.
- Newsletter.
- Legales y medios/pagos si el snipplet los renderiza.

Requisitos:

- Preservar `data-store="footer"`.
- No romper `newsletter.tpl`.
- Mantener contenido condicional por settings y pagina password.

### 4.7 Navegacion mobile

Debe cubrir:

- Menu hamburguesa.
- Categorias principales.
- Navegacion secundaria si aplica.
- Busqueda accesible.
- Targets minimos de 44px.
- Cierre claro de modales/paneles.

Requisitos:

- Mantener `navigation-panel.tpl`, `navigation-list-hamburger.tpl`, `navigation-categories-mobile.tpl` y hooks del header.

### 4.8 Buscador

Debe cubrir:

- Campo visible y usable.
- Estados focus, loading/sugerencias si Tiendanube los provee.
- Pagina de resultados `search.tpl`.
- Estado sin resultados.
- Productos sugeridos cuando existan.

Requisitos:

- No reemplazar el componente nativo salvo que se preserve su API.

### 4.9 Banners y secciones promocionales

Debe cubrir:

- Banners de categorias.
- Banners promocionales.
- Banners de novedades.
- Modulos imagen/texto.
- Timer offers.
- Informative banners.

Requisitos:

- Mantener imagenes desktop/mobile configurables.
- Respetar settings de margenes y visibilidad.
- CTA y textos deben seguir siendo editables desde admin.

### 4.10 Paginas institucionales

Debe cubrir:

- `page.tpl`: contenido rico `page.content`.
- `contact.tpl`: contacto, cancelacion/arrepentimiento y consulta por producto.
- Blog y blog post, al menos con compatibilidad visual basica.
- Cuenta: no entra como redisenio profundo salvo ajustes visuales seguros.

Requisitos:

- No alterar formularios de contacto/cuenta sin QA.
- Mantener contenidos generados por el admin sin CSS invasivo que rompa HTML arbitrario.

## 5. Alcance visual

### 5.1 Sistema visual

Definir una capa visual unificada basada en:

- Tokens del theme en `static/css/style-tokens.tpl`.
- Variables existentes de marca y settings del admin.
- Prefijo de personalizaciones: `ivana-`.
- Wrappers por pagina: `ivana-home-shell`, `ivana-category-shell`, `ivana-product-shell`, `ivana-cart-shell`, `ivana-page-shell`, `ivana-contact-shell`.

Lineamientos:

- Mobile-first.
- Estetica premium, clara y comercial.
- Evitar saturacion de magenta: usarlo como acento/accion, no como unico color dominante.
- Fondos neutros, buen contraste, separadores sutiles.
- Bordes y sombras moderadas.
- Cards con radio consistente.
- Espaciado vertical coherente entre secciones.

### 5.2 Jerarquia tipografica

Definir escalas:

- H1 pagina: alto impacto pero ajustado a mobile.
- H2 seccion: claro, escaneable.
- H3/card title: compacto, maximo 2 lineas cuando aplique.
- Body: legible en 14-16px minimo.
- Meta/kicker: uso acotado para contexto.

Requisitos:

- No usar tamanos que generen overflow en mobile.
- No depender de `vw` para tipografia.
- Mantener fuentes configurables de Tiendanube: `settings.font_headings`, `settings.font_rest`.

### 5.3 Espaciados

Definir escala base:

- 4px: micro.
- 8px: separacion interna pequena.
- 12px: separacion entre elementos relacionados.
- 16px: padding base mobile.
- 24px: grupos/secciones compactas.
- 32px: bloques medianos.
- 48px/64px: secciones desktop.

Requisitos:

- Home y categoria deben evitar saltos excesivos entre secciones.
- Producto y carrito deben priorizar densidad comercial en mobile.
- Header sticky no debe tapar anchors, filtros ni contenido.

### 5.4 Botones

Tipos:

- Primario: compra/CTA principal.
- Secundario: navegacion o acciones de menor prioridad.
- Link button: acciones textuales.
- Icon button: header, menu, carousel, cerrar.

Estados:

- Default.
- Hover.
- Focus visible.
- Active.
- Disabled/loading.

Requisitos:

- Minimo 44px de alto en mobile.
- Texto sin overflow.
- CTA de producto y carrito debe ser el mas prominente.

### 5.5 Cards de producto

Las cards deben incluir:

- Imagen con aspect ratio consistente.
- Nombre.
- Precio actual.
- Precio anterior si hay descuento real.
- Badge descuento si corresponde.
- Cuotas.
- Precio transferencia con badge.
- Estado bajo stock/sin stock.
- Click area clara hacia producto.

Requisitos:

- Mantener `snipplets/product-item.tpl` y `component('product-item')`.
- Mantener `ivana-card-*` o migrarlos de forma controlada.
- Validar cards en home, categoria, busqueda, relacionados y sliders.

### 5.6 Estados hover/focus/disabled

- Hover desktop: elevar sutilmente card, resaltar CTA o link.
- Focus: outline visible, no solo cambio de color.
- Disabled: opacidad y cursor/estado claro sin ocultar informacion.
- Loading: no generar layout shift.
- Sin stock: comunicar sin bloquear informacion de producto.

### 5.7 Estilo responsive

Breakpoints sugeridos:

- Mobile base: 320-767px.
- Tablet: 768-991px.
- Desktop: 992-1199px.
- Large desktop: 1200px+.

Requisitos:

- Mobile es fuente de verdad.
- No debe haber scroll horizontal.
- Header, filtros, galeria, carrito y cards deben ser prioridad QA.

### 5.8 Componentes reutilizables

Crear o consolidar estilos para:

- Page hero.
- Section header.
- Product card.
- Promo banner.
- Form field.
- Button.
- Badge.
- Empty state.
- Breadcrumbs.
- Toolbar/filtros.
- Summary panel.
- Rich content.

## 6. Requisitos tecnicos

### 6.1 Archivos candidatos a modificar

CSS:

- `static/css/style-tokens.tpl`
- `static/css/style-critical.scss`
- `static/css/style-utilities.scss`
- `static/css/style-async.scss`
- `static/css/ivana-design.css`
- `static/css/ivana-product-mobile-20260610-24.css` o reemplazo versionado equivalente.

Layout:

- `layouts/layout.tpl` solo para agregar/quitar assets, versionado o wrappers globales estrictamente necesarios.

Templates:

- `templates/home.tpl`
- `templates/category.tpl`
- `templates/product.tpl`
- `templates/cart.tpl`
- `templates/search.tpl`
- `templates/page.tpl`
- `templates/contact.tpl`

Snipplets:

- `snipplets/header/header.tpl`
- `snipplets/footer/footer.tpl`
- `snipplets/home/*`
- `snipplets/product/*`
- `snipplets/product-item.tpl`
- `snipplets/grid/*`
- `snipplets/cart/*`
- `snipplets/forms/*`
- `snipplets/navigation/*`

JS solo si es imprescindible:

- `static/js/ivana-card.js.tpl`
- `static/js/store.js.tpl` con extrema cautela.

### 6.2 Archivos que no deben tocarse salvo necesidad validada

- `.github/workflows/deploy-ftp.yml`, salvo cambios de deploy.
- `config/translations.txt`, salvo nuevos textos traducibles necesarios.
- `config/settings.txt`, `config/defaults.txt`, `config/sections.txt`, salvo que el redisenio requiera settings administrables nuevos.
- `static/js/external*.js.tpl`, salvo actualizacion de librerias justificada.
- `static/checkout.scss.tpl`, salvo pedido explicito sobre checkout.
- `snipplets/shipping/*`, salvo QA exhaustivo de envios.
- `templates/account/*`, salvo ajustes visuales no invasivos.
- Cualquier hook `js-*`, `data-store`, `data-component` sin rastrear su uso.

### 6.3 Convenciones CSS

- Usar prefijo `ivana-` para nuevas clases.
- Preferir estilos acotados por wrapper de pagina.
- Evitar selectores globales invasivos.
- Evitar `!important`; usarlo solo para sobrescribir componentes Tiendanube cuando no haya alternativa.
- Agrupar CSS por dominio: tokens, base, header, home, product card, category, product, cart, footer, responsive.
- Mantener comentarios cortos para bloques complejos.
- No duplicar reglas ya existentes sin limpiar o consolidar.

### 6.4 Convenciones JS

- No introducir frameworks.
- Usar vanilla JS o `jQueryNuvem` de forma consistente con el repo.
- Ejecutar comportamiento dependiente del DOM dentro de `LS.ready.then` o eventos existentes.
- No romper eventos de Tiendanube: `cart.updated`, `LS.registerOnChangeVariant`, sliders, shipping.
- JS nuevo debe ser progresive enhancement: el flujo compra debe funcionar aunque falle.

### 6.5 Compatibilidad responsive

- QA minimo en 320, 375, 390, 768, 1024, 1366px.
- Revisar header sticky, nav mobile, filtros, galeria, CTA producto, carrito y footer.
- Evitar unidades que generen overflow.
- Usar `aspect-ratio`, `minmax`, `max-width` y grids fluidos donde aplique.

### 6.6 Performance

- Mantener CSS critico acotado.
- Evitar JS visual para tareas que puedan resolverse con CSS.
- Evitar cargar nuevos assets externos.
- Usar imagenes responsive de Tiendanube y `loading="lazy"` donde corresponda.
- No bloquear LCP con CSS/JS nuevo.
- Mantener `preload-images.tpl` y preloads existentes.
- Versionar assets modificados si CDN demora en invalidar.

### 6.7 Accesibilidad basica

- Foco visible en links, botones, inputs, selects y controles de carousel.
- Labels asociados a formularios.
- Contraste suficiente en texto, badges y botones.
- Alt text correcto en imagenes configurables cuando sea posible.
- Targets touch de 44px minimo.
- Orden semantico de headings.
- No depender solo de color para descuentos, stock o errores.
- Respetar modales y cierres accesibles existentes.

### 6.8 SEO basico

- Mantener `component('head-tags')` y `component('structured-data')`.
- Un solo H1 por pagina principal cuando sea controlable.
- No ocultar contenido principal con CSS que afecte indexacion.
- Mantener breadcrumbs.
- Usar textos reales en CTAs y secciones, no imagenes con texto critico como unica fuente.
- Cuidar performance mobile.

### 6.9 Manejo de imagenes

- Usar componentes/filtros de Tiendanube para imagenes de producto y assets configurables.
- Mantener `loading="eager"`/`fetchpriority="high"` solo para logo/LCP real.
- Lazy load en grillas y secciones below the fold.
- Definir dimensiones/aspect ratio para evitar layout shift.
- Asegurar alternativas mobile para sliders/banners configurables.

## 7. Backlog tecnico

### Epica 1 - Fundacion visual

User story:

Como visitante, quiero una interfaz consistente y legible para reconocer facilmente la marca y navegar sin friccion.

Criterios de aceptacion:

- Existe una escala visual documentada en CSS.
- Botones, inputs, badges, headings y cards comparten tokens.
- No hay cambios funcionales en hooks Tiendanube.
- El sitio no presenta scroll horizontal en mobile.

Tareas:

- Auditar `ivana-design.css` y consolidar reglas duplicadas.
- Definir tokens de color, radio, sombras, espaciado y tipografia.
- Crear estilos base para botones, forms, badges, section headers y empty states.
- Definir estados hover/focus/disabled.

### Epica 2 - Header, navegacion y busqueda

User story:

Como comprador mobile, quiero encontrar categorias, buscar productos y acceder al carrito rapidamente.

Criterios de aceptacion:

- Header funciona en mobile y desktop.
- Buscador mantiene sugerencias/comportamiento nativo.
- Menu mobile abre/cierra correctamente.
- Badge de carrito actualiza tras agregar productos.

Tareas:

- Ajustar layout responsive del header.
- Mejorar targets tactiles de utilidades.
- Estilizar buscador y estados focus.
- Revisar modales/paneles de navegacion.
- QA de add to cart notification.

### Epica 3 - Home comercial

User story:

Como visitante, quiero entender rapidamente la propuesta, ver categorias/promos y descubrir productos relevantes.

Criterios de aceptacion:

- Todas las secciones configuradas se renderizan correctamente.
- Home es responsive y sin saltos visuales fuertes.
- Banners y productos son clickeables y legibles.
- Se mantienen estados preview/help.

Tareas:

- Redisenar hero/slider.
- Ajustar categorias destacadas.
- Redisenar bloques promocionales.
- Unificar headers de seccion.
- Validar featured/new/sale/main product.
- QA con secciones activas e inactivas.

### Epica 4 - Card de producto

User story:

Como comprador, quiero comparar productos rapidamente viendo imagen, precio, descuento, cuotas, transferencia y stock.

Criterios de aceptacion:

- Card funciona en home, categoria, busqueda, relacionados y sliders.
- Descuento solo aparece cuando hay descuento real.
- Precio transferencia y cuotas son legibles en mobile.
- Bajo stock/sin stock no rompe layout.

Tareas:

- Consolidar markup visual en `snipplets/product-item.tpl`.
- Revisar dependencia con `ivana-card.js.tpl`.
- Definir aspect ratio y alturas estables.
- QA con productos con/sin descuento, sin stock, bajo stock y sin precio visible.

### Epica 5 - Categoria y busqueda

User story:

Como comprador, quiero filtrar, ordenar y explorar listados de producto sin perder contexto.

Criterios de aceptacion:

- Filtros funcionan en mobile y desktop.
- Ordenamiento funciona.
- Infinite scroll/paginacion funciona segun settings.
- Estados sin resultados son claros.

Tareas:

- Redisenar header de categoria.
- Mejorar sidebar/toolbar de filtros.
- Ajustar grilla responsive.
- Unificar `search.tpl` con criterios visuales de categoria.
- QA con filtros aplicados y sin productos.

### Epica 6 - Producto

User story:

Como comprador, quiero elegir variantes, entender precio/envio y agregar al carrito con confianza.

Criterios de aceptacion:

- Variantes actualizan precio, imagen y stock.
- CTA agrega al carrito.
- Galeria no se desborda en mobile.
- Shipping calculator funciona.
- Descripcion y relacionados se ven correctamente.

Tareas:

- Redisenar layout mobile-first de producto.
- Mejorar bloque comercial: precio, descuento, cuotas, transferencia.
- Revisar variantes y cantidad.
- Redisenar fulfillment/envios sin tocar logica.
- Mejorar descripcion y relacionados.
- QA con multiples tipos de producto.

### Epica 7 - Carrito y conversion final

User story:

Como comprador, quiero revisar mi compra, ajustar cantidades y avanzar a checkout sin confusion.

Criterios de aceptacion:

- Cantidades actualizan subtotales.
- Errores de stock se muestran.
- Resumen y CTA checkout funcionan.
- Envio gratis/calculadora funcionan.
- Estado vacio ofrece salida clara.

Tareas:

- Redisenar items mobile.
- Mejorar panel de resumen.
- Revisar sticky summary.
- Estilizar errores y empty state.
- QA de flujo desde producto hasta checkout.

### Epica 8 - Institucionales, footer y contenido rico

User story:

Como visitante, quiero encontrar informacion de contacto, politicas y contenido institucional de forma clara.

Criterios de aceptacion:

- Footer responsive y legible.
- Newsletter funciona.
- Contacto envia o muestra errores correctamente.
- `page.content` no se rompe con HTML del admin.

Tareas:

- Redisenar footer.
- Estilizar paginas genericas.
- Mejorar contacto.
- QA blog, 404, password y cuenta con ajustes no invasivos.

### Epica 9 - QA, performance y compatibilidad Tiendanube

User story:

Como duenio de la tienda, quiero que el redisenio mejore la experiencia sin romper ventas ni administracion.

Criterios de aceptacion:

- No hay errores JS visibles.
- Flujo compra completo funciona.
- Core pages responsive.
- Performance no empeora de forma critica.
- Theme sigue editable desde Tiendanube.

Tareas:

- QA responsive por pagina.
- QA funcional de producto/categoria/carrito.
- Revisar consola JS.
- Revisar imagenes y LCP.
- Validar editor/preview cuando sea posible.

## 8. Checklist QA por pagina

### Home

- Slider/hero desktop y mobile renderiza.
- Banners configurables renderizan o muestran help en preview.
- Categorias destacadas no tienen overflow.
- Productos destacados/nuevos/ofertas usan cards correctas.
- Newsletter/instafeed no se duplican.
- CTAs navegan correctamente.
- No hay scroll horizontal.

### Categoria

- Breadcrumbs, titulo y descripcion correctos.
- Banner de categoria correcto.
- Ordenamiento funciona.
- Filtros abren, aplican y limpian.
- Grilla respeta columnas configuradas.
- Infinite scroll o paginacion funciona.
- Estado sin productos correcto.

### Busqueda

- Query se muestra correctamente.
- Resultados renderizan.
- Sin resultados muestra mensaje y sugeridos si existen.
- Filtros/ordenamiento funcionan si aplican.
- No hay caracteres rotos nuevos.

### Producto

- Galeria carga imagen principal y thumbnails.
- Variantes cambian estado/precio/imagen.
- Producto sin stock muestra estado correcto.
- Cantidad funciona.
- Add to cart funciona.
- Notificacion add to cart funciona si esta activa.
- Shipping calculator funciona.
- Descripcion es legible.
- Relacionados renderizan.

### Carrito

- Items renderizan con imagen, nombre, variante, cantidad, precio y subtotal.
- Cambiar cantidad actualiza subtotal.
- Eliminar item funciona.
- Error de stock se muestra.
- Envio gratis/fulfillment funcionan.
- Resumen muestra totales correctos.
- CTA checkout funciona.
- Estado vacio funciona.

### Header y navegacion

- Logo carga y linkea a home.
- Menu mobile abre/cierra.
- Buscador envia query y muestra sugerencias si aplica.
- Cuenta linkea correctamente.
- Carrito abre o linkea correctamente.
- Barras de anuncio no tapan contenido.
- Header sticky no bloquea controles.

### Footer e institucionales

- Footer responde correctamente en mobile.
- Menus y links funcionan.
- Redes y contacto funcionan.
- Newsletter valida/envia.
- Paginas genericas no rompen contenido rico.
- Contacto muestra success/error.

## 9. Riesgos tecnicos

- Romper hooks `js-*` usados por `store.js.tpl`.
- Alterar estructura de formularios de producto o carrito y romper add to cart/checkout.
- Romper variantes, stock o precios por cambios en markup.
- CSS global con efectos laterales en cuenta, blog, checkout o admin preview.
- Cambios en sliders que afecten Swiper/LS.
- Overlays/sticky que tapen botones en mobile.
- Cache CDN si se modifica CSS versionado sin cambiar version.
- Imagenes sin dimensiones que generen layout shift.
- Incompatibilidad con settings del admin cuando se asume una seccion siempre presente.
- Caracteres con encoding incorrecto en textos existentes.

## 10. Dependencias

- Acceso al admin/preview de Tiendanube para validar configuraciones reales.
- Productos de prueba con:
  - Variantes multiples.
  - Sin variantes.
  - Con descuento.
  - Sin descuento.
  - Bajo stock.
  - Sin stock.
  - Con envio calculable.
- Categorias con y sin banner.
- Filtros activos.
- Carrito con productos de distintas variantes.
- Credenciales/secrets de deploy ya configurados en GitHub Actions.
- Confirmacion de assets definitivos de marca, banners y fotografia.

## 11. Orden recomendado de implementacion

1. Congelar baseline: capturas y QA rapido del estado actual en home, categoria, producto y carrito.
2. Consolidar tokens y componentes visuales base.
3. Redisenar card de producto y validar en todos los contextos.
4. Redisenar header, navegacion mobile y buscador.
5. Redisenar home seccion por seccion.
6. Redisenar categoria y busqueda.
7. Redisenar producto preservando hooks.
8. Redisenar carrito y flujo final.
9. Ajustar footer e institucionales.
10. QA integral mobile/desktop, consola JS y flujo compra.
11. Versionar assets y publicar por `main`.

## 12. Criterios de aceptacion generales

El redisenio se considera terminado cuando:

- Todas las paginas principales son responsive: home, categoria, busqueda, producto, carrito, page/contact y footer/header global.
- No se rompe el flujo de compra.
- Producto, categoria y carrito funcionan correctamente.
- Variantes, stock, precios, cuotas, transferencia, envios y carrito se mantienen correctos.
- El diseno es consistente en tipografia, botones, cards, espaciados, estados y colores.
- No hay errores JS visibles en consola durante flujos principales.
- No hay regresiones criticas en mobile.
- No existe scroll horizontal involuntario.
- El sitio mantiene compatibilidad con Tiendanube, sus componentes, settings del admin y deploy actual.
- Los archivos sensibles no fueron modificados sin QA funcional.
- El redisenio mejora la claridad comercial y reduce friccion en exploracion, decision y checkout.
