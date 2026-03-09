<section class="ivana-page-shell">
	<div class="container py-4 py-md-5">
		{% embed "snipplets/page-header.tpl" with {page_header_class: 'ivana-page-hero', page_header_title_class: 'ivana-page-title'} %}
			{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
		{% endembed %}
		<div class="user-content ivana-rich-content pb-5">
			{{ page.content }}
		</div>
	</div>
</section>
