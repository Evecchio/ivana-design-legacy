# M01 - Baseline mantenimiento

Estado: `pending`

## Objetivo

Crear una linea base tecnica y visual post-release para comparar futuras limpiezas sin depender de memoria o percepcion.

## Archivos candidatos

- `docs/maintenance-optimization.md`
- `docs/cleanup-audit.md`
- `output/` para capturas locales no versionadas

## No tocar

- Templates productivos.
- CSS/JS productivo.
- Checkout, producto, carrito, filtros o envios.

## Pasos

1. Registrar pesos actuales de CSS/JS principales.
2. Registrar conteo de `!important`.
3. Tomar capturas de home, categoria, busqueda, producto, carrito, contacto y 404 en mobile/desktop.
4. Ejecutar flujo producto -> carrito -> checkout.
5. Guardar resultados en documentacion de mantenimiento.

## Criterios de aceptacion

- Existe baseline versionado con metricas.
- Capturas quedan en `output/`.
- Flujo de compra validado.
- Riesgos residuales actualizados.

## QA

- Tienda publicada responde.
- No se hacen cambios productivos.
