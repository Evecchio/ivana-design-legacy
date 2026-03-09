<div class="max-w-[1440px] mx-auto w-full px-6 md:px-20 py-8">
    
    <div class="mb-8 overflow-x-auto whitespace-nowrap scrollbar-hide">
        {% snipplet "snipplets/breadcrumbs.tpl" %}
    </div>

    <div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-4 mb-10">
        <div class="max-w-2xl">
            <h1 class="text-4xl md:text-5xl font-black text-slate-900 dark:text-slate-100 mb-2">{{ category.name }}</h1>
            {% if category.description %}
                <p class="text-slate-600 dark:text-slate-400 text-lg">{{ category.description }}</p>
            {% endif %}
        </div>
        
        <div class="flex items-center gap-3 bg-white dark:bg-slate-800 p-1.5 rounded-xl border border-slate-200 dark:border-slate-700">
            <span class="px-4 py-2 text-slate-600 dark:text-slate-400 text-sm font-bold">Ordenar por:</span>
        </div>
    </div>

    <div class="flex flex-col lg:flex-row gap-12">
        
        <aside class="w-full lg:w-72 shrink-0 space-y-8">
            {% snipplet "snipplets/grid/filters-controls.tpl" %}
        </aside>

        <div class="flex-1">
            <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-8">
                {% for product in products %}
                    {% snipplet "snipplets/product-item.tpl" %}
                {% else %}
                    <div class="col-span-full text-center py-12">
                        <p class="text-slate-500 text-lg">No hay productos en esta categoría por el momento.</p>
                    </div>
                {% endfor %}
            </div>

            <div class="flex justify-center mt-16">
                {% snipplet "snipplets/grid/pagination.tpl" %}
            </div>
        </div>

    </div>
</div>
