<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
	<head>

		{{ component('head-tags') }}

		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		
		{# Preload LCP home, category and product page elements #}

		{% snipplet 'preload-images.tpl' %}

		<link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400,700') }}" />
		<link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
		<link rel="preload" href="{{ 'css/style-utilities.scss' | static_url }}" as="style" />
		<link rel="preload" href="{{ 'js/external-no-dependencies.js.tpl' | static_url }}" as="script" />

		{#/*============================================================================
			#CSS and fonts
		==============================================================================*/#}

		<style>
			{# Font families #}

			{{ component(
				'fonts',{
					font_weights: '400,700',
					font_settings: 'settings.font_headings, settings.font_rest'
				})
			}}

			{# General CSS Tokens #}

			{% include "static/css/style-tokens.tpl" %}
		</style>

		{# Critical CSS #}

		{{ 'css/style-critical.scss' | static_url | static_inline }}
		{{ 'css/style-utilities.scss' | static_url | static_inline }}

		{# Load async styling not mandatory for first meaningfull paint #}

		<link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

		{# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

		<style>
			{{ settings.css_code | raw }}
		</style>

		{# Ivana Design — Manrope Font #}
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">

		{# Ivana Design — Premium CSS v3 (Stitch) #}
		<style>
			/* === VARIABLES DE MARCA === */
			:root {
				/* ─── MARCA ─── */
				--brand:          #ff3377;
				--brand-dark:     #e62e6b;
				--brand-80:       rgba(255,51,119, 0.80);
				--brand-50:       rgba(255,51,119, 0.50);
				--brand-20:       rgba(255,51,119, 0.20);
				--brand-10:       rgba(255,51,119, 0.10);

				/* ─── NEUTROS ─── */
				--negro:          #000000;
				--gris-oscuro:    #333333;
				--gris:           #666666;
				--gris-claro:     #f5f5f5;
				--blanco:         #ffffff;

				/* ─── NEUTROS CON OPACIDAD ─── */
				--negro-80:       rgba(0,0,0, 0.80);
				--negro-50:       rgba(0,0,0, 0.50);
				--negro-10:       rgba(0,0,0, 0.10);
				--blanco-80:      rgba(255,255,255, 0.80);
				--blanco-20:      rgba(255,255,255, 0.20);
			}

			/* === BASE === */
			*,*::before,*::after{box-sizing:border-box}
			body{
				-webkit-font-smoothing:antialiased;
				-moz-osx-font-smoothing:grayscale;
				font-family:'Manrope',var(--body-font),sans-serif!important
			}
			img{display:block;max-width:100%}

			/* === TIPOGRAFÍA MANROPE === */
			h1,h2,h3,h4,h5,h6,
			.h1,.h2,.h3,.h4,.h5,.h6,
			p,span,div,li,a,button,input,select,textarea{
				font-family:'Manrope',var(--body-font),sans-serif!important
			}
			/* === LOGO ESTILO STITCH === */
			.logo-container a,
			.logo-container span,
			[class*="logo"] a,
			[class*="logo"] span {
				font-family: 'Manrope', sans-serif!important;
				font-weight: 800!important;
				font-style: italic!important;
				letter-spacing: -0.05em!important;
				text-transform: none!important;
				font-size: 1.5rem!important;
				color: var(--negro)!important
			}
			.logo-container a span,
			[class*="logo"] a span {
				color: var(--brand)!important
			}

			/* === BUSCADOR ESTILO STITCH === */
			[class*="search-form"] input,
			.search-container input {
				border-radius: 8px!important;
				border: 1px solid #e5e7eb!important; /* border-gray-200 */
				font-size: 14px!important;
				padding: 0.6rem 1rem!important;
				transition: all 0.2s ease!important
			}
			[class*="search-form"] input:focus {
				border-color: var(--brand)!important;
				box-shadow: 0 0 0 2px var(--brand-10)!important
			}
			[class*="search-form"] button {
				background: var(--negro)!important;
				color: #fff!important;
				border-radius: 0 8px 8px 0!important;
				padding: 0 1rem!important;
				transition: background 0.2s ease!important
			}
			[class*="search-form"] button:hover {
				background: var(--brand)!important
			}

			/* === NAVEGACIÓN === */
			.nav-desktop-container,
			.js-main-menu a,
			[class*="nav-link"],
			[class*="desktop-nav"] a{
				font-weight:700!important;
				letter-spacing:.15em!important;
				text-transform:uppercase!important;
				font-size:11px!important;
				color: #4b5563!important; /* Gray 600 de Stitch */
				transition: color .2s ease!important
			}
			.js-main-menu a:hover,
			[class*="nav-link"]:hover,
			[class*="desktop-nav"] a:hover{
				color: var(--brand)!important
			}

			/* === TÍTULOS DE SECCIONES === */
			.js-products-featured-title,
			.js-products-new-title,
			.js-products-sale-title,
			.h1, .h2, h1, h2 {
				font-size: 1.8rem!important;
				letter-spacing:-0.03em!important;
				text-transform: uppercase!important;
				font-weight: 900!important; /* Extra Black de Stitch */
				text-align: center!important;
				margin-bottom: 2.5rem!important;
				padding-bottom: 0!important;
				border-bottom: none!important;
				display: block!important;
				color: var(--negro)!important
			}
			@media(min-width: 768px) {
				.h1, h1 { font-size: 3.5rem!important; }
				.h2, h2 { font-size: 2.2rem!important; }
			}

			/* === SECCIONES HOME === */
			.section-home{padding-top:0!important;padding-bottom:0!important}
			/* Categorías: mismo padding para equidistancia */
			.section-categories-home{
				padding-top:3.5rem!important;
				padding-bottom:3.5rem!important
			}

			/* === CATEGORÍAS HOME === */
			.home-category-image{
				width:96px!important;
				height:96px!important;
				overflow:hidden!important
			}
			.home-category-image img{
				width:100%!important;
				height:100%!important;
				object-fit:cover!important;
				border-radius:50%!important;
				transition:transform .4s ease!important
			}
			.home-category-image-border{
				border-radius:50%!important;
				border:2px solid var(--negro-10)!important;
				overflow:hidden!important;
				transition:border-color .3s ease,box-shadow .3s ease!important
			}
			.js-home-category:hover .home-category-image-border{
				border-color:var(--brand)!important;
				box-shadow:0 0 0 3px var(--brand-20)!important
			}
			.js-home-category:hover .home-category-image img{
				transform:scale(1.08)!important
			}
			.home-category .my-3,
			.home-category [class*="font-medium"]{
				font-size:.62rem!important;
				font-weight:700!important;
				letter-spacing:.12em!important;
				text-transform:uppercase!important;
				color:var(--main-foreground)!important;
				transition:color .2s ease!important
			}
			.js-home-category:hover .home-category [class*="font-medium"],
			.js-home-category:hover .home-category .my-3{
				color:var(--brand)!important
			}

			/* === TARJETAS DE PRODUCTO — Clean Static Style con Fondo Suave === */
			.js-item-product,
			.product-item,
			.placeholder-shine,
			.placeholder-fade,
			.placeholder{
				background:#f9f9f9!important; /* Fondo suave fijo */
				position:relative!important;
				border-radius:8px!important;
				overflow:hidden!important;
				transition:none!important;
				box-shadow:0 2px 8px rgba(0,0,0,0.02)!important; /* Sombras muy sutiles fijas */
				transform:none!important;
				animation:none!important; 
				background-image:none!important 
			}

			/* Imagen: proporción 3:4 — FIJA, CENTRADA Y TOTAL (Cover) */
			.product-item-image-container,
			.js-product-item-image-container{
				position:relative!important;
				overflow:hidden!important;
				background:var(--gris-claro)!important;
				aspect-ratio:3/4!important;
				animation:none!important;
				background-image:none!important;
				display: block!important
			}
			.product-item-image-container img,
			.product-item-image,
			.js-item-product img,
			.img-absolute-centered-vertically,
			.js-product-item-image{
				width:100%!important;
				height:100%!important;
				object-fit:cover!important;
				object-position:center!important;
				transform:none!important;
				transition:none!important;
				animation:none!important;
				position: absolute!important;
				top: 0!important;
				left: 0!important;
				display: block!important;
				opacity: 1!important; 
				visibility: visible!important
			}

			/* Botón de compra directo en tarjeta - estático */
			.js-item-submit-container{
				display: block!important;
				opacity: 1!important;
				visibility: visible!important;
				margin-top: 1rem!important;
				padding: 0 0.75rem 1.25rem!important
			}
			.js-item-submit-container .btn{
				width: 100%!important;
				padding: 0.6rem!important;
				font-size: 0.65rem!important;
				border-radius: 4px!important;
				background: var(--brand)!important;
				color: #fff!important;
				border: none!important;
				text-transform: uppercase!important;
				font-weight: 700!important;
				letter-spacing: 0.05em!important
			}

			/* Desactivar cualquier movimiento o desplazamiento lateral de imagen en hover */
			.js-item-product:hover .product-item-image-container img,
			.product-item:hover .product-item-image,
			.js-item-product:hover img,
			.product-item-image-container img:hover{
				transform: none!important;
				transition: none!important;
				left: 0!important;
				right: auto!important;
				margin-left: 0!important;
				margin-right: 0!important
			}
			
			/* Ocultar cualquier botón que aparezca solo en hover */
			.js-item-product:hover .js-item-submit-container,
			.js-item-product:hover .cart-button-container,
			.js-item-product:hover .quick-shop-button,
			.product-item-image-container::after{
				display: none!important;
				opacity: 0!important;
				visibility: hidden!important
			}

			/* Info del producto */
			.js-item-product .information,
			.js-item-product [class*="information"]{
				padding:1rem .75rem 1.25rem!important
			}
			.js-item-product .item-name,
			.js-item-product a[class*="name"],
			.js-item-product [class*="item-name"]{
				font-size:.82rem!important;
				letter-spacing:.01em!important;
				font-weight:600!important;
				line-height:1.4!important;
				margin-bottom:.4rem!important
			}
			.js-item-product [class*="price"]:not([class*="compare"]){
				font-weight:800!important;
				font-size:1.05rem!important;
				color:var(--brand)!important;
				letter-spacing:-0.01em!important
			}
			.js-item-product [class*="compare"]{
				font-size:.7rem!important;
				opacity:.5!important;
				text-decoration:line-through!important;
				display:block!important;
				margin-bottom:2px!important
			}

			/* === GRILLA === */
			.grid{gap:1rem!important}
			@media(min-width:768px){.grid{gap:1.5rem!important}}

			/* === BADGES DE DESCUENTO === */
			.product-discount-overlay{
				position:absolute;
				top:10px;
				right:10px;
				z-index:3;
				display:flex;
				flex-direction:column;
				align-items:flex-end;
				gap:5px;
				pointer-events:none
			}
			.product-discount-badge{
				display:inline-block;
				background:var(--brand);
				color:#fff;
				font-size:11px;
				font-weight:800;
				padding:5px 12px;
				letter-spacing:.12em;
				text-transform:uppercase;
				line-height:1.4;
				border-radius:3px;
				font-family:'Manrope',sans-serif
			}
			.product-price-badge{
				display:inline-block;
				background:var(--negro-80);
				color:#fff;
				font-size:10px;
				font-weight:700;
				padding:5px 12px;
				letter-spacing:.04em;
				line-height:1.4;
				border-radius:3px;
				font-family:'Manrope',sans-serif
			}

			/* === BOTONES === */
			/* === BOTONES ESTILO PREMIUM STITCH === */
			.btn, .js-addtocart, .js-prod-submit-form {
				font-family: 'Manrope', sans-serif!important;
				font-weight: 700!important;
				letter-spacing: 0.08em!important;
				text-transform: uppercase!important;
				border-radius: 8px!important;
				transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1)!important;
				font-size: 13px!important;
				padding: 12px 24px!important;
				border: none!important;
				cursor: pointer!important
			}
			.btn-primary, .js-addtocart {
				background: var(--brand)!important;
				color: #fff!important;
				box-shadow: 0 4px 14px var(--brand-20)!important
			}
			.btn-primary:hover, .js-addtocart:hover {
				background: var(--brand-dark)!important;
				transform: translateY(-2px)!important;
				box-shadow: 0 6px 20px var(--brand-50)!important
			}
			.btn-block { width: 100%!important }

			/* === INPUTS Y FORMS STITCH === */
			input:not([type=submit]):not([type=checkbox]):not([type=radio]),
			select, textarea {
				border-radius: 8px!important;
				border: 1px solid #e5e7eb!important; /* border-gray-200 */
				padding: 0.75rem 1rem!important;
				font-family: 'Manrope', sans-serif!important;
				font-size: 14px!important;
				background: #fff!important;
				transition: border-color 0.2s ease!important
			}
			input:focus, select:focus, textarea:focus {
				outline: none!important;
				border-color: var(--brand)!important;
				box-shadow: 0 0 0 3px var(--brand-10)!important
			}

			/* === FOOTER — ROSA MARCA === */
			.js-footer, .footer-main-info {
				padding-top: 4rem!important;
				padding-bottom: 2rem!important;
				background: var(--brand)!important
			}
			.footer-secondary-info {
				border-top: 1px solid rgba(255,255,255,0.15)!important;
				padding: 2rem 0!important;
				font-size: 11px!important;
				color: rgba(255,255,255,0.7)!important
			}
			.js-footer h1, .js-footer h2, .js-footer h3, .js-footer h4, .js-footer h5, .js-footer h6 {
				text-transform: uppercase!important;
				font-size: 0.9rem!important;
				letter-spacing: 0.1em!important;
				margin-bottom: 1.5rem!important;
				font-weight: 800!important;
				text-align: left!important;
				color: #fff!important
			}

			/* === CARRITO ESTILO STITCH === */
			.cart-item {
				border-bottom: 1px solid #f3f4f6!important;
				padding-bottom: 1.5rem!important;
				margin-bottom: 1.5rem!important
			}
			.cart-item-name {
				font-weight: 700!important;
				font-size: 14px!important;
				color: var(--negro)!important;
				text-transform: uppercase!important
			}
			.js-cart-item-subtotal {
				font-weight: 800!important;
				color: var(--brand)!important;
				font-size: 1rem!important
			}
			.footer-secondary-info{
				padding-top:1.5rem!important;
				padding-bottom:1.5rem!important;
				border-top:1px solid var(--blanco-20)!important;
				font-size:.72rem!important;
				color:#fff!important;
				opacity:.85!important
			}

			/* === NEWSLETTER === */
			.js-home-newsletter-container{
				border-top:1px solid var(--main-foreground-opacity-10)!important;
				border-bottom:1px solid var(--main-foreground-opacity-10)!important
			}

			/* === BREADCRUMBS === */
			.breadcrumbs{
				font-size:.65rem!important;
				letter-spacing:.1em!important;
				opacity:.5!important;
				text-transform:uppercase!important
			}

			/* === UTILITIES — CUENTA & CARRITO === */
			.utilities-container{
				display:flex!important;
				align-items:center!important;
				gap:1.5rem!important
			}
			/* Cada item */
			.header-utility,
			.header-utility a,
			.header-utility div,
			.header-utility span {
				position:relative!important;
				display:flex!important;
				align-items:center!important;
				gap:.5rem!important;
				text-decoration:none!important;
				transition:color .2s ease!important;
				cursor:pointer;
				color: var(--negro)!important
			}
			.header-utility:hover,
			.header-utility:hover a,
			.header-utility:hover div,
			.header-utility:hover span {
				color:var(--brand)!important
			}

			/* Botones circulares de cabecera (Ivana Design - Stitch) */
			.header-icon {
				width: 38px!important;
				height: 38px!important;
				border-radius: 50%!important;
				background: var(--brand-10)!important;
				display: flex!important;
				align-items: center!important;
				justify-content: center!important;
				transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1)!important;
				color: var(--brand)!important;
				position: relative!important;
				flex-shrink: 0!important
			}
			.header-icon svg, 
			.header-icon i,
			.utility-icon {
				width: 18px!important;
				height: 18px!important;
				transition: all 0.3s ease!important;
				color: var(--brand)!important;
				fill: var(--brand)!important
			}
			.header-utility:hover .header-icon {
				background: var(--brand)!important;
				color: #fff!important;
				transform: scale(1.08)!important;
				box-shadow: 0 4px 12px var(--brand-20)!important
			}
			.header-utility:hover .header-icon svg,
			.header-utility:hover .utility-icon,
			.header-utility:hover .utility-icon use {
				color: #fff!important;
				fill: #fff!important
			}
			.header-utility:hover .utility-text span,
			.header-utility:hover a {
				color: var(--brand)!important
			}

			/* Badge del carrito — flotante esquina */
			.header-icon-big{
				position:relative!important;
				display:inline-flex!important
			}
			/* Badge del carrito — ajustado al círculo */
			.js-cart-widget-amount.badge{
				position:absolute!important;
				top:-2px!important;
				right:-2px!important;
				min-width:18px!important;
				height:18px!important;
				padding:0 4px!important;
				font-size:9px!important;
				font-weight:800!important;
				background:var(--brand)!important;
				color:#fff!important;
				border-radius:50px!important;
				line-height:18px!important;
				text-align:center!important;
				border:2px solid #fff!important;
				z-index: 10!important
			}

			/* Texto desktop de cuenta */
			.utility-text{
				display:flex!important;
				flex-direction:column!important;
				line-height:1.4!important;
				gap:1px!important
			}
			.utility-text a{
				font-size:.68rem!important;
				font-weight:600!important;
				letter-spacing:.04em!important;
				color:inherit!important;
				text-decoration:none!important;
				transition:color .2s ease!important
			}
			.utility-text a:hover{color:var(--brand)!important}
			.utility-text .font-weight-bold{
				font-size:.68rem!important;
				font-weight:700!important;
				text-transform:uppercase!important;
				letter-spacing:.06em!important
			}

			/* Total del carrito en rosa */
			.js-cart-widget-total{
				font-size:.72rem!important;
				font-weight:700!important;
				color:var(--brand)!important
			}
			/* === VARIANTES DE COLOR — Círculos === */
			.btn-variant-color{
				border: 2px solid #eee!important;
				padding: 4px!important;
				border-radius: 50%!important;
				width: 32px!important;
				height: 32px!important;
				min-width: 32px!important;
				display: inline-flex!important;
				align-items: center!important;
				justify-content: center!important;
				margin-right: 8px!important;
				margin-bottom: 8px!important;
				transition: all 0.2s ease!important;
				overflow: hidden!important;
				background: #fff!important
			}
			.btn-variant-color.selected{
				border-color: var(--brand)!important;
				box-shadow: 0 0 0 2px var(--brand-20)!important
			}
			.btn-variant-content-square{
				border-radius: 50%!important;
				width: 100%!important;
				height: 100%!important;
				display: block!important;
				border: 1px solid rgba(0,0,0,0.05)!important
			}
		</style>

		{#/*============================================================================
			#Javascript: Needed before HTML loads
		==============================================================================*/#}

		{# Defines if async JS will be used by using script_tag(true) #}

		{% set async_js = true %}

		{# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

		{% set nojquery = true %}

		{# Jquery async by adding script_tag(true) #}

		{% if load_jquery %}

			{{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

		{% endif %}

		{# Loads private Tiendanube JS #}

		{% head_content %}

		{# Structured data to provide information for Google about the page content #}

		{{ component('structured-data') }}

	</head>
	<body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

		{# Theme icons #}

		{% include "snipplets/svg/icons.tpl" %}

		{# Back to admin bar #}

		{{back_to_admin}}

		{# Header #}

		{% snipplet "header/header.tpl" %}

		{# Page content #}

		{% template_content %}

		{# Quickshop modal #}

		{% snipplet "grid/quick-shop.tpl" %}

		{# WhatsApp chat button #}

		{% snipplet "whatsapp-chat.tpl" %}

		{# Footer #}

		{% snipplet "footer/footer.tpl" %}

		{% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

			{# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

			<span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
			<span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
			<span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
			<span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
		{% endif %}

		{#/*============================================================================
			#Javascript: Needed after HTML loads
		==============================================================================*/#}

		{# Javascript used in the store #}

		{# Critical libraries #}

		{{ 'js/external-no-dependencies.js.tpl' | static_url | script_tag }}

		<script type="text/javascript">

			LS.ready.then(function(){

				{# Non critical libraries #}

				{% include "static/js/external.js.tpl" %}

				{# Specific store JS functions: product variants, cart, shipping, etc #}

				{% include "static/js/store.js.tpl" %}

			});

		</script>

		{# Google survey JS for Tiendanube Survey #}

		{{ component('google-survey') }}

		{# Store external codes added from admin #}

		{% if store.assorted_js %}
			<script>
				LS.ready.then(function() {
					var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
					jQueryNuvem('body').append(trackingCode);
				});
			</script>
		{% endif %}
	</body>
</html>
