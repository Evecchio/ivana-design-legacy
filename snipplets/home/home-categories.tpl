{% if settings.slider_categories and settings.slider_categories is not empty %}
	<section class="section-home section-categories-home ivana-home-categories overflow-none py-10">
		<div class="container">
			<div class="ivana-home-section-head text-center w-100" style="margin-bottom: var(--spacing-5) !important;">
				<h2 class="ivana-home-section-title mb-0" style="display: inline-block !important; text-align: center !important; width: auto !important;">Colección</h2>			
				<div class="ivana-home-section-divider"></div>	
				</div>
			<div class="d-flex justify-content-center align-items-start gap-4 pb-4 ivana-home-categories-row category-slider-mobile">
				{% for slide in settings.slider_categories %}
					{% if slide.link %}
						<a href="{{ slide.link | setting_url }}" class="js-home-category d-flex flex-column align-items-center group shrink-0 text-decoration-none category-item" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
							<div class="home-category-image-border ivana-home-category-circle w-28 h-28 md:w-36 md:h-36 rounded-circle overflow-hidden p-1 transition-all">
								<div class="w-100 h-100 rounded-circle overflow-hidden">
									{{ component(
										'image',{
											image_name: slide.image,
											image_classes: 'd-block w-100 h-100 object-cover fade-in',
											image_width: slide.width,
											image_height: slide.height,
											image_lazy: true,
											image_lazy_js: true,
											custom_content: '<div class="placeholder placeholder-fade"></div>',
											image_alt: 'Categoría' | translate ~ ' ' ~ loop.index,
										})
									}}
								</div>
							</div>
							<span class="mt-3 font-bold tracking-widest uppercase text-center ivana-home-category-name">
								{% set category_handle = slide.link | trim('/') | split('/') | last %}
								{% include 'snipplets/home/home-categories-name.tpl' %}
							</span>
						</a>
					{% endif %}
				{% endfor %}
			</div>
		</div>
	</section>
{% endif %}
