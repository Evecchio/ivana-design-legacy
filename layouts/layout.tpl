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
		<link rel="stylesheet" href="{{ 'css/ivana-refresh.css' | static_url }}">

		{# Loads custom CSS added from Advanced Settings on the adminÂ´s theme customization screen #}

		<style>
			{{ settings.css_code | raw }}
		</style>

		{# Ivana Design â€” Manrope Font #}
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">

		{# Ivana Design â€” Premium CSS v3 (Stitch) #}
		<style>
			/* === VARIABLES DE MARCA === */
			:root {
				/* â”€â”€â”€ MARCA â”€â”€â”€ */
				--brand:          #FF1493;
				--brand-dark:     #cc007a;
				--brand-80:       rgba(255,20,147, 0.80);
				--brand-50:       rgba(255,20,147, 0.50);
				--brand-20:       rgba(255,20,147, 0.20);
				--brand-10:       rgba(255,20,147, 0.10);

				/* â”€â”€â”€ NEUTROS â”€â”€â”€ */
				--negro:          #111111;
				--gris-oscuro:    #333333;
				--gris:           #666666;
				--gris-claro:     #f8f8f8;
				--blanco:         #ffffff;

				/* â”€â”€â”€ NEUTROS CON OPACIDAD â”€â”€â”€ */
				--negro-80:       rgba(0,0,0, 0.80);
				--negro-50:       rgba(0,0,0, 0.50);
				--negro-10:       rgba(0,0,0, 0.10);
				--negro-05:       rgba(0,0,0, 0.05);
				--blanco-80:      rgba(255,255,255, 0.80);
				--blanco-20:      rgba(255,255,255, 0.20);
			}

				/* === EXPANSIÃ“N A ANCHO COMPLETO === */
			.container {
				max-width: none !important;
				padding-left: clamp(1rem, 4vw, 3rem) !important;
				padding-right: clamp(1rem, 4vw, 3rem) !important;
			}

			/* === TIPOGRAFÃA FLUIDA === */
			html {
				font-size: clamp(15px, 1.1vw, 20px);
			}

			/* === BASE === */
			*,*::before,*::after{box-sizing:border-box}
			html {
				width: 100% !important;
				overflow-x: hidden !important;
				margin: 0 !important;
				padding: 0 !important;
			}
			body{
				width: 100% !important;
				max-width: 100% !important;
				margin: 0 !important;
				padding: 0 !important;
				overflow-x: hidden !important;
				-webkit-font-smoothing:antialiased;
				-moz-osx-font-smoothing:grayscale;
				font-family:'Montserrat',var(--body-font),sans-serif!important;
				background-color: var(--blanco);
				font-size: clamp(15px, 1.1vw, 18px) !important;
				color: var(--negro);
				line-height: 1.5;
			}
			img{display:block;max-width:100%}
			::selection { background: var(--brand-20); color: var(--negro); }

			/* === TIPOGRAFÃA === */
			h1,h2,h3,h4,h5,h6, .h1,.h2,.h3,.h4,.h5,.h6, p,span,div,li,a,button,input,select,textarea {
				font-family:'Montserrat',var(--body-font),sans-serif!important;
			}

			/* === HEADER EMPROLIJADO === */
			.js-head-main {
				box-shadow: 0 1px 0 var(--negro-05);
				background: #fff !important;
			}
			.js-head-main .head-row,
			.head-row {
				padding-top: 0.625rem !important;
				padding-bottom: 0.625rem !important;
				align-items: center !important;
			}
			@media(min-width: 768px) {
				.js-head-main .head-row,
				.head-row { padding-top: 0.75rem !important; padding-bottom: 0.75rem !important; }
			}

			/* Logo */
			.logo-container img {
				max-height: 70px !important;
				transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) !important
			}
			.logo-container a:hover img { transform: scale(1.04) !important }
			@media(max-width: 768px) {
				.logo-container img { max-height: 44px !important; }
				.head-row { padding-top: 0.375rem !important; padding-bottom: 0.375rem !important; }
			}

			.logo-text-hidden {
				display: none !important;
				position: absolute !important;
				left: -9999px !important
			}

			/* Buscador */
			[class*="search-form"] input, .search-container input {
				border-radius: 100px!important;
				border: 1px solid #eeeeee!important;
				font-size: 13px!important;
				padding: 0 1.5rem!important;
				height: 44px!important;
				transition: all 0.3s ease!important;
				background: #fafafa!important;
			}
			[class*="search-form"] input:focus {
				border-color: var(--brand)!important;
				background: #fff!important;
				box-shadow: 0 4px 12px var(--brand-10)!important
			}
			[class*="search-form"] button {
				background: transparent !important;
				color: var(--negro)!important;
				position: absolute !important;
				right: 15px !important;
				top: 50% !important;
				transform: translateY(-50%) !important;
				border: none !important;
				padding: 0 !important;
			}
			[class*="search-form"] button svg { width: 18px !important; height: 18px !important; opacity: 0.5; }

			/* NavegaciÃ³n */
			.nav-desktop-container {
				border-top: 1px solid var(--negro-05);
				padding: 0.75rem 1.5rem !important;
				margin: 0 !important;
				text-align: left !important;
				width: 100% !important;
				max-width: 100% !important;
				box-sizing: border-box !important;
			}

			.nav-desktop-list {
				text-align: left !important;
				display: block !important;
				margin: 0 !important;
				padding: 0 !important;
				font-size: 0 !important;
			}

			.nav-desktop-list > .nav-item {
				display: inline-block !important;
				padding: 0 0.6rem !important;
				vertical-align: middle !important;
				font-size: 11px !important;
			}

			.js-main-menu a, [class*="nav-link"], [class*="desktop-nav"] a {
				font-weight: 700 !important;
				letter-spacing: .08em !important;
				text-transform: uppercase !important;
				font-size: 11px !important;
				color: #222 !important;
				padding: 0.5rem 0.4rem !important;
				transition: color .3s ease !important;
				display: inline-block !important;
				white-space: nowrap !important;
				line-height: 1.2 !important;
			}

			.js-main-menu a:hover {
				color: var(--brand) !important;
			}

			/* TÃ­tulos de secciÃ³n â€” base */
			.js-products-featured-title, .js-products-new-title, .js-products-sale-title, .h1, .h2, h1, h2 {
				font-size: 1.6rem!important;
				letter-spacing:-0.01em!important;
				font-weight: 800!important;
				text-align: center!important;
				margin-bottom: 2rem!important;
				color: var(--negro)!important;
				border-left: none !important;
				padding-left: 0 !important;
			}
			.js-products-featured-title::before, .js-products-new-title::before, .js-products-sale-title::before,
			.js-products-featured-title::after, .js-products-new-title::after, .js-products-sale-title::after {
				display: none !important;
				content: none !important;
			}
			@media(min-width: 768px) {
				.h1, h1 { font-size: 3rem!important; }
				.h2, h2 { font-size: 2.2rem!important; }
			}

			/* TÃ­tulo Super Descuentos â€” destacado */
			.js-products-sale-title {
				font-size: 2rem !important;
				color: var(--brand) !important;
				position: relative !important;
				display: inline-block !important;
				padding-bottom: 0.5rem !important;
			}
			.js-products-sale-title::after {
				display: block !important;
				content: '' !important;
				position: absolute !important;
				bottom: 0 !important;
				left: 50% !important;
				transform: translateX(-50%) !important;
				width: 48px !important;
				height: 3px !important;
				background: var(--brand) !important;
				border-radius: 2px !important;
			}

			/* Secciones Home */
			.section-home { padding-top:1rem!important; padding-bottom:1rem!important }
			@media(max-width: 768px) {
				.section-home { padding-top:0.75rem!important; padding-bottom:0.75rem!important }
			}
			.section-categories-home { padding-bottom:0.5rem!important }
			.js-products-sale-container { padding-top:0.5rem!important }

			/* === OCULTAR CATEGORÃAS DEL NAV === */
			.js-desktop-main-categories-col { display: none !important; }
			.js-main-categories-container,
			.main-categories-container { display: none !important; }

			/* === CATEGORÃAS HOME â€” cÃ­rculos perfectos === */
			.home-category-image-border {
				border-radius: 50% !important;
				border: 2px solid #eee !important;
				padding: 5px !important;
				overflow: hidden !important;
				flex-shrink: 0 !important;
				width: 88px !important;
				height: 88px !important;
				display: flex !important;
				align-items: center !important;
				justify-content: center !important;
				transition: border-color 0.3s ease, box-shadow 0.3s ease !important;
			}
			.home-category-image-border > div {
				border-radius: 50% !important;
				overflow: hidden !important;
				width: 100% !important;
				height: 100% !important;
			}
			.home-category-image-border img {
				width: 100% !important;
				height: 100% !important;
				object-fit: cover !important;
				object-position: center center !important;
				border-radius: 0 !important;
				transform: none !important;
				transition: none !important;
				display: block !important;
			}
			.js-home-category:hover .home-category-image-border {
				border-color: var(--brand) !important;
				box-shadow: 0 0 0 3px var(--brand-20) !important;
			}
			@media(min-width: 768px) {
				.home-category-image-border { width: 110px !important; height: 110px !important; }
			}

			/* === TARJETAS DE PRODUCTO === */
			.js-item-product, .product-item {
				background: #ffffff !important;
				border: 1px solid #ebebeb !important;
				border-radius: 10px !important;
				overflow: hidden !important;
				box-shadow: none !important;
				transform: none !important;
				transition: none !important;
				display: flex !important;
				flex-direction: column !important;
				height: 100% !important;
			}

			.js-item-product .product-item-image-container,
			.js-item-product .js-product-item-image-container {
				aspect-ratio: 3/4 !important;
				background: #f9f9f9 !important;
				border-radius: 8px 8px 0 0 !important;
				overflow: hidden !important;
				position: relative !important;
				width: 100% !important;
				display: block !important;
				flex-shrink: 0 !important;
			}
			.js-item-product .product-item-image-container img,
			.js-item-product .js-product-item-image-container img,
			.js-item-product .js-product-item-image,
			.js-item-product .product-item-image,
			.js-item-product .img-absolute,
			.js-item-product .img-absolute-centered-vertically {
				padding: 0 !important;
				object-fit: cover !important;
				object-position: center top !important;
				width: 100% !important;
				height: 100% !important;
				position: absolute !important;
				top: 0 !important;
				left: 0 !important;
				transform: none !important;
				transition: none !important;
				animation: none !important;
			}

			.js-item-product .information {
				padding: 0.75rem 1rem 1.25rem !important;
				text-align: left !important;
				display: flex !important;
				flex-direction: column !important;
				flex: 1 !important;
				gap: 3px !important;
			}
			/* === JERARQUÃA TIPOGRÃFICA â€” tarjeta de producto === */

			/* Nombre: negrita, bien visible â€” mÃ¡x 2 lÃ­neas */
			.js-item-product .item-name,
			.js-item-product a[class*="name"],
			.js-item-product [class*="item-name"] {
				font-size: 0.85rem !important;
				font-weight: 800 !important;
				color: #0f172a !important;
				line-height: 1.4 !important;
				letter-spacing: 0.01em !important;
				overflow: hidden !important;
				display: -webkit-box !important;
				-webkit-line-clamp: 2 !important;
				-webkit-box-orient: vertical !important;
				margin-bottom: 4px !important;
			}

			/* Precio de lista tachado: visible pero secundario */
			.js-item-product [class*="compare"] {
				color: #999 !important;
				font-size: 0.78rem !important;
				font-weight: 500 !important;
				text-decoration: line-through !important;
				opacity: 1 !important;
				display: block !important;
				margin-bottom: 1px !important;
			}

			/* Precio actual: protagonista */
			.js-item-product [class*="price"]:not([class*="compare"]) {
				font-size: 1.1rem !important;
				font-weight: 800 !important;
				color: #e8185a !important;
				line-height: 1.2 !important;
			}

			/* % OFF en Ã¡rea de texto: pequeÃ±o badge rosa */
			.js-item-product .product-item-discount,
			.js-item-product [class*="discount-rate"] {
				font-size: 0.65rem !important;
				font-weight: 700 !important;
				color: var(--brand) !important;
				background: var(--brand-10) !important;
				padding: 2px 7px !important;
				border-radius: 100px !important;
				letter-spacing: 0.04em !important;
				vertical-align: middle !important;
				display: inline-block !important;
			}

			/* Cuotas: info auxiliar, discreta */
			.js-item-product .custom-installments,
			.js-item-product [class*="installments"] {
				font-size: 0.7rem !important;
				font-weight: 500 !important;
				color: #888 !important;
				display: block !important;
				margin-top: 3px !important;
			}

			/* Con Transferencia: beneficio, en verde */
			.js-item-product [class*="payment-discount"],
			.js-item-product .text-accent {
				font-size: 0.68rem !important;
				font-weight: 600 !important;
				color: #16a34a !important;
				display: block !important;
				margin-top: 3px !important;
			}

			/* Stock urgente: en naranja, itÃ¡lica */
			.js-item-product .text-stock,
			.js-item-product [class*="text-stock"],
			.js-item-product .js-last-product,
			.js-item-product .js-latest-products-available {
				font-size: 0.68rem !important;
				font-weight: 600 !important;
				color: #ea580c !important;
				font-style: italic !important;
				display: block !important;
				margin-top: 4px !important;
			}

			/* === FOOTER ROSA MARCA === */
			.js-footer, .footer-main-info {
				padding-top: 5rem!important;
				padding-bottom: 4rem!important;
				background: var(--brand) !important;
			}
			.js-footer h1, .js-footer h2, .js-footer h3, .js-footer h4, .js-footer h5, .js-footer h6 {
				color: #fff !important;
				font-size: 0.8rem !important;
				letter-spacing: 0.15em !important;
				margin-bottom: 2rem !important;
				text-transform: uppercase !important;
				font-weight: 800;
				text-align: left !important;
			}
			.js-footer a, .js-footer p, .js-footer li { color: rgba(255,255,255,0.8) !important; font-size: 0.85rem !important; transition: color 0.3s ease; }
			.js-footer a:hover { color: #fff !important; }

			.footer-secondary-info {
				background: var(--brand-dark) !important;
				color: rgba(255,255,255,0.7) !important;
				padding: 1.5rem 0 !important;
				font-size: 11px !important;
				border-top: 1px solid rgba(255,255,255,0.15) !important;
			}

			/* Accesorios de Cabecera */
			.header-icon {
				background: #f8f8f8 !important;
				width: 44px !important;
				height: 44px !important;
				border: 1px solid #eee !important;
				border-radius: 50% !important;
				display: flex !important;
				align-items: center !important;
				justify-content: center !important;
				transition: all 0.3s ease !important;
			}
			.header-icon svg, .utility-icon { width: 20px !important; height: 20px !important; fill: #111 !important; transition: all 0.3s ease !important; }
			.header-utility:hover .header-icon { background: var(--brand) !important; border-color: var(--brand) !important; }
			.header-utility:hover .header-icon svg { fill: #fff !important; }

			/* Carrito Badge */
			.js-cart-widget-amount.badge {
				position: absolute !important;
				top: -5px !important;
				right: -5px !important;
				background: var(--brand) !important;
				color: #fff !important;
				border: 2px solid #fff !important;
				border-radius: 50px !important;
				font-size: 10px !important;
				padding: 2px 6px !important;
			}

			/* Sin animaciones â€” carga rÃ¡pida */
			.js-item-product,
			.js-item-product * {
				animation: none !important;
			}

			/* === PAGINAS INTERNAS (CONTACTO, CARRITO, ETC) === */
			.template-contact input:not([type="submit"]), .template-contact textarea,
			#shoppingCartPage .page-header, .category-body h1 {
				border-radius: 12px !important;
				border: 1px solid #eee !important;
				padding: 12px 18px !important;
			}
			.template-contact input[type="submit"], #shoppingCartPage .btn-primary {
				background: var(--brand) !important;
				border-radius: 100px !important;
				font-weight: 700 !important;
				text-transform: uppercase !important;
				letter-spacing: 0.1em !important;
				padding: 14px 30px !important;
			}

			/* Scrollbar Premium */
			::-webkit-scrollbar { width: 8px; }
			::-webkit-scrollbar-track { background: #f1f1f1; }
			::-webkit-scrollbar-thumb { background: #ccc; border-radius: 10px; }
			::-webkit-scrollbar-thumb:hover { background: var(--brand); }

			html { scroll-behavior: smooth; }

			/* === BARRA PROMO === */
			.ivana-promo-bar {
				background: var(--brand-dark);
				color: #fff;
				text-align: center;
				padding: 0.5rem 1rem;
				font-size: 10px;
				font-weight: 700;
				letter-spacing: 0.1em;
				text-transform: uppercase;
				font-family: 'Montserrat', sans-serif;
				line-height: 1.6;
				white-space: normal;
				word-break: keep-all;
			}
			@media(min-width: 768px) {
				.ivana-promo-bar { font-size: 11px; letter-spacing: 0.14em; white-space: nowrap; }
			}

			/* Scroll horizontal en mobile para categorÃ­as */
			.section-categories-home .container,
			[class*="home-categories"] {
				overflow-x: auto !important;
				-webkit-overflow-scrolling: touch !important;
				scrollbar-width: none !important;
				-ms-overflow-style: none !important;
				flex-wrap: nowrap !important;
			}
			[class*="home-categories"]::-webkit-scrollbar { display: none !important; }

			/* === VER PRODUCTO â€” hover overlay === */
			.product-ver-overlay {
				position: absolute;
				inset: 0;
				background: rgba(0,0,0,0.06);
				display: flex;
				align-items: flex-end;
				padding: 0.75rem;
				opacity: 0;
				transition: opacity 0.3s ease;
				z-index: 2;
				text-decoration: none;
			}
			.js-item-product:hover .product-ver-overlay { opacity: 1; }
			.product-ver-btn {
				display: block;
				width: 100%;
				background: var(--brand);
				color: #fff !important;
				padding: 0.55rem 0;
				font-weight: 700;
				font-size: 0.7rem;
				text-transform: uppercase;
				letter-spacing: 0.1em;
				border-radius: 6px;
				border: none;
				cursor: pointer;
				font-family: 'Montserrat', sans-serif;
				text-align: center;
				transition: background 0.2s ease;
			}
			.product-ver-btn:hover { background: #1A1A1A; color: #fff !important; }

			/* Ocultar botÃ³n de submit siempre visible â€” se usa VER PRODUCTO overlay */
			.js-item-submit-container { display: none !important; }

			/* === BADGES DESCUENTO â€” top-left como en el diseÃ±o === */
			.product-discount-overlay {
				position: absolute;
				top: 10px;
				left: 10px;
				right: auto !important;
				z-index: 3;
				display: flex;
				flex-direction: column;
				align-items: flex-start;
				gap: 4px;
				pointer-events: none;
			}
			/* Badge % OFF â€” sobre la imagen, rosa */
			.product-discount-badge {
				background: var(--brand);
				color: #fff;
				font-size: 9px;
				font-weight: 800;
				padding: 4px 9px;
				border-radius: 4px;
				letter-spacing: 0.06em;
				text-transform: uppercase;
				font-family: 'Montserrat', sans-serif;
				display: inline-block;
			}
			/* === NAV â€” sin dropdown en ningÃºn Ã­tem === */
			.js-main-menu li ul,
			.js-main-menu li .nav-dropdown,
			.js-main-menu li [class*="dropdown"],
			.js-main-menu li [class*="submenu"],
			.nav-desktop-main li ul,
			.nav-desktop-main li [class*="dropdown"],
			.nav-desktop-main li [class*="submenu"] {
				display: none !important;
			}

			/* === IGUAL ALTURA EN TARJETAS â€” li padre del grid === */
			.js-product-list > li,
			.product-list > li,
			[class*="product-list"] > li {
				display: flex !important;
				flex-direction: column !important;
			}

			/* === PÃGINA DE PRODUCTO â€” secciÃ³n envÃ­o y retiro === */
			/* Evitar que elementos hereden fondo/texto oscuro inesperado */
			.template-product [class*="shipping"],
			.template-product [class*="pickup"],
			.template-product .js-shipping-calculator,
			.template-product [data-store*="shipping"] {
				background-color: #fff !important;
			}
			.template-product [class*="shipping"] *:not(img):not(svg):not(path):not(use),
			.template-product [class*="pickup"] *:not(img):not(svg):not(path):not(use),
			.template-product .js-shipping-calculator *:not(img):not(svg):not(path):not(use) {
				color: #222 !important;
				background-color: transparent !important;
			}
			/* Cajas individuales de opciÃ³n de envÃ­o */
			.template-product [class*="shipping-option"],
			.template-product [class*="shipping-method"],
			.template-product [class*="delivery-option"] {
				background: #f8f8f8 !important;
				border: 1px solid #e5e5e5 !important;
				border-radius: 8px !important;
				padding: 0.75rem !important;
			}

			/* Badge AhorrÃ¡s â€” sobre la imagen, naranja suave */
			.product-price-badge {
				background: #fff7ed !important;
				color: #c2410c !important;
				font-size: 9px !important;
				font-weight: 700 !important;
				padding: 4px 9px !important;
				border-radius: 4px !important;
				border: 1px solid #fed7aa !important;
				letter-spacing: 0.02em !important;
				font-family: 'Montserrat', sans-serif !important;
				box-shadow: 0 1px 3px rgba(194,65,12,0.15) !important;
				display: inline-block !important;
			}
			/* === IVANA REFRESH V2: BASE GLOBAL + HOME === */
			body,
			.body-font {
				font-family: 'Montserrat', var(--body-font), sans-serif !important;
				background: #ffffff !important;
				color: #1f2937 !important;
			}

			.ivana-promo-bar,
			.product-discount-badge,
			.product-price-badge,
			.product-ver-btn {
				font-family: 'Montserrat', var(--body-font), sans-serif !important;
			}

			.ivana-promo-bar {
				background: var(--brand) !important;
				padding: 0.7rem 1rem !important;
				font-size: 0.68rem !important;
				letter-spacing: 0.22em !important;
			}

			.js-head-main {
				box-shadow: none !important;
				border-bottom: 1px solid rgba(17, 24, 39, 0.06) !important;
			}

			.js-head-main .head-row,
			.head-row {
				padding-top: 1rem !important;
				padding-bottom: 1rem !important;
			}

			.logo-container img {
				max-height: 78px !important;
			}

			.search-container {
				max-width: 680px !important;
				width: 100% !important;
			}

			[class*="search-form"] input,
			.search-container input {
				height: 46px !important;
				font-size: 0.95rem !important;
				background: #ffffff !important;
				border-color: #e5e7eb !important;
				box-shadow: none !important;
			}

			.utilities-container {
				gap: clamp(0.75rem, 1.6vw, 1.5rem) !important;
			}

			.header-utility {
				color: #374151 !important;
			}

			.header-utility:hover {
				color: var(--brand) !important;
				text-decoration: none !important;
			}

			.nav-desktop-container {
				border-top: 1px solid rgba(17, 24, 39, 0.05) !important;
				padding-top: 0.9rem !important;
				padding-bottom: 0.9rem !important;
			}

			.nav-desktop-list > .nav-item {
				padding: 0 0.75rem !important;
			}

			.js-main-menu a,
			[class*="nav-link"],
			[class*="desktop-nav"] a {
				font-size: 0.72rem !important;
				letter-spacing: 0.14em !important;
			}

			.ivana-home-hero {
				padding-top: 0 !important;
			}

			.ivana-home-section-head {
				margin-bottom: clamp(1.5rem, 4vw, 2.5rem) !important;
			}

			.ivana-home-section-kicker {
				color: #6b7280 !important;
				font-size: 0.72rem !important;
				font-weight: 700 !important;
				letter-spacing: 0.28em !important;
				text-transform: uppercase !important;
			}

			.ivana-home-section-title,
			.js-products-sale-title,
			.js-products-featured-title,
			.js-products-new-title {
				font-family: 'Montserrat', var(--body-font), sans-serif !important;
				font-size: clamp(2rem, 4.2vw, 3.8rem) !important;
				line-height: 0.96 !important;
				letter-spacing: -0.06em !important;
				color: #111827 !important;
				text-transform: uppercase !important;
				margin-bottom: 0 !important;
				display: block !important;
			}

			.js-products-sale-title::after,
			.ivana-home-section-divider {
				display: none !important;
			}

			.ivana-home-categories {
				padding-top: clamp(2.5rem, 5vw, 4.5rem) !important;
				padding-bottom: clamp(2rem, 4vw, 3.5rem) !important;
			}

			.ivana-home-categories-row {
				gap: clamp(1.4rem, 2.4vw, 2.6rem) !important;
			}

			.home-category-image-border {
				width: 108px !important;
				height: 108px !important;
				border: 2px solid #efefef !important;
				padding: 4px !important;
				background: #ffffff !important;
			}

			.ivana-home-category-name {
				font-size: 0.72rem !important;
				font-weight: 700 !important;
				letter-spacing: 0.14em !important;
				color: #374151 !important;
				margin-top: 1rem !important;
			}

			.ivana-home-products {
				padding-top: clamp(1rem, 3vw, 2rem) !important;
				padding-bottom: clamp(2rem, 4vw, 3rem) !important;
			}

			.ivana-home-products .js-products-sale-grid,
			.ivana-home-products .js-products-featured-grid,
			.ivana-home-products .js-products-new-grid {
				display: grid !important;
				gap: clamp(1rem, 1.8vw, 1.5rem) !important;
			}

			.js-item-product,
			.product-item {
				border-radius: 0 !important;
				border-color: #ececec !important;
			}

			.js-item-product .information {
				padding: 1rem 1rem 1.25rem !important;
				gap: 0.25rem !important;
			}

			.js-item-product .item-name,
			.js-item-product a[class*="name"],
			.js-item-product [class*="item-name"] {
				font-size: 0.76rem !important;
				font-weight: 800 !important;
				letter-spacing: 0.06em !important;
				text-transform: uppercase !important;
				min-height: 2.9em !important;
			}

			.js-item-product .js-price-display,
			.js-item-product .product-item-price,
			.js-item-product [class*="product-item-price"]:not([class*="compare"]) {
				font-size: 1.35rem !important;
				font-weight: 800 !important;
				color: var(--brand) !important;
				line-height: 1.1 !important;
			}

			.js-item-product .price-compare,
			.js-item-product [class*="compare"] {
				font-size: 0.8rem !important;
				color: #9ca3af !important;
				margin-bottom: 0.15rem !important;
			}

			.js-item-product .product-item-discount,
			.js-item-product [class*="discount-rate"] {
				background: transparent !important;
				padding: 0 !important;
				border-radius: 0 !important;
				color: #16a34a !important;
				font-size: 0.62rem !important;
				font-weight: 800 !important;
				letter-spacing: 0.1em !important;
			}

			.js-item-product .custom-installments,
			.js-item-product [class*="installments"] {
				font-size: 0.72rem !important;
				color: #6b7280 !important;
			}

			.js-item-product [class*="payment-discount"],
			.js-item-product .text-accent {
				font-size: 0.7rem !important;
				color: var(--brand) !important;
			}

			.product-discount-overlay {
				top: 12px !important;
				left: 12px !important;
				gap: 0.35rem !important;
			}

			.product-discount-badge {
				border-radius: 6px !important;
				font-size: 0.62rem !important;
				letter-spacing: 0.14em !important;
			}

			.product-price-badge {
				background: rgba(255, 255, 255, 0.96) !important;
				border: 1px solid rgba(230, 0, 126, 0.22) !important;
				color: var(--brand) !important;
				box-shadow: 0 6px 14px rgba(15, 23, 42, 0.08) !important;
			}

			.product-ver-overlay {
				background: linear-gradient(180deg, rgba(255, 255, 255, 0) 45%, rgba(17, 24, 39, 0.18) 100%) !important;
			}

			.product-ver-btn {
				background: #ffffff !important;
				color: #111827 !important;
				border-radius: 999px !important;
				padding: 0.7rem 0 !important;
				font-size: 0.68rem !important;
				letter-spacing: 0.16em !important;
			}

			.product-ver-btn:hover {
				background: var(--brand) !important;
				color: #ffffff !important;
			}

			.ivana-home-products-link {
				background: #ffffff !important;
				color: #111827 !important;
				border: 1.5px solid #111827 !important;
			}

			.ivana-home-products-link:hover {
				background: #111827 !important;
				color: #ffffff !important;
			}

			@media (min-width: 1200px) {
				.ivana-home-products .js-products-sale-grid,
				.ivana-home-products .js-products-featured-grid,
				.ivana-home-products .js-products-new-grid {
					grid-template-columns: repeat(5, minmax(0, 1fr)) !important;
				}
			}

			@media (min-width: 768px) and (max-width: 1199px) {
				.ivana-home-products .js-products-sale-grid,
				.ivana-home-products .js-products-featured-grid,
				.ivana-home-products .js-products-new-grid {
					grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
				}
			}

			@media (max-width: 767px) {
				.ivana-promo-bar {
					font-size: 0.62rem !important;
					letter-spacing: 0.16em !important;
				}

				.js-head-main .head-row,
				.head-row {
					padding-top: 0.65rem !important;
					padding-bottom: 0.65rem !important;
				}

				.logo-container img {
					max-height: 48px !important;
				}

				[class*="search-form"] input,
				.search-container input {
					height: 42px !important;
					font-size: 0.88rem !important;
				}

				.ivana-home-section-title,
				.js-products-sale-title,
				.js-products-featured-title,
				.js-products-new-title {
					font-size: clamp(1.75rem, 10vw, 2.6rem) !important;
				}

				.home-category-image-border {
					width: 94px !important;
					height: 94px !important;
				}

				.ivana-home-category-name {
					font-size: 0.66rem !important;
				}
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
