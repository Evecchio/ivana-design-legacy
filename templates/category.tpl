{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 60 %}
{% endif %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
{% set normalized_category_name = category.name | lower | capitalize %}
{% if normalized_category_name == 'Productos' %}{% set normalized_category_name = 'Colección' %}{% endif %}
{% set normalized_category_description = category.description %}
{% set show_collection_cards = category.name | lower | trim == 'productos' %}

{% if not show_help %}
	<section class="category-body ivana-category-shell" data-store="category-grid-{{ category.id }}">
		<div class="container py-4">
			{% if category_banner %}
				{% include 'snipplets/category-banner.tpl' %}
			{% endif %}
			<div class="ivana-category-header">
				<div class="ivana-breadcrumbs ivana-category-breadcrumbs-row font-small mb-2">
					<a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ 'Inicio' | translate }}</a>
					<span class="separator">/</span>
					<span class="crumb active">{{ normalized_category_name }}</span>
				</div>
				<div class="grid grid-md-auto mb-md-4 align-items-end ivana-category-heading">
					<div class="mb-1 ivana-category-copy">
						<div class="grid grid-1-auto align-items-end ivana-category-title-row">
							<div class="ivana-category-title-block">
								<h1 class="ivana-category-title mb-0">{{ normalized_category_name }}</h1>
								{% if normalized_category_description %}
									<p class="font-small mt-2 mb-0 ivana-category-meta">{{ normalized_category_description }}</p>
								{% endif %}
							</div>
						</div>
					</div>
					{% if products %}
						<div class="d-none d-md-block ivana-category-toolbar">
						{{ component(
							'sort-by',{
								sort_by_classes: {
									container: 'mb-1 ivana-sort-box',
									select_group: "d-inline-block w-auto mb-0",
									select_label: "font-small d-block mb-1 ivana-category-toolbar-label",
									select: "form-select-small",
									select_svg: "icon-inline icon-xs icon-w-14 svg-icon-text",
								},
								select_svg_id: 'chevron-down'
							}) 
						}}
					</div>
					{% endif %}
				</div>
			</div>
			{% include 'snipplets/grid/filters-modals.tpl' %}
			<div class="ivana-category-layout{% if products and has_filters_available %} ivana-category-layout-filters{% endif %}">
				{% if products and has_filters_available %}
					<aside class="ivana-category-sidebar">
						<div class="ivana-category-filter-card">
							{% include 'snipplets/grid/filters-controls.tpl' %}
						</div>
					</aside>
				{% else %}
					<div class="ivana-category-sidebar d-none"></div>
				{% endif %}
				<div class="ivana-category-content">
					<div class="ivana-category-products ivana-category-grid">
						{% if show_collection_cards %}
							{% set allowed_categories = ['tops', 'capris', 'short', 'leggings'] %}
							{% set unique_home_subcategories = [] %}
							{% set all_subcategories = [] %}
							{% for nav_item in navigation %}
								{% if nav_item.isCategory and nav_item.subitems %}
									{% for subcategory in nav_item.subitems %}
										{% if subcategory.isCategory %}
											{% set all_subcategories = all_subcategories | merge([subcategory]) %}
										{% endif %}
										{% if subcategory.subitems %}
											{% for nested_subcategory in subcategory.subitems %}
												{% if nested_subcategory.isCategory %}
													{% set all_subcategories = all_subcategories | merge([nested_subcategory]) %}
												{% endif %}
											{% endfor %}
										{% endif %}
									{% endfor %}
								{% endif %}
							{% endfor %}
							{% for allowed_name in allowed_categories %}
								{% for subcategory in all_subcategories %}
									{% if subcategory.name | lower | trim == allowed_name %}
										{% if subcategory not in unique_home_subcategories %}
											{% set unique_home_subcategories = unique_home_subcategories | merge([subcategory]) %}
										{% endif %}
									{% endif %}
								{% endfor %}
							{% endfor %}
							{% if unique_home_subcategories is not empty %}
								<div class="ivana-category-collection-nav">
									<div class="d-flex justify-content-center align-items-start gap-4 pb-2 ivana-home-categories-row category-slider-mobile">
										{% for subcategory in unique_home_subcategories %}
											{% set subcategory_handle = subcategory.url | split('://') | last | trim('/') | split('/') | last | trim %}
											{% set fallback_slide_image = false %}
											{% for slide in settings.slider_categories %}
												{% if slide.link %}
													{% set slide_handle = slide.link | split('://') | last | trim('/') | split('/') | last | trim %}
													{% if slide_handle == subcategory_handle %}
														{% set fallback_slide_image = slide.image %}
													{% endif %}
												{% endif %}
											{% endfor %}
											<a href="{{ subcategory.url }}" class="js-home-category d-flex flex-column align-items-center group shrink-0 text-decoration-none category-item" aria-label="{{ subcategory.name }}">
												<div class="home-category-image-border ivana-home-category-circle w-28 h-28 md:w-36 md:h-36 rounded-circle overflow-hidden p-1 transition-all">
													<div class="w-100 h-100 rounded-circle overflow-hidden">
														{% if fallback_slide_image %}
															{{ component(
																'image',{
																	image_name: fallback_slide_image,
																	image_classes: 'd-block w-100 h-100 object-cover fade-in',
																	image_lazy: true,
																	image_lazy_js: true,
																	image_alt: subcategory.name,
																})
															}}
														{% else %}
															<div class="ivana-home-category-placeholder" aria-hidden="true"></div>
														{% endif %}
													</div>
												</div>
												<span class="mt-3 font-bold tracking-widest text-center ivana-home-category-name">
													{{ subcategory.name | lower }}
												</span>
											</a>
										{% endfor %}
									</div>
								</div>
							{% endif %}
						{% endif %}
						{% if not has_filters_available %}
							{% include 'snipplets/grid/filters-controls.tpl' %}
						{% endif %}
						{% include 'snipplets/grid/products-list.tpl' %}
					</div>
				</div>
			</div>
		</div>
	</section>
{% elseif show_help %}
	{# Category placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
