view: test {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.order_items` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  ####your from_date
  dimension_group: created_at {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  ####your to_date
  dimension_group: delivered_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

###your account
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

###your details
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

#####the liquid parameter that enables you to insert the date you would like to check with if the account was current that date or not
  parameter: selected_date {
    type: date_time
    label: "Select Date"
    default_value: "today"
  }

  #####an additional dimension that compares your inserted date (“selected_date”) with from and to dates for this account and returns yes if the account was current at this point or no if not

  dimension: check_current_on_date {
    type: string
    sql:
       CASE
        WHEN ${delivered_at_raw} IS NULL OR ${delivered_at_raw} >= {% parameter selected_date %}
            AND ${created_at_raw} <= {% parameter selected_date %}
          THEN 'Yes'
          ELSE 'No'
      END
    ;;
  }
  }
