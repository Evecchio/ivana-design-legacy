# Auditoria de limpieza progresiva del theme legacy

Fecha: 2026-06-11

Fuente de verdad funcional: `docs/spec-driven-redesign.md`.

Objetivo: detectar redundancia, archivos no referenciados y practicas ineficientes antes de avanzar con el redisenio. Esta auditoria prioriza seguridad Tiendanube: checkout, producto, variantes, stock, precios, carrito y envios no deben tocarse sin QA funcional.

## Resumen ejecutivo

El repositorio tiene una base funcional pero acumula varias capas de parches visuales. La deuda principal esta en CSS, no en templates: `static/css/ivana-design.css` funciona como hoja maestra de overrides y contiene multiples generaciones de reglas para cards, producto, header y responsive.

La primera limpieza segura no debe borrar logica del theme. Debe empezar por higiene de deploy, documentacion de referencias y aislamiento de archivos no productivos. La consolidacion real de CSS/JS tiene que hacerse por etapas con capturas baseline y prueba del flujo de compra en la web publicada.

## Baseline visual publicado

Capturas tomadas con Playwright sobre `https://www.ivanadesign.com.ar/` y guardadas localmente en `output/playwright/cleanup-baseline/`:

- `home-mobile.png`
- `home-desktop.png`
- `category-mobile.png`
- `category-desktop.png`
- `product-mobile.png`
- `product-desktop.png`
- `cart-mobile.png`
- `cart-desktop.png`

Producto usado para baseline:

- `https://www.ivanadesign.com.ar/productos/enteriza-lisa-c-vivos-de-color-oke3n/`

Nota: `output/` esta excluido de git y del deploy. Las capturas son evidencia local para comparar antes/despues durante la limpieza.

## Hallazgos

### Deploy y archivos no productivos

Riesgo: medio.

- El workflow FTPS excluia `.git/`, `.github/`, `.claude/`, `.vscode/`, `*.md`, `*.vsix`, `acceso-ftp.txt`, `solution.js` y `sesiones/`.
- No excluia explicitamente `docs/`, `Previews/`, `.codex-remote-attachments/`, `output/` ni `screenshots/`.
- `docs/` es documentacion operativa y no debe subir a Tiendanube.
- `Previews/` contiene HTML standalone de referencia, no templates productivos.

Accion aplicada:

- Se agregaron exclusiones explicitas al deploy FTPS para `docs/`, `Previews/`, `.codex-remote-attachments/`, `output/` y `screenshots/`.
- Se agregaron artefactos locales a `.gitignore`.

### Previews

Riesgo: bajo si quedan excluidos del deploy.

Archivos actuales:

- `Previews/preview-featured-collection.html`
- `Previews/preview-product-reference.html`
- `Previews/preview-redesign-completo.html`

Lectura:

- Sirven como referencia visual y prototipos HTML.
- No deben cargarse como parte del theme productivo.
- Conviene conservarlos versionados solo como documentacion visual.

Accion aplicada:

- Se agrega `Previews/README.md` para declarar su uso y limite.

### CSS principal Ivana

Riesgo: alto.

Archivo:

- `static/css/ivana-design.css`

Datos relevados:

- Peso aproximado: 196 KB.
- Usos de `!important`: 2299.
- Contiene comentarios que indican consolidacion de multiples archivos `ivana-*`.
- Incluye capas legacy, patches, fixes y overrides finales.
- Hay multiples bloques para `.ivana-card`, transferencia, producto, header, categorias y responsive.

Lectura:

- Es funcional, pero dificil de mantener.
- El orden de cascada parece sostener fixes recientes; borrar bloques sin screenshots podria reintroducir bugs.
- La consolidacion debe hacerse por dominios y con comparacion visual.

Recomendacion:

1. Crear baseline visual de home, categoria, producto, carrito y busqueda.
2. Agrupar CSS por dominios sin cambiar reglas.
3. Eliminar duplicados solo cuando la regla posterior cubra completamente a la anterior.
4. Reducir `!important` de a grupos pequenos.

### CSS mobile de producto

Riesgo: alto.

Archivo:

- `static/css/ivana-product-mobile-20260610-24.css`

Datos relevados:

- Peso aproximado: 20 KB.
- Usos de `!important`: 273.
- Esta cargado explicitamente desde `layouts/layout.tpl`.
- Su nombre versionado fuerza cache busting.

