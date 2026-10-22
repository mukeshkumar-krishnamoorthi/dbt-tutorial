{%- set apples = ['Gala', "Red Delicious", "Fuji", "Granny Smith"] -%}

{%- for apple in apples -%}
    {%- if apple == 'Gala' -%}    
        I Love {{ apple }}
    {%- else -%}
        I like {{ apple }}
    {%- endif -%}
    {{"\n"}}
    
{%- endfor -%}
