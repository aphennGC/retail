view: current_accounts {
  derived_table: {
    sql:
      SELECT
        id,
        created_at,
        delivered_at,
        product_id,
        status,
        CASE
            WHEN delivered_at_month IS NULL OR delivered_at_month >= {% parameter selected_month %}
                AND created_at <= {% parameter selected_month %}
            THEN 'Yes'
            ELSE 'No'
        END AS check_current_on_month
      FROM `lookercoredemoangiephenn.trial_dataset.order_items`
    ;;
  }

  # Dimensions from your original view:
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension:
  product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  # Parameter remains the same:
  parameter: selected_month {
    type: date_time
    label: "Select Month"
    default_value: "created_month"
  }

  # The "check_current_on_date" is now a regular dimension in the derived table
  dimension: check_current_on_month {
    type: string
    sql: ${TABLE}.check_current_on_month ;;  # No need for CASE statement here
  }
}
