{# /* Style tokens */ #}

:root {
  
  {#/*============================================================================
    #Colors
  ==============================================================================*/#}

  {#### Colors settings #}

  {# Main colors #}

  {% set main_background = settings.background_color %}
  {% set main_foreground = settings.text_color %}

  {% set accent_color = '#f4256a' %}

  {% set button_background = accent_color %}
  {% set button_foreground = '#ffffff' %}

  {% set label_background = accent_color %}
  {% set label_foreground = '#ffffff' %}

  {% set label_shipping_background = accent_color %}
  {% set label_shipping_foreground = '#ffffff' %}

  {% set banner_services_background = settings.banner_services_background_color %}
  {% set banner_services_foreground = settings.banner_services_foreground_color %}

  {% set stock_color = accent_color %}

  {% set header_background = settings.header_colors ? settings.header_background_color : main_background %}
  {% set header_foreground = settings.header_colors ? settings.header_foreground_color : main_foreground %}

  {% set footer_background = settings.footer_colors ? settings.footer_background_color : main_background %}
  {% set footer_foreground = settings.footer_colors ? settings.footer_foreground_color : main_foreground %}

  {% set newsletter_background = settings.newsletter_colors ? settings.newsletter_background_color : main_background %}
  {% set newsletter_foreground = settings.newsletter_colors ? settings.newsletter_foreground_color : main_foreground %}

  /* --- Brand & Premium Colors --- */
  --accent-color: {{ accent_color }};
  --accent-color-hover: {{ accent_color }}EE; /* 93% opacity for hover */
  --accent-color-soft: {{ accent_color }}1A;  /* 10% opacity for backgrounds */

  /* --- Neutral Palette --- */
  --main-background: {{ main_background }};
  --main-foreground: {{ main_foreground }};
  
  /* Text semantic colors */
  --text-primary: {{ main_foreground }};
  --text-secondary: {{ main_foreground }}{{ opacity_70 }};
  --text-muted: {{ main_foreground }}{{ opacity_50 }};
  --text-on-accent: #ffffff;

  /* Surfaces & Overlays */
  --bg-surface: {{ main_background }};
  --bg-surface-alt: {{ main_foreground }}{{ opacity_03 }};
  --bg-overlay: rgba(0, 0, 0, 0.72);
  --text-on-overlay: #ffffff;
  
  --border-color: {{ main_foreground }}{{ opacity_10 }};
  --border-color-light: {{ main_foreground }}{{ opacity_05 }};

  /* --- Functional Components --- */
  --button-background: var(--accent-color);
  --button-foreground: var(--text-on-accent);

  --label-background: var(--accent-color);
  --label-foreground: var(--text-on-accent);

  --label-shipping-background: var(--accent-color);
  --label-shipping-foreground: var(--text-on-accent);

  --stock-color: var(--accent-color);
  
  --header-background: {{ header_background }};
  --header-foreground: {{ header_foreground }};

  --header-badge-background: var(--accent-color);
  --header-badge-foreground: var(--text-on-accent);

  --primary-adbar-background: var(--accent-color);
  --primary-adbar-foreground: var(--text-on-accent);
  --secondary-adbar-background: var(--accent-color);
  --secondary-adbar-foreground: var(--text-on-accent);

  --footer-background: var(--accent-color);
  --footer-foreground: #ffffff;

  --newsletter-background: var(--accent-color);
  --newsletter-foreground: #ffffff;

  /* --- Opacity Helpers --- */
  --main-foreground-opacity-03: {{ main_foreground }}{{ opacity_03 }};
  --main-foreground-opacity-05: {{ main_foreground }}{{ opacity_05 }};
  --main-foreground-opacity-10: {{ main_foreground }}{{ opacity_10 }};
  --main-foreground-opacity-20: {{ main_foreground }}{{ opacity_20 }};
  --main-foreground-opacity-30: {{ main_foreground }}{{ opacity_30 }};
  --main-foreground-opacity-40: {{ main_foreground }}{{ opacity_40 }};
  --main-foreground-opacity-50: {{ main_foreground }}{{ opacity_50 }};
  --main-foreground-opacity-60: {{ main_foreground }}{{ opacity_60 }};
  --main-foreground-opacity-70: {{ main_foreground }}{{ opacity_70 }};

  --main-background-opacity-30: {{ main_background }}{{ opacity_30 }};
  --main-background-opacity-50: {{ main_background }}{{ opacity_50 }};
  --main-background-opacity-80: {{ main_background }}{{ opacity_80 }};

  --label-shipping-background-80: {{ label_shipping_background }}{{ opacity_80 }};

  --newsletter-foreground-opacity-50: {{ newsletter_foreground }}{{ opacity_50 }};

  --footer-foreground-opacity-40: {{ footer_foreground }}{{ opacity_40 }};
  --footer-foreground-opacity-60: {{ footer_foreground }}{{ opacity_60 }};

  {# Alert colors CSS #}

  --success: #4bb98c;
  --danger: #dd7774;
  --warning: #dc8f38;

  {#/*============================================================================
    #Fonts
  ==============================================================================*/#}

  {# Font families #}

  --heading-font: {{ settings.font_headings | raw }};
  --body-font: {{ settings.font_rest | raw }};

  {# Font sizes #}

  {% set font_base_size = settings.font_base_size %}

  --font-base: {{ font_base_size }}px;
  --font-base-default: 16px;

  {% set font_rest_size = settings.font_rest_size %}

  --font-huge: {{ font_rest_size + 5 }}px;
  --font-big: {{ font_rest_size + 4 }}px;
  --font-medium: {{ font_rest_size + 2 }}px;
  --font-small: {{ font_rest_size }}px;
  --font-smallest: {{ font_rest_size - 2 }}px;
  --font-extra-smallest: {{ font_rest_size - 3 }}px;

  {# Scales using 1.2 minor third scale #}

  {% set heading_size = settings.headings_size %}

  --h1: {{ heading_size }}px;
  --h2: {{ (heading_size * 0.833) | round }}px;
  --h3: {{ (heading_size * 0.6875) | round }}px;
  --h4: {{ (heading_size * 0.583) | round }}px;
  --h5: {{ (heading_size * 0.479) | round }}px;
  --h6: {{ (heading_size * 0.396) | round }}px;
  --h6-small: {{ (heading_size * 0.3333) | round }}px;

  {# Titles weight #}

  {% set title_weight = settings.headings_bold ? '700' : '400' %}

  --title-font-weight: {{ title_weight }};

  {#/*============================================================================
    #Layout
  ==============================================================================*/#}

  {# Spacing #}

  --spacing-base: 16px;
  --spacing-half: calc(var(--spacing-base) / 2);
  --spacing-quarter: calc(var(--spacing-base) / 4);

  --spacing-1: calc(var(--spacing-base) * 0.25);
  --spacing-2: calc(var(--spacing-base) * 0.5);
  --spacing-3: var(--spacing-base);
  --spacing-4: calc(var(--spacing-base) * 1.5);
  --spacing-5: calc(var(--spacing-base) * 3);

  {# Gutters #}

  --gutter: var(--spacing-base);
  --gutter-container: var(--gutter);
  --gutter-container-md: calc(var(--gutter) * 2);
  --gutter-negative: calc(var(--gutter) * -1);
  --gutter-half: calc(var(--gutter) / 2);
  --gutter-half-negative: calc(var(--gutter) * -1 / 2);
  --gutter-double: calc(var(--gutter) * 2);

  {#/*============================================================================
    #Misc
  ==============================================================================*/#}

  {# Transitions #}

  --transition-fast: all 0.05s ease;
  --transition-normal: all 0.3s ease;
  --transition-slow: all 1s ease;

  {# Shadows #}

  --drop-shadow: 0 0 8px 4px var(--main-foreground-opacity-05);

  {# Border radius #}

  --border-radius: 8px;
  --border-radius-medium: calc(var(--border-radius) / 1.3333);
  --border-radius-small: calc(var(--border-radius) / 2);
  --border-radius-smallest: calc(var(--border-radius) / 4);
  --border-radius-full: 100%;

  {# Border stroke #}

  --border-solid: 1px solid;

}

/* ============================================================
   PREMIUM UPGRADE — Minimalista Luxury
   ============================================================ */

h1, h2, h3, h4, h5, h6,
.h1, .h2, .h3, .h4, .h5, .h6 {
  letter-spacing: -0.01em;
}

.js-products-featured-title,
.js-products-new-title,
.js-products-sale-title {
  letter-spacing: 0.12em;
  text-transform: uppercase;
  font-weight: 600;
  margin-bottom: 2rem;
  padding-bottom: 0.75rem;
  position: relative;
}
.js-products-featured-title::after,
.js-products-new-title::after,
.js-products-sale-title::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 36px;
  height: 2px;
  background: var(--accent-color);
}

.section-home { padding-top: 3rem; padding-bottom: 3rem; }
@media (min-width: 768px) {
  .section-home { padding-top: 5rem; padding-bottom: 5rem; }
}

.js-product-container .product-item-image-container { overflow: hidden; }
.js-product-container .product-item-image-container img { transition: transform 0.55s ease; }
.js-product-container:hover .product-item-image-container img { transform: scale(1.04); }

/* Contener el badge dentro del slider de imágenes */
.product-images-slider {
  overflow: hidden;
}

.product-discount-overlay {
  position: absolute !important;
  top: 10px !important;
  left: 10px !important;
  right: auto !important;
  z-index: 10 !important;
  display: flex !important;
  flex-direction: column !important;
  align-items: flex-start !important;
  gap: 4px !important;
  pointer-events: none !important;
}
.product-discount-badge {
  display: inline-block;
  background: var(--accent-color);
  color: var(--button-foreground);
  font-size: 11px;
  font-weight: 700;
  padding: 3px 8px;
  letter-spacing: 0.06em;
  line-height: 1.4;
}
.product-price-badge {
  display: inline-block;
  background: rgba(0, 0, 0, 0.72);
  color: #fff;
  font-size: 11px;
  font-weight: 600;
  padding: 3px 8px;
  letter-spacing: 0.03em;
  line-height: 1.4;
}

.btn-primary, .btn-secondary {
  letter-spacing: 0.07em;
  text-transform: uppercase;
  font-size: var(--font-smallest);
  font-weight: 600;
}
.btn.btn-small {
  letter-spacing: 0.07em;
  text-transform: uppercase;
  font-size: var(--font-extra-smallest);
}

.js-footer { border-top: 1px solid var(--main-foreground-opacity-10); }
.js-footer a { letter-spacing: 0.02em; transition: var(--transition-fast); text-decoration: none; }
.js-footer a:hover { opacity: 0.7; }
.footer-main-info { padding-top: 3rem; padding-bottom: 3rem; }