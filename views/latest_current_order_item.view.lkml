view: latest_current_order_item {
  derived_table: {
    sql:
      WITH current_orders AS (
        SELECT
          product_id,
          created_at,
          ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY created_at DESC) AS rn
        FROM order_items_with_check
        WHERE check_current_on_date = 'Yes'
      )

      SELECT
      product_id,
      created_at
      FROM current_orders
      WHERE rn = 1
      ;;
  }

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
}
