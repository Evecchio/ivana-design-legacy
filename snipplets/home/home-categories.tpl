{% if settings.slider_categories and settings.slider_categories is not empty %}
	<section class="section-home section-categories-home ivana-home-categories overflow-none py-10">
		<div class="container overflow-x-auto hide-scrollbar">
			<div class="ivana-home-section-head text-center mb-4">
				<p class="ivana-home-section-kicker mb-2">Coleccion curada</p>
				<h2 class="ivana-home-section-title mb-0">Explora la coleccion</h2>
			</div>
			<div class="d-flex justify-content-between align-items-start gap-4 pb-4 ivana-home-categories-row">
				{% for slide in settings.slider_categories %}
					{% if slide.link %}
						<a href="{{ slide.link | setting_url }}" class="js-home-category d-flex flex-column align-items-center group shrink-0 text-decoration-none" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
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
