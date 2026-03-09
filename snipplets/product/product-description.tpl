{% set description_content = product.description is not empty or settings.show_product_fb_comment_box %}
<div class="ivana-rich-content ivana-product-description-card mt-4 mb-2" data-store="product-description-{{ product.id }}">

	{% if product.description is not empty %}
		<p class="ivana-kicker mb-2">{{ "Detalles del producto" | translate }}</p>
		<h2 class="ivana-product-description-title mb-3">{{ "Descripción" | translate }}</h2>
		<div class="user-content mb-4">
			{{ product.description }}
		</div>
	{% endif %}

	{% if settings.show_product_fb_comment_box %}
		<div class="fb-comments section-fb-comments mb-3" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
	{% endif %}
	<div id="reviewsapp"></div>

	<div class="ivana-product-description-social">
		{% include 'snipplets/social/social-share.tpl' %}
	</div>
</div>