view: distribution_centers {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.distribution_centers` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    label:"Number of Distribution Centers"
    type: count
    drill_fields: [id, name, products.count]
  }

###CUSTOM DIMENSIONS###
  dimension: location {
    label: "Distribution Center Location"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
}