Lectura:

- Es un override temporal/urgente para producto mobile y cards.
- Probablemente corrige bugs recientes de galeria, envios, transferencia y descripcion.
- No debe consolidarse hasta tener capturas y QA de producto.

Recomendacion:

- Mantenerlo por ahora.
- En etapa intermedia, decidir si se absorbe en `ivana-design.css` o se reemplaza por un archivo versionado nuevo y documentado.

### CSS no referenciado: ivana-orchestrator

Riesgo: bajo-medio.

Archivo:

- `static/css/ivana-orchestrator.css` (movido a `Previews/ivana-orchestrator.css`)

Datos relevados:

- Esta trackeado.
- No aparece referenciado por `layouts/`, `templates/`, `snipplets/`, `static/`, `config/`, `docs/`, `README.md` ni `CLAUDE.md`, salvo por su propio contenido.
- Define una capa `body.luxury-mode`, pero `layout.tpl` no agrega esa clase ni carga ese CSS.

Lectura:

- Parece experimento o capa futura no activa.
- Al no estar cargado, no afecta produccion.
- Puede eliminarse en etapa conservadora si se acepta perder esa referencia experimental.

Accion aplicada:

- Se movio a `Previews/ivana-orchestrator.css` para conservarlo como referencia sin mantenerlo dentro de assets productivos.

### CSS critico y async base

Riesgo: medio-alto.

Archivos:

- `static/css/style-critical.scss`
- `static/css/style-async.scss`
- `static/css/style-utilities.scss`
- `static/css/style-tokens.tpl`

Datos relevados:

- `style-critical.scss` tambien contiene `!important`, pero forma parte del theme base.
- `style-async.scss` contiene menos overrides fuertes.
- `style-tokens.tpl` define tokens y variables usadas por el theme.

Lectura:

- No son el primer lugar para borrar.
- Cualquier limpieza debe distinguir base Tiendanube vs personalizacion Ivana.

Recomendacion:

- Tocar solo cuando una regla duplicada este claramente reemplazada por `ivana-design.css`.

### JS Ivana

Riesgo: medio-alto.

Archivo:

- `static/js/ivana-card.js.tpl`

Lectura:

- Normaliza nombres, descuentos, compare price, cuotas, badges y orden de elementos de card.
- Puede estar compensando limitaciones del componente nativo `product-item`.
- Hay riesgo de duplicar responsabilidades con `snipplets/product-item.tpl`, que ya construye contenido personalizado.

Recomendacion:

- No borrar en etapa conservadora.
- En etapa intermedia, comparar markup real renderizado y determinar si parte de la normalizacion ya no es necesaria.

### Parches inline en layout

Riesgo: bajo-medio.

Archivo:

- `layouts/layout.tpl`

Hallazgo:

- Existe un `<style>` inline para reforzar centrado de `.ivana-home-section-title`.
- La misma regla ya existe en `static/css/ivana-design.css`.

Lectura:

- Es un parche visible y facil de mover a CSS.
- No conviene eliminarlo hasta confirmar que `ivana-design.css` cubre la misma regla con igual prioridad.

Accion aplicada:

- Se retiro el bloque inline de `layouts/layout.tpl` porque la regla equivalente ya esta cubierta por `static/css/ivana-design.css`.

## Plan de limpieza por etapas

### Etapa 0 - Higiene y auditoria

Estado: aplicada parcialmente.

- Crear esta auditoria.
- Excluir documentacion/previews/artefactos del deploy.
- Documentar `Previews/` como referencia.
- No tocar CSS/JS funcional.

### Etapa 1 - Conservadora

Objetivo: quitar ruido sin afectar produccion.

Tareas:

- Confirmar visualmente que `ivana-orchestrator.css` no esta cargado en produccion.
- Eliminar o mover `ivana-orchestrator.css` a referencia si se decide conservarlo.
- Retirar el inline style de `layout.tpl` si ya queda cubierto.
- Corregir documentacion desactualizada que menciona previews en raiz.

Estado:

