# T01 - Fundacion visual

Estado: `pending`

## Objetivo

Consolidar la base visual del redisenio: tokens, escala tipografica, espaciados, botones, formularios, badges, estados y wrappers comunes. Esta tarea no debe cambiar flujos funcionales.

## Contexto de la spec

- Ver `5. Alcance visual`.
- Ver `6. Requisitos tecnicos`.
- Ver `7. Backlog tecnico > Epica 1 - Fundacion visual`.
- Ver `12. Criterios de aceptacion generales`.

## Archivos candidatos a modificar

- `static/css/style-tokens.tpl`
- `static/css/style-critical.scss`
- `static/css/style-utilities.scss`
- `static/css/style-async.scss`
- `static/css/ivana-design.css`
- `layouts/layout.tpl` solo si hace falta versionar/agregar una hoja visual.

## Archivos/hooks que no deben tocarse

- No modificar `static/js/store.js.tpl`.
- No modificar templates funcionales en esta tarea salvo wrappers/clases visuales indispensables.
- No eliminar clases `js-*`, `data-store` ni `data-component`.
- No tocar checkout ni `static/checkout.scss.tpl`.

## Pasos de implementacion

1. Relevar reglas visuales actuales en CSS y detectar duplicados de botones, cards, page shells, headers de seccion y formularios.
2. Definir tokens CSS para color, radio, sombra, espaciado, ancho de contenedor y foco.
3. Normalizar estilos base de botones, inputs, selects, badges, breadcrumbs, empty states y rich content.
4. Agregar focus visible accesible.
5. Revisar que el CSS nuevo este acotado por wrappers o clases `ivana-*`.
6. Evitar cambios de layout profundos de paginas especificas; esos van en tareas posteriores.

## Criterios de aceptacion

- Existe una base visual comun reutilizable.
- Los estados hover, focus, disabled y active estan definidos.
- No hay selectores globales invasivos nuevos.
- No se rompe ninguna funcionalidad de producto, categoria, carrito o busqueda.
- No aparece scroll horizontal en mobile por reglas base.

## Checklist QA

- Revisar home, categoria, producto, carrito, page y contacto en mobile y desktop.
- Tabular con teclado por header, buscador, botones e inputs.
- Confirmar contraste basico de botones y textos principales.
- Confirmar que `component('head-tags')`, `structured-data` y scripts siguen intactos.

## Riesgos

- Sobrescribir estilos nativos de Tiendanube con selectores demasiado amplios.
- Crear regresiones visuales en cuenta, blog o password.
- Aumentar CSS critico sin necesidad.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen de tokens/componentes base agregados o consolidados.
- Lista de validaciones realizadas y riesgos pendientes.
