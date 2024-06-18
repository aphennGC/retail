view: test {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.order_items` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: from_date {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: to_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: account {
    type: string
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: detail {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: iscurrent {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name,
      products.name,
      products.id,
      orders.order_id
    ]
  }

  parameter: selected_date {
    type: date_time
    label: "Select Date"
    default_value: "today"
  }
  dimension: current_on_date {
    type: string
    sql:
       CASE
        WHEN ${to_date_raw} IS NULL OR ${to_date_raw} >= {% parameter selected_date %}
            AND ${from_date_raw} <= {% parameter selected_date %}
          THEN 'Yes'
          ELSE 'No'
      END
    ;;
  }
}
