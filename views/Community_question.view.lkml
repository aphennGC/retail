view: community_question {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.order_items` ;;

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }


  parameter: date_selector {
    type: unquoted
    label: "Dynamic Date"
   allowed_value: {
    label: "Daily"
    value: "date"
  }
  allowed_value: {
    label: "Weekly"
    value: "week"
  }
  allowed_value: {
    label: "Monthly"
    value: "month"
  }
  default_value: "week"
}

  dimension: dynamic_date {
    type: string
    datatype: date
    sql: date_trunc(${TABLE}.transaction_date, {% parameter time_period_selector %}) ;;
}
}
