{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 60 %}
{% endif %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}

{% if not show_help %}
	<section class="category-body ivana-category-shell" data-store="category-grid-{{ category.id }}">
		<div class="container py-4 py-md-5">
			{% if category_banner %}
				{% include 'snipplets/category-banner.tpl' %}
			{% endif %}
			<div class="ivana-page-hero ivana-category-header">
				<div class="ivana-category-heading">
					<div class="mb-1">
						{% snipplet "breadcrumbs.tpl" %}
						<p class="ivana-kicker mb-2">{{ products_count }} {{ products_count == 1 ? 'producto' | translate : 'productos' | translate }}</p>
						<h1 class="h4 mb-2">{{ category.name }}</h1>
						{% if category.description %}
							<p class="ivana-category-meta mt-0 mb-0">{{ category.description }}</p>
						{% else %}
							<p class="ivana-category-meta mt-0 mb-0">{{ 'Explora la seleccion actualizada de la categoria y encontra prendas destacadas, novedades y promociones activas.' | translate }}</p>
						{% endif %}
					</div>
					{% if products %}
						<div class="d-none d-md-block">
							<div class="ivana-sort-box">
								<label class="font-small mb-0">{{ 'Ordenar por' | translate }}</label>
								{{ component(
									'sort-by',{
										sort_by_classes: {
											container: 'mb-0',
											select_group: "d-inline-block w-100 mb-0",
											select_label: "d-none",
											select: "form-select-small",
											select_svg: "icon-inline icon-xs icon-w-14 svg-icon-text",
										},
										select_svg_id: 'chevron-down'
									})
								}}
							</div>
						</div>
					{% endif %}
				</div>
			</div>
			{% include 'snipplets/grid/filters-modals.tpl' %}
			<div class="grid ivana-category-grid{% if products and has_filters_available %} grid-md-auto-4{% endif %}">
				{% include 'snipplets/grid/filters-controls.tpl' %}
				{% include 'snipplets/grid/products-list.tpl' %}
			</div>
		</div>
	</section>
{% elseif show_help %}
	{# Category placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
