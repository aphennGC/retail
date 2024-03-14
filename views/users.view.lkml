view: users {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.users` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, day_of_week, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: street_address {
    type: string
    sql: ${TABLE}.street_address ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

###CUSTOM DIMENSIONS###
  dimension: age_tier {
    type: tier
    tiers: [15,25,35,50,65]
    style: integer # the default value, could be excluded
    sql: ${age};;
  }

  dimension: country_flag{
    type: string
    sql:
    CASE
    WHEN ${country} = 'United States' THEN '🇺🇸' -- For Emoji
    WHEN ${country} = 'Canada' THEN '🇨🇦'
    WHEN ${country} = 'Germany' THEN '🇩🇪'
    WHEN ${country} = 'United Kingdom' THEN '🇬🇧'
    WHEN ${country} = 'Australia' THEN '🇦🇺'
    WHEN ${country} = 'Austria' THEN '🇦🇹'
    WHEN ${country} = 'Belgium' THEN '🇧🇪'
    WHEN ${country} = 'Brasil' THEN '🇧🇷'
    WHEN ${country} = 'China' THEN '🇨🇳'
    WHEN ${country} = 'Colombia' THEN '🇨🇴'
    WHEN ${country} = 'Spain' THEN '🇪🇸'
    WHEN ${country} = 'France' THEN '🇫🇷'
    WHEN ${country} = 'Japan' THEN '🇯🇵'
    WHEN ${country} = 'Poland' THEN '🇵🇱'
    WHEN ${country} = 'South Korea' THEN '🇰🇷'
    ELSE '🏳'
    END;;
  }

  dimension_group: tenure {
    label: "User group by tenure"
    type: duration
    intervals: [day]
    sql_start: ${created_date};; ##source: https://cloud.google.com/looker/docs/reference/param-field-dimension-group
    sql_end: CURRENT_DATE ;;
    description: "Calculates tenure of each customer"
  }

  dimension: tenure_category {
    label: "Tenure Category"
    type: string
    sql: case when ${days_tenure} > 90 then 'Establ. Customer' else 'New Customer' end ;; ##source: https://yaqs.corp.google.com/eng/q/5083940556208340992
    description: "Distinguishes between new customers and well established customers"
  }

##source: https://cloud.google.com/looker/docs/reference/param-dimension-filter-parameter-types#location
  dimension: location {
    label: "Customer Location"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

###CUSTOM MEASURES###
  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  last_name,
  first_name,
  orders.count,
  events.count,
  order_items.count
  ]
  }

}
