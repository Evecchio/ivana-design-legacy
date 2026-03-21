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
			<div class="d-flex justify-content-start align-items-start gap-4 pb-4 ivana-home-categories-row category-slider-mobile">
				{% for subcategory in unique_home_subcategories %}
					{% set subcategory_handle = subcategory.url | split('://') | last | split('/') | last | trim %}
					{% set fallback_slide_image = false %}
					{% for slide in settings.slider_categories %}
						{% if slide.link %}
							{% set slide_handle = slide.link | split('://') | last | split('/') | last | trim %}
							{% if slide_handle == subcategory_handle %}
								{% set fallback_slide_image = slide.image %}
							{% endif %}
						{% endif %}
					{% endfor %}
					<a href="{{ subcategory.url }}" class="js-home-category d-flex flex-column align-items-center group shrink-0 text-decoration-none category-item" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
						<div class="home-category-image-border ivana-home-category-circle w-28 h-28 md:w-36 md:h-36 rounded-circle overflow-hidden p-1 transition-all">
							<div class="w-100 h-100 rounded-circle overflow-hidden">
								{% if fallback_slide_image %}
									{{ component(
										'image',{
											image_name: fallback_slide_image,
											image_classes: 'd-block w-100 h-100 object-cover fade-in',
											image_lazy: true,
											image_lazy_js: true,
											custom_content: '<div class="placeholder placeholder-fade"></div>',
											image_alt: subcategory.name,
										})
									}}
								{% else %}
									<div class="placeholder placeholder-fade w-100 h-100"></div>
								{% endif %}
							</div>
						</div>
						<span class="mt-3 font-bold tracking-widest uppercase text-center ivana-home-category-name">
							{{ subcategory.name | lower }}
						</span>
					</a>
				{% endfor %}
			</div>
		</div>
	</section>
{% endif %}
