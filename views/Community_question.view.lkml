view: community_question {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.order_items` ;;


  dimension_group: created_at {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

dimension: sales {
  type: number
  sql: ${TABLE}.sale_price  ;;

}

  parameter: date_selector {
    type: unquoted
    label: "Dynamic Date"
   allowed_value: {
    label: "Daily"
    value: "created_date"
  }
  allowed_value: {
    label: "Weekly"
    value: "created_week"
  }
  allowed_value: {
    label: "Monthly"
    value: "created_month"
  }
  default_value: "created_week"
}

 dimension: dynamic_time_frame {
  label: "Dynamic Time"
  label_from_parameter: date_selector
  type: date
  sql:
  {% if date_selector._parameter_value == 'created_date' %} ${created_at_raw}
  {% elsif date_selector._parameter_value == 'created_week' %} ${created_at_week}
  {% else %} ${created_at_month}
  {% endif %};;
  hidden: no
}
}
