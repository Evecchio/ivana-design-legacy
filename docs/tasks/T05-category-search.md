# T05 - Categoria, filtros y busqueda

Estado: `done`

## Objetivo

Mejorar categoria/listado y busqueda para que explorar, filtrar, ordenar y comparar productos sea simple en mobile y desktop.

## Contexto de la spec

- Ver `4.2 Categoria/listado`.
- Ver `4.8 Buscador`.
- Ver `7. Backlog tecnico > Epica 5 - Categoria y busqueda`.
- Ver `8. Checklist QA por pagina > Categoria` y `Busqueda`.

## Archivos candidatos a modificar

- `templates/category.tpl`
- `templates/search.tpl`
- `snipplets/category-banner.tpl`
- `snipplets/grid/filters-modals.tpl`
- `snipplets/grid/filters-controls.tpl`
- `snipplets/grid/products-list.tpl`
- `snipplets/grid/pagination.tpl`
- `static/css/ivana-design.css`

## Archivos/hooks que no deben tocarse

- Preservar `component('sort-by')`.
- Preservar filtros, modales, controles y paginacion.
- No romper `settings.pagination`, `settings.grid_columns_mobile` ni `settings.grid_columns_desktop`.
- No romper `LS.hybridScroll`.
- No cambiar comportamiento de busqueda nativa.

## Pasos de implementacion

1. Relevar categoria con y sin filtros, con y sin banner, con productos y sin productos.
2. Unificar header visual de categoria y busqueda.
3. Mejorar toolbar, filtros mobile/desktop y ordenamiento.
4. Ajustar grilla responsive apoyandose en T02.
5. Mejorar estados sin resultados y filtros sin resultados.
6. Validar infinite scroll o paginacion segun settings.

## Criterios de aceptacion

- Breadcrumbs, titulo, descripcion y banner se ven correctamente.
- Filtros funcionan en mobile y desktop.
- Ordenamiento funciona.
- Grilla respeta columnas configuradas.
- Paginacion/infinite scroll funciona.
- Busqueda y estados sin resultados son claros.

## Checklist QA

- Categoria con productos.
- Categoria sin productos.
- Categoria con filtros disponibles.
- Filtros aplicados y limpiados.
- Search con resultados.
- Search sin resultados y sugeridos.
- Desktop y mobile sin overflow.

## Riesgos

- Romper filtros por reordenar markup.
- Bloquear sticky controls con header.
- Desincronizar grilla con infinite scroll.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de mejoras en categoria/search.
- QA documentado para filtros, sort y paginacion.

## Cierre T05

Estado: implementado.

Cambios realizados:

- Unificado `templates/search.tpl` con la estructura visual de categoria usando `ivana-category-shell` e `ivana-search-shell`.
- Preservados `component('sort-by')`, filtros, modales, controles, paginacion, `products-list.tpl`, `settings.pagination` y la busqueda nativa de Tiendanube.
- Conservado `templates/category.tpl` sin cambios productivos, porque ya tenia el shell visual principal aplicado.
- Corregido overflow en busquedas largas con reglas acotadas a `.ivana-search-shell .ivana-category-title`.
- Actualizado `asset_version` en `layouts/layout.tpl` a `20260611-05`.

Validacion realizada:

- Categoria mobile `/productos/`: shell visual activo, toolbar visible, filtros y ordenamiento abren sus modales, grilla renderiza 60 cards y no hay errores JS visibles.
- Busqueda con resultados `/search/?q=bikini`: shell visual activo, toolbar visible, filtros y ordenamiento disponibles, grilla renderiza 60 cards y no hay errores JS visibles.
- Busqueda sin resultados `/search/?q=zzzinexistenteivanadesign`: no genera overflow por query larga, muestra sugeridos y no hay errores JS visibles.
- Carrito modal: `#modal-cart` y `.js-ajax-cart-list` siguen disponibles despues de los cambios.

Riesgo residual:

- En mobile se observa una diferencia menor de 1px entre `scrollWidth` y viewport en algunas paginas, consistente con redondeos/elementos existentes. El overflow critico de busqueda vacia bajo de 523px a 391px en viewport de 390px y no queda bloqueante para T05.
