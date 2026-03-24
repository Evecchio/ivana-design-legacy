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
				<h2 class="ivana-home-section-title mb-0" style="display: inline-block !important; text-align: center !important; width: auto !important;">Colección</h2>
				<div class="ivana-home-section-divider"></div>
			</div>
			<div class="ivana-home-categories-slider position-relative">
				<div class="js-swiper-categories swiper-container ivana-home-categories-swiper">
					<div class="swiper-wrapper ivana-home-categories-row">
						{% for subcategory in unique_home_subcategories %}
							{# --- NUEVA LÓGICA AUTOMÁTICA --- #}
							{% set subcategory_handle = subcategory.url | split('://') | last | trim('/') | split('/') | last | trim %}

							{# 1. Intentamos obtener la imagen de la categoría configurada en Tiendanube #}
							{% set category_image = subcategory.image | default(false) %}

							{# 2. Si la categoría no tiene imagen, buscamos la imagen del primer producto de esa categoría #}
							{% if not category_image and subcategory.products is not empty %}
								{% set category_image = subcategory.products | first .featured_image %}
							{% endif %}

							{# 3. Si sigue sin haber imagen, usamos el fallback del slider como última instancia #}
							{% if not category_image %}
								{% for slide in settings.slider_categories %}
									{% if slide.link %}
										{% set slide_handle = slide.link | replace({'www.': ''}) | split('://') | last | trim('/') | split('/') | last | trim %}
										{% set normalized_subcategory_handle = subcategory_handle | replace({'www.': ''}) %}
										{% if slide_handle == normalized_subcategory_handle %}
											{% set category_image = slide.image %}
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