- Confirmado en HTML publicado: `ivana-orchestrator.css` no aparece cargado.
- Confirmado en HTML publicado: `ivana-design.css` y `ivana-product-mobile-20260610-24.css` si aparecen cargados.
- Retirado el inline style duplicado de `layouts/layout.tpl`.
- Movido `static/css/ivana-orchestrator.css` a `Previews/ivana-orchestrator.css`.
- Actualizada documentacion desactualizada sobre previews en `CLAUDE.md` y `docs/spec-driven-redesign.md`.

QA minimo:

- Home desktop/mobile.
- Producto desktop/mobile.
- Categoria desktop/mobile.
- Carrito.

Baseline disponible:

- Home mobile/desktop.
- Categoria mobile/desktop.
- Producto mobile/desktop.
- Carrito mobile/desktop.

### Etapa 2 - Intermedia

Objetivo: reducir duplicacion real.

Tareas:

- Reorganizar `ivana-design.css` por dominios sin cambiar comportamiento.
- Consolidar bloques duplicados de cards.
- Consolidar bloques duplicados de transferencia.
- Consolidar bloques duplicados de producto mobile solo despues de validar `ivana-product-mobile-20260610-24.css`.
- Reducir `!important` en grupos chicos.

Estado:

- Retirado de `static/css/ivana-design.css` un bloque legacy de cards envuelto en `@supports not (display: block)`.
- Motivo: el bloque estaba explicitamente marcado como deshabilitado, no aplicaba en navegadores modernos y habia sido reemplazado por el sistema activo de `.ivana-card` mas abajo.
- Retirados estilos de `.ivana-card-secondary-action`, sin referencias en templates/snipplets/JS activo.
- Retirada una primera generacion de transferencia en cards (`ivana-card-transfer-row`, `ivana-card-transfer-plus`, `ivana-card-transfer-equals` y contenedor verde viejo), reemplazada por el bloque activo final de transferencia.
- Retirado bloque comentado de `static/js/ivana-card.js.tpl` que generaba `.ivana-savings-badge` pero no ejecutaba.
- Retirados estilos residuales de savings (`.ivana-savings-badge` y `.ivana-card-savings-bar`) sin productor activo en templates/snipplets/JS.
- Retirados estilos y movimiento JS de `.ivana-low-stock-badge` / `.ivana-out-of-stock-badge`; el sistema activo de stock usa `.ivana-card-stock-bar--low` y `.ivana-card-stock-bar--out` desde `snipplets/product-item.tpl`.
- Verificado contra DOM publicado post-JS en home, categoria y producto: `.ivana-card-info` y `.ivana-card-name` tienen 0 apariciones; `.ivana-card-info-container` si aparece.
- Retiradas `.ivana-card-info` y `.ivana-card-name` de listas CSS, conservando selectores nativos/genericos como `.js-item-product .information`, `.js-item-product .item-name`, `.js-item-name` y `.product-item-name`.
- No se tocaron hooks `js-*`, templates ni JS.

### Cierre T02 - Card de producto

Estado: implementado.

- Consolidada la card en `static/css/ivana-design.css` dejando una sola capa activa: `Product cards - active implementation`.
- Eliminadas dos generaciones anteriores de CSS de card que duplicaban reglas de imagen, precio, descuento, cuotas, transferencia, stock y responsive.
- Se preservo `snipplets/product-item.tpl`, `component('product-item')`, `js-product-container`, `js-item-product`, `js-price-display` y `js-compare-price-display`.
- No se modifico `static/js/ivana-card.js.tpl`.
- CSS reducido en 736 lineas y `!important` bajo de 2053 a 1732 despues de T01/T02, manteniendo balance de llaves.
- Validacion post-deploy: home, categoria, busqueda, producto relacionado y carrito modal renderizan sin errores JS visibles.
- Riesgo residual: en mobile se detecto `scrollWidth` 1px mayor que viewport por imagenes escaladas dentro de contenedores con `overflow:hidden`; revisar en T05 si aparece scroll horizontal perceptible.

### Cierre T03 - Header, navegacion mobile y buscador

Estado: implementado.

