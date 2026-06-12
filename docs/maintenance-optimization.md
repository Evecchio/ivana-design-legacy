# Mantenimiento y optimizacion post-release

Fuente funcional: `docs/spec-driven-redesign.md`.

Estado inicial: redisenio principal cerrado con `docs/tasks/T01` a `T09` en `done`.

Objetivo: reducir deuda tecnica, peso visual, duplicacion y riesgo operativo sin iniciar un nuevo redisenio ni tocar checkout, variantes, stock, precios, carrito o envios salvo bug validado.

## Principios de trabajo

- Una tarea por vez.
- Cambios chicos, medibles y reversibles.
- Todo cambio debe tener QA en tienda publicada.
- No tocar logica Tiendanube si el objetivo es solo performance, limpieza o estilo.
- No borrar reglas CSS sin confirmar que una regla posterior o mas especifica cubre el mismo caso.
- Si aparece una mejora visual grande, documentarla como propuesta; no mezclarla con mantenimiento.

## Estado actual relevado

- `static/css/ivana-design.css`: ~172 KB, 1822 usos de `!important`.
- `static/css/ivana-product-mobile-20260610-24.css`: ~24 KB, 307 usos de `!important`.
- `layouts/layout.tpl` carga un CSS principal Ivana y un override mobile/producto versionado.
- `docs/cleanup-audit.md` ya identifica la deuda principal: CSS acumulado, override mobile temporal, `ivana-card.js.tpl` como normalizador de cards y riesgo de cache en 404.
- El cierre `T09` valido compra, producto, carrito, categoria, busqueda, contacto, footer y login en produccion.

## No tocar sin tarea especifica

- Checkout y URLs de Tiendanube.
- Formularios de producto, variantes, stock y add to cart.
- `data-store`, `data-component`, `js-*` usados por carrito, producto, filtros, buscador y newsletter.
- `snipplets/forms/newsletter.tpl`.
- Actions/campos de `templates/contact.tpl`.
- Componentes nativos de envio/calculadora.

## Ejes de optimizacion

### 1. CSS

Prioridad alta.

- Mapear `ivana-design.css` por dominios reales: base, header, cards, home, categoria, producto, carrito, footer, institucionales, responsive, hotfixes.
- Eliminar duplicados obvios solo con evidencia de cascada.
- Reducir `!important` por grupos acotados.
- Decidir si `ivana-product-mobile-20260610-24.css` sigue como override temporal o se consolida.

### 2. JavaScript

Prioridad media.

- Auditar `static/js/ivana-card.js.tpl`.
- Confirmar que no reordene markup que ya quedo estable en templates/CSS.
- Mantener normalizaciones que protejan precios, cuotas, descuento y transferencia.

### 3. Performance

Prioridad media.

- Medir peso de CSS/JS agregados.
- Revisar lazy loading, imagenes de cards, slider home y producto.
- Evitar cargar overrides que ya no aporten.
- Mantener cache busting con `asset_version` solo cuando corresponda.

### 4. Accesibilidad y SEO tecnico

Prioridad media-baja.

- Revisar foco visible, labels de formularios, targets tactiles, contraste basico.
- Revisar headings por pagina.
- Revisar alt text heredado en banners/cards/producto cuando sea controlable por theme.

### 5. Cache/404 Tiendanube

Prioridad baja.

- Revalidar si la 404 sigue sirviendo HTML/cache distinto.
- Mantener la compatibilidad sin afectar paginas principales.

## Orden recomendado

1. `M01-baseline-maintenance`: baseline y matriz de medicion post-release.
2. `M02-css-map-and-dead-rules`: mapa CSS y candidatos seguros a eliminar.
3. `M03-css-important-reduction`: reducir `!important` en un dominio de bajo riesgo.
4. `M04-product-mobile-override`: decidir estrategia del CSS mobile de producto.
5. `M05-card-js-audit`: auditar normalizador JS de cards.
6. `M06-performance-assets`: medir y optimizar assets sin redisenio.
7. `M07-accessibility-seo`: ajustes basicos de accesibilidad/SEO tecnico.
8. `M08-cache-404-monitoring`: revisar cache/404 y documentar comportamiento.

## Criterio de cierre de la etapa

- CSS principal mas entendible y con menos duplicados.
- Menos `!important` en al menos un dominio critico.
- Sin regresiones de compra.
- Sin scroll horizontal nuevo.
- Sin errores JS propios en flujos principales.
- Riesgos residuales documentados.
