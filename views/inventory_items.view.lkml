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

  ###CUSTOM DIMENSIONS###
  dimension: is_sold {
    label: "Is Sold"
    type: yesno
    sql: ${sold_raw} is not null ;;
  }

  dimension: days_in_inventory {
    label: "Days in Inventory"
    description: "days between created and sold date"
    type: number
    sql: TIMESTAMP_DIFF(coalesce(${sold_raw}, CURRENT_TIMESTAMP()), ${created_raw}, DAY) ;;
  }

  dimension: days_in_inventory_tier {
    label: "Days In Inventory Tier"
    type: tier
    sql: ${days_in_inventory} ;;
    style: integer
    tiers: [0, 5, 10, 20, 40, 80, 160, 360]
  }

  dimension: days_since_arrival {
    label: "Days Since Arrival"
    description: "days since created - useful when filtering on sold yesno for items still in inventory"
    type: number
    sql: TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), ${created_raw}, DAY) ;;
  }

  dimension: days_since_arrival_tier {
    label: "Days Since Arrival Tier"
    type: tier
    sql: ${days_since_arrival} ;;
    style: integer
    tiers: [0, 5, 10, 20, 40, 80, 160, 360]
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
  measure: sold_count {
    label: "Sold Count"
    type: count
    drill_fields: [detail*]

    filters: {
      field: is_sold
      value: "Yes"
    }
  }

  measure: sold_percent {
    label: "Sold Percent"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${sold_count}/(CASE WHEN ${count} = 0 THEN NULL ELSE ${count} END) ;;
  }

  set: detail {
    fields: [id, products.item_name, products.category, products.brand, products.department, cost, created_time, sold_time]
  }
}
