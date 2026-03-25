{% macro title_case(input) %}
  {% set small_words = ['de','la','las','los','el','y','o','a','en','con','por','para','sin','sobre','entre','ni'] %}
  {% set words = input|lower|split(' ') %}
  {% set result = [] %}
  {% for idx in 0..(words|length - 1) %}
    {% set w = words[idx] %}
    {% if idx == 0 or w not in small_words %}
      {% set cap = w|capitalize %}
    {% else %}
      {% set cap = w %}
    {% endif %}
    {% set result = result|merge([cap]) %}
  {% endfor %}
  {{ result|join(' ') }}
{% endmacro %}
