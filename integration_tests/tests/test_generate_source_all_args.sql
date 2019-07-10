{% set raw_schema = generate_schema_name('raw_data') %}

-- test all args
{% set source = codegen.generate_source(
    schema_name=raw_schema,
    database_name=target.database,
    generate_columns=True
) %}


{% set expected_source_yaml %}
version: 2

sources:
  - name: {{ raw_schema | trim }}
    tables:
      - name: data__a_relation
        columns:
          - name: col_a
          - name: col_b

{% endset %}

{{ assert_equal (actual_source_yaml | trim, expected_source | trim) }}
