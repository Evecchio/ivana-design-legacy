{% set has_real_discount = product.compare_at_price and product.compare_at_price > product.price %}
{% set is_out_of_stock = not product.available %}
{% set is_low_stock = product.stock is not null and product.stock > 0 and product.stock < 5 %}
{% set slide_item = slide_item | default(false) %}
{% set slide_item_class = slide_item ? 'js-item-slide swiper-slide ' : '' %}

{# Item image slider logic #}
{% set show_image_slider = 
    (template == 'category' or template == 'search')
    and settings.product_item_slider
    and not reduced_item
    and not slide_item
    and not has_filters
    and product.other_images
%}

{% if show_image_slider %}
    {% set slider_controls_container_class = 'product-item-slider-controls-container svg-icon-text d-none d-md-block' %}
    {% set control_next_svg_id = 'arrow-long' %}
    {% set control_prev_svg_id = 'arrow-long' %}
{% endif %}

{# --- CONSTRUCCIÓN DE CONTENIDO PERSONALIZADO --- #}

{% set information_content %}
    
    {# 1. Barra de Ahorro (Debajo de la imagen) #}
    {% if has_real_discount %}
        <div class="ivana-card-savings-bar">
            Ahorrás {{ (product.compare_at_price - product.price) | money }}
        </div>
    {% endif %}

    {# 2. Título #}
    <div class="ivana-card-title-container">
        <h3 class="ivana-card-title">{{ product.name }}</h3>
    </div>

    {# 3. Precios y Descuento #}
    <div class="ivana-card-prices-block">
        {% if has_real_discount %}
            <span class="ivana-card-price-compare js-compare-price-display">{{ product.compare_at_price | money }}</span>
        {% endif %}
        <div class="ivana-card-price-row">
            <span class="ivana-card-price-main js-price-display">{{ product.price | money }}</span>
            {% if has_real_discount %}
                {% set percentage_off_custom_label = product.getPriceDiscountCustomLabel %}
                {% if percentage_off_custom_label and percentage_off_custom_label | trim %}
                    <span class="ivana-card-discount-tag">{{ percentage_off_custom_label }} OFF</span>
                {% endif %}
            {% endif %}
        </div>
    </div>

    {# 4. Cuotas #}
    {% if product.display_price %}
        <div class="ivana-card-installments-container">
            {{ component('installments', {
                location: 'product_list',
                short_wording: true,
                container_classes: {
                    installment: 'ivana-card-installments-text'
                }
            }) }}
        </div>
    {% endif %}

    {# 5. Transferencia #}
    {% if product.display_price %}
        <div class="ivana-card-transfer-container">
            <span class="ivana-card-transfer-text">10% de descuento</span> por transferencia
        </div>
    {% endif %}

    {# 6. Barra de Stock #}
    <div class="ivana-card-stock-container">
        {% if is_out_of_stock %}
            <div class="ivana-card-stock-bar ivana-card-stock-bar--out">Sin stock por el momento</div>
        {% elseif is_low_stock %}
            <div class="ivana-card-stock-bar ivana-card-stock-bar--low">
                {% if product.stock == 1 %}¡Última unidad!{% else %}¡Quedan solo {{ product.stock }} unidades!{% endif %}
            </div>
        {% endif %}
    </div>

{% endset %}

{# --- RENDER FINAL --- #}

{{ component(
    'product-item', {
        image_slider: show_image_slider,
        image_lazy: true,
        image_lazy_js: true,
        product_item_classes: {
            item: 'ivana-card js-product-container js-item-product ' ~ slide_item_class,
            information: 'ivana-card-info-container d-flex flex-column',
            name: 'hidden', 
            price: 'hidden',
            price_container: 'hidden',
        },
        custom_content: {
            information: information_content
        }
    })
}}
