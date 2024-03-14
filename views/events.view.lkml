view: events {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.events` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }
#cancel - canceled purchase
#cart - added item to cart
#department - chooses specific department
#home - goes on homepage
#product - looks at product
#purchase - buys product

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: sequence_number {
    type: number
    sql: ${TABLE}.sequence_number ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.id, users.first_name]
  }

###CUSTOM DIMENSIONS###


###CUSTOM MEASURES###
  measure: unique_visitors {
    label: "Unique Visitors"
    type: count_distinct
    description: "Uniqueness determined by IP Address and User Login"
    view_label: "Visitors"
    sql: ${ip_address} ;;
    drill_fields: [visitors*]
  }
  set: visitors {
    fields: [ip_address, session_id, browser, user_id, count]
  }
}
