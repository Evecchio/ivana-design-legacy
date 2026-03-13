{% set description_content = product.description is not empty or settings.show_product_fb_comment_box %}
<div class="ivana-rich-content ivana-product-description-card mt-4 mb-2" data-store="product-description-{{ product.id }}">

	{% if product.description is not empty %}
		<div class="ivana-product-description-intro mb-4">
			<p class="ivana-kicker mb-2">{{ "Detalles del producto" | translate }}</p>
			<h2 class="ivana-product-description-title mb-2">{{ "Descripcion" | translate }}</h2>
			<p class="ivana-product-description-summary mb-0">Materiales, calce y recomendaciones para decidir la compra con mas claridad.</p>
		</div>
		<div class="ivana-product-description-layout">
			<div class="user-content mb-0 ivana-product-description-copy">
				{{ product.description }}
			</div>
			<aside class="ivana-product-description-aside">
				<div class="ivana-product-detail-note">
					<h3 class="ivana-product-detail-note-title mb-2">Antes de comprar</h3>
					<p class="mb-0">Si estas entre dos talles, usa la guia o escribinos por WhatsApp para elegir con mas seguridad.</p>
				</div>
				<div class="ivana-product-detail-note">
					<h3 class="ivana-product-detail-note-title mb-2">Cuidados</h3>
					<p class="mb-0">Segui las indicaciones de lavado de la prenda para conservar color, textura y ajuste por mas tiempo.</p>
				</div>
			</aside>
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
