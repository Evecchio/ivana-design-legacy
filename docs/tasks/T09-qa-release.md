# T09 - QA integral y release

Estado: `pending`

## Objetivo

Cerrar el redisenio con una validacion integral de compatibilidad Tiendanube, responsive, performance, accesibilidad basica, SEO tecnico y flujo de compra.

## Contexto de la spec

- Ver `6. Requisitos tecnicos`.
- Ver `8. Checklist QA por pagina`.
- Ver `9. Riesgos tecnicos`.
- Ver `11. Orden recomendado de implementacion`.
- Ver `12. Criterios de aceptacion generales`.

## Archivos candidatos a modificar

- Esta tarea no deberia iniciar redisenios nuevos.
- Solo modificar archivos puntuales para corregir bugs encontrados durante QA.
- Actualizar estados en `docs/tasks/README.md` y tareas individuales cuando corresponda.

## Archivos/hooks que no deben tocarse

- No hacer refactors amplios.
- No tocar checkout.
- No cambiar logica de variantes, stock, precios, carrito o envios salvo bug bloqueante validado.
- No incorporar features nuevas.

## Pasos de implementacion

1. Revisar estados de T01 a T08 y confirmar que no haya tareas bloqueadas.
2. Ejecutar QA por pagina: home, categoria, busqueda, producto, carrito, header/nav, footer/institucionales.
3. Validar flujo de compra: categoria/busqueda -> producto -> add to cart -> carrito -> checkout.
4. Revisar consola JS en flujos principales.
5. Revisar responsive en 320, 375, 390, 768, 1024 y 1366px.
6. Revisar accesibilidad basica: foco, contraste, labels y targets tactiles.
7. Revisar performance basica: imagenes, CSS/JS agregado, layout shift evidente.
8. Documentar bugs, corregir solo los bloqueantes y registrar riesgos restantes.

## Criterios de aceptacion

- Todas las paginas principales son responsive.
- No se rompe el flujo de compra.
- Producto, categoria y carrito funcionan correctamente.
- Diseno consistente.
- No hay errores JS visibles en flujos principales.
- No hay regresiones criticas en mobile.
- Compatibilidad Tiendanube preservada.

## Checklist QA

- Home completa.
- Categoria con filtros y sin filtros.
- Busqueda con y sin resultados.
- Producto con variantes, descuento y stock variable.
- Carrito con items, vacio y error de stock.
- Header, menu mobile, buscador y carrito badge.
- Footer, newsletter, pages y contacto.
- Consola JS limpia en flujos principales.
- Sin scroll horizontal.

## Riesgos

- QA incompleto por falta de productos/configuraciones reales.
- Cache CDN ocultando cambios.
- Bugs de Tiendanube visibles solo en admin/preview o produccion.

## Resultado esperado al cerrar

- Estado actualizado a `done`.
- Resumen final de release.
- Lista de validaciones realizadas.
- Riesgos residuales documentados con severidad.
