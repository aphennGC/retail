view: generate_query {

derived_table: {
  sql:
   SELECT JSON_EXTRACT_SCALAR(ml_generate_text_result, '$.predictions[0].content') AS generated_content
    FROM
  ML.GENERATE_TEXT(
    MODEL `@{dataset_model}`,


    (SELECT FORMAT('%s\ninput:%s\noutput:', context, {% parameter prompt %}) as prompt
    FROM ${context.SQL_TABLE_NAME}),
    STRUCT(
    0.1 AS temperature,
    1024 AS max_output_tokens,
    0.95 AS top_p,
    40 AS top_k))
    ;;
}

dimension: generated_content {
  type: string
  sql: ${TABLE}.generated_content ;;
}

parameter: prompt {
  type: string
  default_value: "Sales this week"
}
}

view: context {
  derived_table: {
    sql_create:
    DECLARE context STRING;
    SET context = """@{context}""";
    CREATE OR REPLACE TABLE ${SQL_TABLE_NAME} AS
    SELECT context;;
    persist_for: "72 hours" # Can be trigger by API call
  }

  dimension: context {}
}
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
