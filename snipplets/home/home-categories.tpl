{% set unique_home_subcategories = [] %}
{% set rendered_home_subcategory_names = [] %}

{% for nav_item in navigation %}
	{% if nav_item.isCategory and nav_item.subitems %}
		{% for subcategory in nav_item.subitems %}
			{% if subcategory.isCategory %}
				{% set normalized_subcategory_name = subcategory.name | lower | trim %}
				{% if normalized_subcategory_name not in rendered_home_subcategory_names %}
					{% set rendered_home_subcategory_names = rendered_home_subcategory_names | merge([normalized_subcategory_name]) %}
					{% set unique_home_subcategories = unique_home_subcategories | merge([subcategory]) %}
				{% endif %}
			{% endif %}

			{% if subcategory.subitems %}
				{% for nested_subcategory in subcategory.subitems %}
					{% if nested_subcategory.isCategory %}
						{% set normalized_nested_subcategory_name = nested_subcategory.name | lower | trim %}
						{% if normalized_nested_subcategory_name not in rendered_home_subcategory_names %}
							{% set rendered_home_subcategory_names = rendered_home_subcategory_names | merge([normalized_nested_subcategory_name]) %}
							{% set unique_home_subcategories = unique_home_subcategories | merge([nested_subcategory]) %}
						{% endif %}
					{% endif %}
				{% endfor %}
			{% endif %}
		{% endfor %}
	{% endif %}
{% endfor %}

{% if unique_home_subcategories is not empty %}
	<section class="section-home section-categories-home ivana-home-categories overflow-none py-10">
		<div class="container">
			<div class="ivana-home-section-head text-center w-100" style="margin-bottom: var(--spacing-5) !important;">
				<h2 class="ivana-home-section-title mb-0" style="display: inline-block !important; text-align: center !important; width: auto !important;">Colección Destacada</h2>
				<div class="ivana-home-section-divider"></div>
			</div>
			<div class="ivana-home-categories-slider position-relative">
				<div class="js-swiper-categories swiper-container ivana-home-categories-swiper">
					<div class="swiper-wrapper ivana-home-categories-row">
						{% for subcategory in unique_home_subcategories %}
							{% set subcategory_handle = subcategory.url | split('://') | last | trim('/') | split('/') | last | trim %}
							{% set category_image = false %}

							{# Buscar imagen en el árbol de categories por handle #}
							{% for cat in categories %}
								{% if not category_image and cat.handle == subcategory_handle %}
									{% set category_image = cat.image | default(false) %}
								{% endif %}
								{% if not category_image and cat.subcategories %}
									{% for subcat in cat.subcategories %}
										{% if not category_image and subcat.handle == subcategory_handle %}
											{% set category_image = subcat.image | default(false) %}
										{% endif %}
										{% if not category_image and subcat.subcategories %}
											{% for subsubcat in subcat.subcategories %}
												{% if not category_image and subsubcat.handle == subcategory_handle %}
													{% set category_image = subsubcat.image | default(false) %}
												{% endif %}
											{% endfor %}
										{% endif %}
									{% endfor %}
								{% endif %}
							{% endfor %}

							{# Fallback: imagen configurada manualmente en slider_categories #}
							{% set fallback_slide_image = false %}
							{% if not category_image %}
								{% for slide in settings.slider_categories %}
									{% if slide.link %}
										{% set slide_handle = slide.link | replace({'www.': ''}) | split('://') | last | trim('/') | split('/') | last | trim %}
										{% set normalized_subcategory_handle = subcategory_handle | replace({'www.': ''}) %}
										{% if slide_handle == normalized_subcategory_handle %}
											{% set fallback_slide_image = slide.image %}
										{% endif %}
									{% endif %}
								{% endfor %}
							{% endif %}
							<div class="swiper-slide ivana-home-category-slide">
								<a href="{{ subcategory.url }}" class="js-home-category d-flex flex-column align-items-center group text-decoration-none category-item" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
									<div class="home-category-image-border ivana-home-category-circle w-28 h-28 md:w-36 md:h-36 rounded-circle overflow-hidden p-1 transition-all">
										<div class="w-100 h-100 rounded-circle overflow-hidden">
											{% if category_image %}
												{{ component(
													'image',{
														image_name: category_image,
														image_classes: 'd-block w-100 h-100 object-cover fade-in',
														image_lazy: true,
														image_lazy_js: true,
														image_alt: subcategory.name,
													})
												}}
											{% elseif fallback_slide_image %}
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
							</div>
						{% endfor %}
					</div>
				</div>
				<div class="js-swiper-categories-prev swiper-button-prev swiper-button-outside svg-icon-text d-none d-md-block">
					<svg class="icon-inline icon-2x icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
				</div>
				<div class="js-swiper-categories-next swiper-button-next swiper-button-outside svg-icon-text d-none d-md-block">
					<svg class="icon-inline icon-2x"><use xlink:href="#arrow-long"/></svg>
				</div>
			</div>
		</div>
	</section>
{% endif %}
