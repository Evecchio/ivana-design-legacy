<aside class="ivana-product-logistics-panel" aria-label="{{ 'Envios y asistencia' | translate }}">
	<h2 class="ivana-product-logistics-title">{{ 'Envios y asistencia' | translate }}</h2>

	{# Product informative banners #}
	<div class="ivana-product-support-cards pb-4">
		{% include 'snipplets/product/product-informative-banner.tpl' %}
	</div>

	{# Shipping and pickup options #}

	{% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

	{% if show_product_fulfillment %}
		<div class="ivana-product-fulfillment pb-4 w-md-80">
			{# Shipping calculator and branch link #}

			<div id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
				{% if store.has_shipping %}
					{% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
				{% endif %}
			</div>

			{% if store.branches %}
				{# Link for branches #}
				{% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
			{% endif %}
		</div>

	{% endif %}
</aside>
