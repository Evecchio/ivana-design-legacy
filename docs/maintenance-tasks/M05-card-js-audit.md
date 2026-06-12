# M05 - Auditoria JS de cards

Estado: `done`

## Objetivo

Auditar `static/js/ivana-card.js.tpl` para confirmar que responsabilidades siguen siendo necesarias despues del redisenio.

## Archivos candidatos

- `static/js/ivana-card.js.tpl`
- `snipplets/product-item.tpl`
- `static/css/ivana-design.css`

## No tocar

- Precios.
- Descuentos.
- Cuotas.
- Transferencia.
- Links de producto.

## Pasos

1. Relevar que transforma el JS en cards.
2. Comparar con markup actual de `snipplets/product-item.tpl`.
3. Identificar funciones redundantes vs necesarias.
4. Proponer cortes seguros.

## Criterios de aceptacion

- Existe mapa de responsabilidades.
- No se elimina logica sin QA visual/funcional.
- Cards mantienen precio, descuento, cuotas y transferencia.

## QA

- Categoria.
- Busqueda.
- Home.
- Relacionados de producto.

## Resultado

- Se documento el mapa de responsabilidades en `docs/maintenance-card-js-audit.md`.
- Se corrigio un estado inconsistente: cards con `.ivana-card-discount-tag` ya no deben quedar clasificadas como `ivana-no-discount`.
- No se modificaron precios, porcentajes, cuotas, transferencia ni links de producto.
- Validacion requerida al desplegar: home, categoria, busqueda y relacionados en mobile/desktop.
