# CLAUDE.md — ivana-design-legacy

Guía de referencia para asistentes AI que trabajen en este repositorio.

---

## Resumen del proyecto

**ivana-design-legacy** es un tema personalizado para **Tiendanube** (plataforma de e-commerce latinoamericana). Se trata de una tienda de moda/indumentaria premium con identidad visual fuerte en rosa/magenta.

No hay servidor local ni build toolchain: los archivos se editan directamente y se despliegan vía FTP a Tiendanube.

---

## Stack tecnológico

| Capa | Tecnología |
|------|-----------|
| Templating | Motor propio de Tiendanube (sintaxis Twig/Jinja2) — archivos `.tpl` |
| CSS | SCSS (compilado por Tiendanube) + CSS custom properties |
| JS | Vanilla JS / jQuery (sin transpilador local) |
| Deploy | GitHub Actions → FTPS (lftp) → servidor Tiendanube |
| CI/CD | `.github/workflows/deploy-ftp.yml` |
| Idioma del código | Español (comentarios, nombres de variables, commits) |

---

## Estructura de directorios

```
ivana-design-legacy/
├── layout/                     # Layout principal del tema
│   └── layout.tpl              # HTML base: <head>, CSS, JS, estructura global
├── layouts/                    # Layouts alternativos
│   ├── layout.tpl
│   └── layout_remote.tpl
├── snipplets/                  # Componentes reutilizables (fragmentos de template)
│   ├── header/                 # Header, modales, utilidades del header
│   ├── navigation/             # Navegación desktop, mobile, megamenu, hamburger
│   ├── home/                   # Secciones de la home (slider, banners, categorías, etc.)
│   ├── product/                # Detalle de producto (imágenes, variantes, formulario)
│   ├── cart/                   # Carrito (panel, totales, fulfillment)
│   ├── footer/                 # Footer, navegación del footer, legales
│   ├── grid/                   # Grilla de productos
│   ├── forms/                  # Formularios
│   ├── social/                 # Redes sociales
│   ├── svg/                    # Íconos SVG inline
│   ├── shipping/               # Calculadora de envíos
│   ├── placeholders/           # Skeletons/placeholders de carga
│   └── defaults/               # Valores por defecto de snipplets
├── templates/                  # Templates de página completa
│   ├── home.tpl                # Página de inicio
│   ├── product.tpl             # Detalle de producto
│   ├── category.tpl            # Listado de categoría
│   ├── cart.tpl                # Carrito de compras
│   ├── search.tpl              # Resultados de búsqueda
│   ├── contact.tpl             # Contacto
│   ├── blog.tpl / blog-post.tpl
│   ├── account/                # Cuenta de usuario
│   └── 404.tpl
├── static/                     # Assets estáticos
│   ├── css/
│   │   ├── style-critical.scss     # CSS crítico (inlineado en <head>)
│   │   ├── style-async.scss        # CSS no crítico (carga async)
│   │   ├── style-utilities.scss    # Clases utilitarias
│   │   └── style-tokens.tpl        # CSS custom properties (variables de diseño)
│   ├── js/
│   │   ├── store.js.tpl            # JS principal de la tienda
│   │   ├── external.js.tpl         # Librerías externas
│   │   ├── external-no-dependencies.js.tpl
│   │   └── google-survey.js.tpl
│   └── images/                     # Imágenes del tema
├── config/
│   ├── data.json               # Configuración de assets compilados para preview
│   ├── settings.txt            # Definición de opciones del panel de admin
│   ├── defaults.txt            # Valores por defecto de los settings
│   ├── translations.txt        # Textos traducibles (es/pt)
│   ├── sections.txt            # Secciones configurables
│   └── variants.txt            # Variantes del tema
├── preview-redesign.html       # HTML standalone de preview del rediseño (no deployado)
├── .github/
│   └── workflows/
│       └── deploy-ftp.yml      # CI/CD: deploy automático vía FTPS
├── .claude/
│   └── settings.json           # Permisos de herramientas para Claude Code
└── README.md                   # (vacío actualmente)
```

---

## Sistema de templates (Tiendanube)

### Sintaxis

Los archivos `.tpl` usan una sintaxis similar a **Twig/Jinja2**:

```twig
{# Comentario #}
{{ variable }}                          {# Output de variable #}
{% if condicion %}...{% endif %}        {# Condicional #}
{% for item in collection %}...{% endfor %} {# Loop #}
{{ 'css/style-critical.scss' | static_url }}  {# Filtro de URL de asset #}
{{ 'css/style-critical.scss' | static_url | static_inline }}  {# Inlinea el archivo #}
{% snipplet 'header/header.tpl' %}      {# Incluir snipplet #}
{{ component('fonts', {...}) }}         {# Componente con parámetros #}
```

### Variables globales disponibles

- `settings.*` — Opciones configuradas por el admin del tema
- `store.*` — Datos de la tienda (nombre, moneda, país)
- `languages` — Idiomas disponibles
- `cart.*` — Datos del carrito activo
- `customer.*` — Cliente autenticado

### Carga de CSS

El layout usa una estrategia de tres niveles:
1. **Critical** (`style-critical.scss`) — inlineado en `<head>` con `static_inline`
2. **Utilities** (`style-utilities.scss`) — también inlineado
3. **Async** (`style-async.scss`) — cargado con `media="print"` trick para no bloquear render

---

## Design tokens y colores de marca

Los colores se definen en `static/css/style-tokens.tpl` como CSS custom properties:

