view: orders {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.orders` ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date,day_of_week, week,week_of_year, month,month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date,day_of_week, week,week_of_year, month,month_name, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: num_of_item {
    label: "Number of Items per Order"
    type: number
    sql: ${TABLE}.num_of_item ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date,day_of_week, week,week_of_year, month,month_name, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, day_of_week, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    label: "Total Orders"
    type: count
    drill_fields: [products.category, products.department]
    description: "Total number of Orders"
    html:
    <ul>
    <li>Orders Count: {{ value }}</li>
    <li>Department: {{ products.department }}</li>
    </ul> ;;
  }

  ###CUSTOM DIMENSIONS###
  dimension: gender_icon {
    type: string
    sql:
    CASE
    WHEN ${gender} = 'F' THEN '♀'
    ELSE '♂'
    END;;
  }
}