- Ajustados targets tactiles de menu y carrito mobile a 44x44px.
- Ampliado el buscador mobile al ancho util del header sin reemplazar `component('search/search-form')`.
- Preservados modales nativos `#nav-hamburger` y `#modal-cart`, notificaciones y hooks `js-head-main`, `js-head-row` y `js-main-categories-container`.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260611-03` para bustear cache del CSS principal.
- Validado post-deploy: menu mobile abre, busqueda navega a `/search/?q=bikini`, carrito modal abre y desktop nav permanece visible.

### Cierre T04 - Home comercial

Estado: implementado.

- Compactada la grilla de productos de home en mobile entre 360px y 767px a 2 columnas, sin modificar categoria ni busqueda.
- Ajustadas cards solo bajo `.ivana-home-products` para preservar legibilidad comercial en mobile.
- Preservados `settings.home_order_position_1..18`, `data-store`, help/preview y logica de productos `sections.primary`, `sections.new` y `sections.sale`.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260611-04`.
- Validado post-deploy: home mobile 390px baja la seccion de destacados de ~4488px a ~1994px; desktop, categoria, busqueda y carrito modal siguen funcionando sin errores JS visibles.

### Cierre T05 - Categoria, filtros y busqueda

Estado: implementado.

- Unificado el layout visual de busqueda con el shell de categoria, manteniendo la logica nativa de Tiendanube para filtros, ordenamiento, paginacion y listado de productos.
- Preservados `component('sort-by')`, `filters-modals.tpl`, `filters-controls.tpl`, `products-list.tpl`, `settings.pagination` y comportamiento de busqueda nativa.
- Corregido overflow en titulos de busquedas largas con reglas acotadas a `.ivana-search-shell`.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260611-05`.
- Validado post-deploy: categoria mobile, busqueda con resultados, busqueda sin resultados, modales de filtros/sort y carrito modal funcionan sin errores JS visibles.
- Riesgo residual: persiste una diferencia menor de 1px de `scrollWidth` en mobile, asociada a redondeo/layout existente; el overflow critico de query larga quedo resuelto.

QA minimo:

- Capturas antes/despues.
- Cards en home, categoria, busqueda y relacionados.
- Producto con variantes, descuento, bajo stock y sin stock.
- Carrito con items y vacio.

### Etapa 3 - Agresiva

Objetivo: simplificar arquitectura visual.

Tareas:

- Definir si queda una sola hoja Ivana o una hoja base + override versionado temporal.
- Simplificar `ivana-card.js.tpl` si el markup final ya no requiere reordenamiento.
- Reescribir secciones visuales grandes solo con baseline aprobado.

QA minimo:

- Flujo compra completo.
- Consola JS limpia.
- Filtros, buscador, variantes, envio y checkout handoff.

## Criterios para borrar codigo

Un archivo o bloque se puede eliminar solo si cumple al menos una condicion:

- No tiene referencias en repo y no se carga en produccion.
- Es documentacion/prototipo y queda excluido del deploy.
- Esta reemplazado por una regla posterior equivalente, validada por captura.
- Es comentario obsoleto que no explica una decision actual.

No se debe eliminar si:

- Tiene hooks `js-*`, `data-store` o `data-component`.
- Participa en producto, variantes, stock, precio, carrito, envio o checkout.
- Solo "parece viejo" pero corrige un bug visual reciente.

## Limpieza post T05 - Home/categoria

Estado: implementado.

- Retiradas 145 lineas de `static/css/ivana-design.css` correspondientes a generaciones anteriores de categorias home.
- Retirado el bloque intermedio de filtros para `768px-1199px`, reemplazado por la implementacion activa `Category filters - active implementation`, que usa controles modales en todos los anchos.
- Preservados los hooks y templates de Tiendanube: `filters-modals.tpl`, `filters-controls.tpl`, `component('sort-by')`, `js-category-controls`, `js-home-category` y estructura de navegacion/categorias.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260612-01`.

Validacion requerida antes de cerrar:

- Home mobile y desktop: colecciones destacadas mantienen espaciado aprobado.
- Categoria mobile, desktop-mode y desktop: filtros siguen como controles modales.
- Busqueda con resultados y sin resultados no pierde layout.
- Consola JS sin errores del theme.

## Proxima accion recomendada

Ejecutar T06 - Pagina de producto:

1. Relevar `docs/spec-driven-redesign.md` y `docs/tasks/T06-product-page.md`.
2. Tomar baseline de producto publicado.
3. Mejorar la pagina de producto preservando variantes, stock, precio y add to cart.
4. Separar cualquier propuesta visual adicional para aprobacion antes de subirla a produccion.
