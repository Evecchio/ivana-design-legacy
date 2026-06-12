# Backlog mantenimiento y optimizacion

Fuente: [`docs/maintenance-optimization.md`](../maintenance-optimization.md).

Este backlog es post-release. No reemplaza el spec de redisenio: lo cuida. Su funcion es bajar deuda tecnica y mejorar performance/estabilidad sin introducir cambios visuales grandes.

## Regla de trabajo

- Ejecutar una tarea por vez.
- Medir antes y despues.
- Validar en tienda publicada cuando haya impacto en CSS/JS/templates.
- No tocar checkout, variantes, stock, precios, carrito ni envios salvo bug bloqueante validado.
- Al cerrar, registrar cambios, QA y riesgos.

## Estados

- `pending`: todavia no iniciada.
- `in_progress`: en implementacion.
- `blocked`: requiere decision, acceso o validacion externa.
- `done`: implementada y validada.

## Orden recomendado

| Orden | Tarea | Estado | Objetivo |
| --- | --- | --- | --- |
| 1 | [M01-baseline-maintenance](M01-baseline-maintenance.md) | done | Crear baseline tecnico/visual post-release. |
| 2 | [M02-css-map-and-dead-rules](M02-css-map-and-dead-rules.md) | done | Mapear CSS y detectar reglas muertas o duplicadas. |
| 3 | [M03-css-important-reduction](M03-css-important-reduction.md) | done | Reducir `!important` en un dominio de bajo riesgo. |
| 4 | [M04-product-mobile-override](M04-product-mobile-override.md) | pending | Definir estrategia del CSS mobile/producto versionado. |
| 5 | [M05-card-js-audit](M05-card-js-audit.md) | pending | Auditar `ivana-card.js.tpl` y sus responsabilidades reales. |
| 6 | [M06-performance-assets](M06-performance-assets.md) | pending | Medir y optimizar peso de assets/carga visual. |
| 7 | [M07-accessibility-seo](M07-accessibility-seo.md) | pending | Mejorar accesibilidad basica y SEO tecnico sin redisenio. |
| 8 | [M08-cache-404-monitoring](M08-cache-404-monitoring.md) | pending | Revisar cache/404 y comportamiento residual Tiendanube. |

## Comando sugerido

```text
Implementa M01-baseline-maintenance usando docs/maintenance-optimization.md y docs/maintenance-tasks/M01-baseline-maintenance.md como fuente de verdad.
```
