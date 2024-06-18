
view: worldline {
  derived_table: {
    sql: SELECT
              product_id AS Account,
              created_at AS From_date,
              delivered_at AS To_date,
              sale_price AS Detail,
              Status AS IsCurrent,
              CASE
          WHEN To_date IS NULL OR To_date >= {% parameter selected_date %} -- Use parameter for date
          THEN TRUE
          ELSE FALSE
        END AS current_on_date
              FROM order_items
              WHERE product_id =14235 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account {
    type: number
    sql: ${TABLE}.Account ;;
  }

  dimension_group: from_date {
    type: time
    sql: ${TABLE}.From_date ;;
  }

  dimension_group: to_date {
    type: time
    sql: ${TABLE}.To_date ;;
  }

  dimension: detail {
    type: number
    sql: ${TABLE}.Detail ;;
  }

  dimension: is_current {
    type: string
    sql: ${TABLE}.IsCurrent ;;
  }

  dimension: current_on_date {
    type: string
    sql: ${TABLE}.current_on_date ;;
  }

  # Optional: Parameter to control the filter date
  parameter: selected_date {
    type: date
    label: "Select Date"
    default_value: "today"
  }

  set: detail {
    fields: [
      account,
      from_date_time,
      to_date_time,
      detail,
      is_current
    ]
  }
}
