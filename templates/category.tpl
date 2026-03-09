{# 1. Lógica obligatoria de paginación y filtros de Tiendanube #}
{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
    {% paginate by 12 %}
{% else %}
    {% paginate by 60 %}
{% endif %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}

{% if not show_help %}
<div class="max-w-[1440px] mx-auto w-full px-6 md:px-20 py-8" data-store="category-grid-{{ category.id }}">
    
    {# Banner de categoría opcional #}
    {% if category_banner %}
        <div class="mb-8 rounded-2xl overflow-hidden">
            {% include 'snipplets/category-banner.tpl' %}
        </div>
    {% endif %}

    <div class="mb-8 overflow-x-auto whitespace-nowrap scrollbar-hide">
        {% snipplet "snipplets/breadcrumbs.tpl" %}
    </div>

    <div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-4 mb-10">
        <div class="max-w-2xl">
            <p class="text-brand-pink font-bold text-sm mb-2 uppercase tracking-widest">
                {{ products_count }} {{ products_count == 1 ? 'producto' | translate : 'productos' | translate }}
            </p>
            <h1 class="text-4xl md:text-5xl font-black text-slate-900 dark:text-slate-100 mb-2">{{ category.name }}</h1>
            
            <p class="text-slate-600 dark:text-slate-400 text-lg">
                {% if category.description %}
                    {{ category.description }}
                {% else %}
                    {{ 'Explora la seleccion actualizada de la categoria y encontra prendas destacadas, novedades y promociones activas.' | translate }}
                {% endif %}
            </p>
        </div>
        
        {% if products %}
        <div class="flex items-center gap-3 bg-white dark:bg-slate-800 p-2 rounded-xl border border-slate-200 dark:border-slate-700">
            <label class="text-slate-600 dark:text-slate-400 text-sm font-bold pl-2 hidden md:block">{{ 'Ordenar por' | translate }}:</label>
            {{ component(
                'sort-by',{
                    sort_by_classes: {
                        container: 'mb-0',
                        select_group: "d-inline-block w-100 mb-0",
                        select_label: "d-none",
                        select: "form-select border-0 bg-transparent text-sm font-bold focus:ring-0 cursor-pointer",
                        select_svg: "icon-inline icon-xs icon-w-14 svg-icon-text hidden",
                    },
                    select_svg_id: 'chevron-down'
                })
            }}
        </div>
        {% endif %}
    </div>

    {% include 'snipplets/grid/filters-modals.tpl' %}

    <div class="flex flex-col lg:flex-row gap-12">
        
        {% if products and has_filters_available %}
        <aside class="hidden lg:block w-full lg:w-72 shrink-0 space-y-8">
            {% include 'snipplets/grid/filters-controls.tpl' %}
        </aside>
        {% endif %}

        <div class="flex-1">
            <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-8">
                {% for product in products %}
                    {% snipplet "snipplets/product-item.tpl" %}
                {% else %}
                    <div class="col-span-full text-center py-12">
                        <p class="text-slate-500 text-lg">No hay productos en esta categoría por el momento.</p>
                    </div>
                {% endfor %}
            </div>

            <div class="flex justify-center mt-16">
                {% snipplet "snipplets/grid/pagination.tpl" %}
            </div>
        </div>

    </div>
</div>

{% elseif show_help %}
    {# Pantalla de ayuda cuando la tienda es nueva y no tiene productos cargados #}
    {% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
