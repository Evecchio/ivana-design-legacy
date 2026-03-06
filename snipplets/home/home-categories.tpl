{% if settings.slider_categories and settings.slider_categories is not empty %}
	<div class="section-home section-categories-home overflow-none py-10">
		<div class="container overflow-x-auto hide-scrollbar">
			<div class="d-flex justify-content-between align-items-start gap-4 pb-4">
				{% for slide in settings.slider_categories %}
					{% if slide.link %}
						<a href="{{ slide.link | setting_url }}" class="js-home-category d-flex flex-column align-items-center group shrink-0 text-decoration-none" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
							<div class="home-category-image-border w-28 h-28 md:w-36 md:h-36 rounded-circle overflow-hidden p-1 transition-all" style="border: 2px solid transparent;">
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
							<span class="mt-3 text-[11px] font-bold tracking-widest uppercase text-center" style="font-size: 11px; color: #111;">
								{% set category_handle = slide.link | trim('/') | split('/') | last %}
								{% include 'snipplets/home/home-categories-name.tpl' %}
							</span>
						</a>
					{% endif %}
				{% endfor %}
			</div>
		</div>
	</div>
{% endif %}
