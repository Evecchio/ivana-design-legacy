# Auditoria JS de cards

Fecha: 2026-06-12

Fuente: `docs/maintenance-tasks/M05-card-js-audit.md`.

## Resumen

`static/js/ivana-card.js.tpl` ya no es solo un normalizador de cards. Funciona como capa de compatibilidad post-redisenio para:

- Cards de producto en home, categoria, busqueda y relacionados.
- Transferencia y descuentos en card.
- Titulo, transferencia, badges y CTA de pagina de producto.
- Formateo de descripcion de producto.
- Overflow/scroll horizontal de categorias destacadas en home.

No conviene eliminarlo completo todavia. Si se limpia, debe hacerse por funciones y con QA visual/funcional.

## Mapa de responsabilidades

| Funcion | Responsabilidad | Estado | Riesgo |
| --- | --- | --- | --- |
| `parseIvanaMoneyValue` | Parsear precios ARS para comparar precio actual, precio anterior y descuento. | Necesaria mientras JS calcule estados comerciales. | Alto |
| `normalizeIvanaProductCards` | Normaliza cards, oculta descuentos invalidos, mueve cuotas/transferencia y agrega clases `ivana-no-discount`. | Necesaria, pero contiene deuda. | Alto |
| `updateIvanaHomeCategoryCarouselOverflow` | Marca carrusel de categorias como overflowing cuando corresponde. | Necesaria para home mobile/desktop. | Bajo-medio |
| `initializeIvanaHomeCategoryCarouselMouseScroll` | Agrega scroll horizontal con rueda en desktop para categorias destacadas. | Conveniente UX. | Bajo |
| `formatIvanaEditorialTitle` | Formatea titulos de producto a estilo editorial. | Visual, no funcional. | Bajo-medio |
| `normalizeIvanaProductDetailTitle` | Aplica el formato editorial al titulo de producto. | Visual, no funcional. | Bajo-medio |
| `formatIvanaMoneyARS` | Formatea montos para transferencia en producto. | Necesaria para transferencia renderizada por JS. | Alto |
| `normalizeIvanaProductDetailCommercial` | Convierte el descuento de transferencia de producto al markup visual aprobado. | Necesaria. | Alto |
| `normalizeIvanaProductDetailDiscountBadges` | Oculta badges con 0% o invalidos. | Necesaria para evitar ruido visual. | Medio |
| `normalizeIvanaProductDescription` | Convierte parrafos con guiones en lista y detecta subtitulos cortos. | Conveniente, pero podria migrarse a Twig si el contenido fuera estable. | Medio |
| `normalizeIvanaProductDetailCta` | Fuerza estilo del boton de compra con inline important. | Candidato a migrar a CSS. | Medio |
| `queueIvanaProductCardNormalization` | Agrupa normalizaciones en `requestAnimationFrame`. | Necesaria mientras exista observer. | Medio |
| `MutationObserver` global | Reejecuta normalizaciones cuando Tiendanube/Swiper/ajax modifican el DOM. | Necesario para listados dinamicos, pero conviene acotarlo a futuro. | Medio-alto |

## Hallazgo corregido en M05

En cards con descuento custom (`.ivana-card-discount-tag`), el JS removia el label nativo y luego clasificaba la card como `ivana-no-discount` porque ya no encontraba `.product-item-discount`.

Efecto observado en produccion antes del fix:

- Cards con clases simultaneas `ivana-has-discount` e `ivana-no-discount`.
- Badge custom visible, pero estado de card inconsistente.

Cambio aplicado:

- Si existe `.ivana-card-discount-tag`, el JS parsea ese texto como fuente valida de descuento.
- `ivana-no-discount` solo se aplica cuando no hay badge nativo ni badge custom valido.

No se modificaron precios, porcentajes, cuotas, transferencia ni links.

## Observaciones de DOM publicado

Validado en home, categoria, busqueda y relacionados:

- Las cards actuales ya salen con `.ivana-card-content-stack`.
- Home y relacionados usan mayormente `.ivana-card-discount-tag`.
- Categoria y busqueda todavia pueden incluir `.product-item-discount` nativo.
- `MutationObserver` sigue justificandose porque Tiendanube/Swiper duplica slides y puede insertar cards dinamicamente.
- Producto usa el mismo archivo para transferencia, descripcion y CTA.

## Cortes seguros futuros

1. Migrar `normalizeIvanaProductDetailCta` a CSS si se confirma que ningun estilo nativo lo pisa.
2. Acotar el `MutationObserver` para ignorar mutaciones fuera de cards/producto/home categories.
3. Separar funciones por dominio en archivos o bloques internos:
   - card listados
   - producto detalle
   - home categories
4. Evaluar si `normalizeIvanaProductDescription` puede resolverse en template o contenido admin.

## No eliminar todavia

- Calculo de transferencia en producto.
- Parseo de descuentos.
- Observer global sin una alternativa probada.
- Movimiento de cuotas/descuento en cards de categoria/busqueda.
- Clases `ivana-no-discount` hasta resolver todos los casos con markup Twig.

## QA requerido

- Home: cards con descuento, cuotas y transferencia.
- Categoria: cards con y sin descuento.
- Busqueda: cards con y sin descuento.
- Producto: transferencia, CTA, descripcion y relacionados.
- Mobile y desktop: sin scroll horizontal y sin errores JS propios.
