view: inventory_items {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.inventory_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }
  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }
  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }
  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }
  dimension_group: sold {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sold_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, order_items.count]
  }
  ###CUSTOM MEASURES###
  measure: total_inventory_cost {
    label: "Total Inventory Costs"
    type: sum
    sql: ${cost} ;;
    value_format: "$#,##0.00"
    description: "Sum of the Costs of all Items bought"
  }
  measure: average_inventory_cost {
    label: "AVG Inventory Costs"
    type: average
    sql: ${cost} ;;
    value_format: "$#,##0.00"
    description: "Average Costs for bought Items"
  }
}
