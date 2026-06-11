# Previews

Estos archivos HTML son referencias visuales y prototipos standalone del redisenio.

No son templates Tiendanube y no deben desplegarse al servidor productivo. El workflow FTPS excluye explicitamente esta carpeta.

Archivos actuales:

- `preview-featured-collection.html`
- `preview-product-reference.html`
- `preview-redesign-completo.html`
- `ivana-orchestrator.css`

Uso recomendado:

- Consultarlos como referencia visual.
- No importar su HTML completo dentro de templates `.tpl`.
- No cargar `ivana-orchestrator.css` desde `layouts/` sin una tarea y QA especificos; fue archivado aca porque no estaba referenciado por el theme productivo.
- Si una idea pasa a produccion, implementarla dentro de `templates/`, `snipplets/` y `static/` respetando `docs/spec-driven-redesign.md`.
