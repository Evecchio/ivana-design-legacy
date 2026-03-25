{%- macro normalizar_texto(texto) -%}
    {%- if not texto -%}
        {{- texto -}}
    {%- else -%}
        {# Pasa el texto a minúsculas excepto la primera letra #}
        {%- set texto_normalizado = texto | lower -%}
        
        {# Corrige palabras específicas que deben mantener mayúsculas #}
        {%- set palabras_especiales = {
            'ivana': 'Ivana',
            'capris': 'Capris',
            'capri': 'Capri',
            'leggings': 'Leggings',
            'legging': 'Legging',
            'tops': 'Tops',
            'short': 'Short'
        } -%}
        
        {%- for palabra, reemplazo in palabras_especiales -%}
            {%- set texto_normalizado = texto_normalizado | replace(palabra, reemplazo) -%}
        {%- endfor -%}
        
        {# Capitaliza la primera letra #}
        {{- texto_normalizado | capitalize -}}
    {%- endif -%}
{%- endmacro -%}