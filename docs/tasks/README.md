# Backlog operativo - Redisenio Tiendanube

Fuente de verdad: [`docs/spec-driven-redesign.md`](../spec-driven-redesign.md).

Este directorio convierte la especificacion madre en tareas chicas, verificables y seguras para ejecutar el redisenio. Cada tarea debe trabajarse de forma aislada, con cambios rastreables a criterios de aceptacion.

## Regla de trabajo

- Ejecutar una tarea por vez.
- Antes de editar, relevar los archivos indicados en la tarea.
- No tocar hooks `js-*`, `data-store`, `data-component`, formularios ni componentes Tiendanube sin validacion funcional.
- Si aparece una mejora fuera de alcance, documentarla como nota; no implementarla dentro de otra tarea.
- Al cerrar una tarea, actualizar su estado y dejar resumen de cambios, validaciones y riesgos restantes.

## Estados

- `pending`: todavia no iniciada.
- `in_progress`: en implementacion.
- `blocked`: requiere decision, acceso o validacion externa.
- `done`: implementada y validada contra su checklist.

## Orden recomendado

| Orden | Tarea | Estado | Objetivo |
| --- | --- | --- | --- |
| 1 | [T01-foundation-visual](T01-foundation-visual.md) | done | Consolidar tokens, base visual y componentes comunes. |
| 2 | [T02-product-card](T02-product-card.md) | done | Redisenar card de producto sin romper grillas, sliders ni precios. |
| 3 | [T03-header-mobile-search](T03-header-mobile-search.md) | done | Mejorar header, navegacion mobile y buscador. |
| 4 | [T04-home](T04-home.md) | done | Redisenar home modular y secciones comerciales. |
| 5 | [T05-category-search](T05-category-search.md) | done | Mejorar categoria, filtros, ordenamiento, busqueda y grilla. |
| 6 | [T06-product-page](T06-product-page.md) | done | Redisenar producto preservando variantes, stock, precio y add to cart. |
| 7 | [T07-cart](T07-cart.md) | pending | Mejorar carrito, resumen, cantidades, envios y checkout handoff. |
| 8 | [T08-footer-institutional](T08-footer-institutional.md) | pending | Mejorar footer, pages, contacto, blog y cuenta con cambios seguros. |
| 9 | [T09-qa-release](T09-qa-release.md) | pending | Validacion integral, performance, compatibilidad y cierre de release. |

## Comando de ejecucion sugerido

```text
Implementa T02-product-card usando docs/spec-driven-redesign.md y docs/tasks/T02-product-card.md como fuente de verdad.
```

## Checklist minimo para cualquier tarea

- Confirmar que la tarea sigue vigente contra la spec madre.
- Revisar `git status --short` antes y despues.
- Validar mobile y desktop cuando haya impacto visual.
- Confirmar que no se rompieron hooks Tiendanube.
- Registrar riesgos no resueltos antes de marcar `done`.
