# M06 - Performance y assets

Estado: `done`

## Objetivo

Medir y optimizar carga de assets sin cambiar el diseno aprobado.

## Archivos candidatos

- `layouts/layout.tpl`
- `snipplets/preload-images.tpl`
- `static/css/*.css`
- `static/js/*.tpl`

## No tocar

- Checkout.
- Componentes nativos de Tiendanube.
- Imagenes administrables sin confirmar origen.

## Pasos

1. Registrar CSS/JS cargados por home, categoria y producto.
2. Revisar preload/lazyload.
3. Detectar assets cargados sin uso.
4. Proponer optimizaciones por riesgo.

## Criterios de aceptacion

- Hay medicion antes/despues.
- No se degrada LCP visual evidente.
- No hay errores JS.

## QA

- Home.
- Categoria.
- Producto.
- Mobile y desktop.

## Resultado

- Se documento la medicion en `docs/maintenance-performance-assets.md`.
- Se genero reporte local en `output/maintenance-baseline/m06-performance-assets/report.json`.
- Se retiro un preload redundante de Google Fonts en `layouts/layout.tpl`.
- Se mantuvieron `preconnect`, `component('fonts')`, preloads de imagen LCP y scripts funcionales.
- Validacion requerida al desplegar: home, categoria y producto en mobile/desktop.