```css
/* === VARIABLES DE MARCA (Ivana Design) === */
:root {
  --brand:        #FF1493;   /* Rosa/magenta principal */
  --brand-dark:   #cc007a;   /* Variante oscura (barra promo, hover) */
  --brand-80:     rgba(255,20,147, 0.80);
  --brand-50:     rgba(255,20,147, 0.50);
  --brand-20:     rgba(255,20,147, 0.20);
  --brand-10:     rgba(255,20,147, 0.10);

  /* Neutros */
  --negro:        #111111;
  --gris-oscuro:  #333333;
  --gris:         #666666;
  --gris-claro:   #f8f8f8;
  --blanco:       #ffffff;
}
```

**Tipografía principal**: `Manrope` (Google Fonts, pesos 400–800)
El tema también soporta las fuentes configurables del admin: `settings.font_headings` y `settings.font_rest`.

---

## Workflow de desarrollo

### Sin build local

No hay `npm install`, `webpack`, ni paso de compilación local. El flujo es:

1. Editar archivos `.tpl` o `.scss` directamente
2. Hacer commit sobre `main`
3. GitHub Actions despliega automáticamente vía FTPS

### Rama y entorno

| Rama | Entorno | Secrets usados |
|------|---------|----------------|
| `main` | Producción | `FTP_HOST`, `FTP_USER`, `FTP_PASSWORD` |

### Deploy (CI/CD)

El workflow `.github/workflows/deploy-ftp.yml`:
- Se usa con push a `main` para publicar en producciÃ³n
- Instala `lftp` y hace mirror inverso del repo al servidor FTP
- **Excluye**: `.git/`, `.github/`, `.claude/`, archivos `*.md`
- **No sube**: `preview-redesign.html` (es excluido por la regla `*.md` no, pero tampoco es parte del tema funcional)
- Usa FTPS con SSL forzado (`ftp:ssl-force true`, `ftp:ssl-protect-data true`)

### Comandos git habituales

```bash
git add <archivo>
git commit -m "tipo: descripción en español"
git push origin main
```

**Convención de commits** (basada en el historial):
- `feat:` — Nueva funcionalidad
- `fix:` — Corrección de bug
- `chore:` — Tareas de mantenimiento
- `ci:` — Cambios en CI/CD
- Los mensajes van **en español**

---

## Convenciones de código

### CSS/SCSS

- Usar CSS custom properties (`var(--brand)`) para colores de marca
- Estructura: variables → reset → componentes → utilities
- Nombres de clases en inglés (herencia del tema base de Tiendanube)
- Las customizaciones de Ivana Design se agregan después del CSS base, con comentarios delimitadores

### Templates

- Los snipplets se organizan por sección (header, navigation, home, product, etc.)
- Los comentarios en `.tpl` usan `{# comentario #}` (no se renderizan)
- Los bloques de sección se documentan con el patrón:
  ```twig
  {#/*============================================================================
    #Nombre de sección
  ==============================================================================*/#}
  ```

### JavaScript

- Vanilla JS, sin frameworks
- Librerías integradas: **Swiper 4.4.2** (carruseles/sliders), **LazySizes** (lazy loading imágenes)
- Código organizado en secciones con Table of Contents en `store.js.tpl`
- Secciones: Transitions, Forms, Header/Nav, Home, Product grid, Product detail, Cart, Shipping
- Prefijo `.js-` en clases HTML usadas como hooks de JavaScript (no usar para estilos)
- Atributos `data-store` y `data-component` para tracking/comportamiento dinámico

---

## Configuración del tema (config/)

| Archivo | Propósito |
|---------|-----------|
| `settings.txt` | Define todos los controles del panel de customización del admin (colores, tipografías, opciones) |
| `defaults.txt` | Valores por defecto de los settings (colores base del tema original) |
| `translations.txt` | Strings traducibles al español e portugués |
| `sections.txt` | Define las secciones configurables del tema |
| `variants.txt` | Variantes del tema: `Clothing` (base) y `Electronics` (paleta alternativa) |
| `data.json` | Indica a Tiendanube qué assets compilar para el preview |

---

## Archivos importantes para editar

| Qué cambiar | Archivo a editar |
|-------------|-----------------|
| Variables CSS / colores de marca | `static/css/style-tokens.tpl` |
| Estilos principales | `static/css/style-critical.scss` |
| Estilos no críticos | `static/css/style-async.scss` |
| Estructura HTML global | `layout/layout.tpl` |
| Header | `snipplets/header/header.tpl` |
| Navegación desktop | `snipplets/navigation/navigation-categories-desktop.tpl` |
| Navegación mobile | `snipplets/navigation/navigation-categories-mobile.tpl` |
| Home page | `templates/home.tpl` + snipplets en `snipplets/home/` |
| Producto | `templates/product.tpl` + snipplets en `snipplets/product/` |
| Carrito | `templates/cart.tpl` + snipplets en `snipplets/cart/` |
| JavaScript | `static/js/store.js.tpl` |
| Textos traducibles | `config/translations.txt` |
| Opciones del admin | `config/settings.txt` |

---

## Notas importantes

1. **No hay linter ni tests locales** — validar cambios visualmente en el entorno de Tiendanube
2. **El archivo `preview-redesign.html`** es un prototipo HTML standalone (no se deploya como parte del tema)
3. **Los archivos `.md` no se despliegan** — el `deploy-ftp.yml` los excluye
4. **Los secrets FTP** están configurados en GitHub Secrets del repo, no en el código
5. **Tiendanube compila el SCSS** — no se necesita compilar localmente
6. **La barra promo** usa `--brand-dark: #cc007a`, no el `--brand` principal
7. **El tema está en español (Argentina)** — mantener mensajes, commits y comentarios en español
