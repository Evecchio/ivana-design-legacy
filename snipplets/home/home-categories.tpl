{% set unique_home_subcategories = [] %}
{% set rendered_home_subcategory_names = [] %}

{% for parent_category in categories %}
	{% set parent_subcategories = parent_category.subcategories(false) %}
	{% if parent_subcategories %}
		{% for subcategory in parent_subcategories %}
			{% set normalized_subcategory_name = subcategory.name | lower | trim %}
			{% if normalized_subcategory_name not in rendered_home_subcategory_names %}
				{% set rendered_home_subcategory_names = rendered_home_subcategory_names | merge([normalized_subcategory_name]) %}
				{% set unique_home_subcategories = unique_home_subcategories | merge([subcategory]) %}
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
					<a href="{{ subcategory.url }}" class="js-home-category d-flex flex-column align-items-center group shrink-0 text-decoration-none category-item" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
						<div class="home-category-image-border ivana-home-category-circle w-28 h-28 md:w-36 md:h-36 rounded-circle overflow-hidden p-1 transition-all">
							<div class="w-100 h-100 rounded-circle overflow-hidden">
								{% set subcategory_image = subcategory.images is not empty ? subcategory.images | first : false %}
								{% if subcategory_image %}
									{{ component(
										'image',{
											image_name: subcategory_image,
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
