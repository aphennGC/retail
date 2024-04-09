view: order_items {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.order_items` ;;
  drill_fields: [id]

#dynamic dimension
#parameters:
parameter: date_granularity {
  label: "Date Granularity Selector"
  type:  unquoted #could be string, date etc
  default_value: "created_month" #if I dont choose any value - this will be selected automatically
  allowed_value: {
    value: "created_date"
    label: "Date" #this is what is displayed on the object
  }
  allowed_value: {
    value: "created_week" #when I choose Week my parameter excepts value created_week
    label: "Week"
  }
  allowed_value: {
    value: "created_month"
    label: "Month"
  }
  hidden: no
}

#dimension for my parameter
dimension: dynamic_time_frame {
  label: "Date Granularity 🧨"
  label_from_parameter: date_granularity
  type: string
  #liquid = ruby based language (when my user selects created_date show created_date, if ....
  sql:
  {% if date_granularity._parameter_value == 'created_date' %} ${created_date}
  {% elsif date_granularity._parameter_value == 'created_date' %} ${created_week}
  {% else %} ${created_month}
  {% endif %};;
  hidden: no
}

####dynamic measure
#parameter
  parameter: metric_selector {
    label: "Metric Selector"
    type:  unquoted #could be string, date etc
    default_value: "total_sale_price" #if I dont choose any value - this will be selected automatically
    allowed_value: {
      value: "total_sale_price"
      label: "Total Sales" #this is what is displayed on the object
    }
    allowed_value: {
      value: "average_sale_price" #when I choose Average Sales my parameter excepts value average_sale_price
      label: "Average Sales"
    }
    allowed_value: {
      value: "total_gross_revenue"
      label: "Total Gross Sales"
    }
    hidden: no
  }
#measure for parameter
  measure: dynamic_metric {
    label: "Dynamic Metric 🧨"
    label_from_parameter: metric_selector
    type: number
    value_format: "[<1000]#,##0.0;[<1000000]#,##0.0,\" K\";#,##0.0,,\" M\""
    sql:
      {% if metric_selector._parameter_value == 'total_sale_price' %} ${total_sale_price}
      {% elsif metric_selector._parameter_value == 'average_sale_price' %} ${average_sale_price}
      {% elsif metric_selector._parameter_value == 'total_gross_revenue' %} ${total_gross_revenue}
      {% else %} ${total_sale_price}
      {% endif %};;
    hidden: no
  }

#test DB cascading filter#####
  parameter: reporting_year {
    label: "Reporting Year Selector"
    type:  date #could be string, date etc
    default_value: "created_year" #if I dont choose any value - this will be selected automatically
    allowed_value: {
      value: "2022"
      label: "Two Years Ago" #this is what is displayed on the object
    }
    allowed_value: {
      value: "2023" #when I choose Average Sales my parameter excepts value average_sale_price
      label: "Last Year"
    }
    allowed_value: {
      value: "2024"
      label: "Current year"
    }
    hidden: no
  }
#dimension for my parameter
  dimension: dynamic_reporting_date{
    label: "Dynamic Reporting Date 🌞"
    label_from_parameter: reporting_year
    type: string
    #liquid = ruby based language (when my user selects created_date show created_date, if ....
    sql:
{% if reporting_year._parameter_value == '2022' %}
  ${created_date} BETWEEN '01-01-2022' AND '31-12-2022'
{% elsif reporting_year._parameter_value == '2023' %}
  ${created_date} BETWEEN '01-01-2023' AND '31-12-2023'
{% elsif reporting_year._parameter_value == '2024' %}
  ${created_date} BETWEEN '01-01-2024' AND '31-12-2024'
{% else %} ${created_date} < '01-01-2022'
{% endif %}
;;
    hidden: no
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, day_of_week, date, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

###CUSTOM DIMENSIONS###

###CUSTOM MEASURES###
  measure: total_sale_price {
    label: "Total Sale Price"
    type: sum
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
    description: "Sum of Prices of all sold Items" ##always at the end
  }

  measure: average_sale_price {
    label: "AVG Sale Price"
    type: average
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
    description: "Average Price of sold Items"
  }

  measure: cumulative_total_sales{
    label: "Cumulative Sale Price"
    type: running_total
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
    description: "Continuous Sum / Accumulation of Sale Prices"
  }

  measure: total_gross_revenue {
    label: "Total Revenue [completed sales]"
    type: sum
    sql: ${sale_price} ;;
    filters: [status: "-cancelled, -returned"] ##excl. Cancelled or Returned
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    ##source: https://cloud.google.com/looker/docs/custom-formatting
    ##[>=1000000] check if number is greater or equal to 1,000,000
    ##$0.00,,\"M\" if YES than format number with two decimal places ('$0.00') an add "M" for millions - use backslashes as escape characters in this example to escape the double quotes "" - indicates that the character immediately following the backslash should be treated specially
    ##[>=1000] check if number is greater or equal to 1,000, but less than 1,000,000
    ##$0.00,\"K\" if YES than format number with two decimal places ('$0.00') an add "K" for thousands
    ## if number is less than 1,000 than format number with two decimals places ('$0.00') without adding an additional suffix
    ##source: https://cloud.google.com/looker/docs/best-practices/how-to-conditional-formatting-with-value_format?hl=de
    ##source: https://cloud.google.com/looker/docs/custom-formatting?hl=de#custom_formatting_examples
    description: "Only Revenue from Completed Sales"
  }

  measure: number_returned_items {
    label: "Number of Items Returned"
    type: sum
    sql: count ${order_id} ;;
    filters: [status: "Returned"]
    description: "Total of returned Items"
  }

  measure:  item_return_rate{
    label: "Item Return Rate"
    type: number
    value_format_name: percent_1
    sql: ${number_returned_items} / NULLIF(${count},0} ;;
    description: "Item Return Rate %"
  }

  measure: active_users { ##As there is a difference to users.count it seems some users are only registered without buying anything
    label: "Active Users"
    type:  count_distinct
    sql: ${user_id} ;;
    description: "Number of users that actually buy products"
  }

  measure: number_of_dissatisfied_customers {
    label: "Number of Customers Returning Items"
    type: count_distinct ##Number of users who have returned an item at some point - to me this definition indicates count distinct
    sql: ${user_id} ;;
    filters: [status: "Returned"]
    description: "Number of dissatisfied Customers"
  }

  measure: percentage_of_users_with_returns {
    label: "Percentage of Users with Returns"
    type: number
    value_format_name: percent_1
    sql: ${number_of_dissatisfied_customers} / NULLIF(${active_users},0) ;; ##at this point I dont care about the users that are only registered
    description: "Share of dissatisfied Customers"
  }

  measure: average_spend_per_customer {
    label: "AVG Spend per Customer"
    type: number
    drill_fields: [users.gender, users.age_tier, active_users]
    link: {
      label: "Number of Active Users by Gender and Age Tier" ##source:https://cloud.google.com/looker/docs/best-practices/how-to-use-more-powerful-data-drilling?hl=de
      url: "{{link}}&pivots=users.gender"
    }
    sql: ${total_sale_price} / ${active_users};;
    value_format_name: "usd"
    description: "Average Spend per Customer"
  }

  measure: total_gross_margin_amount{
    label: "Total Gross Margin"
    type: number
    sql: ${total_gross_revenue} - ${inventory_items.total_inventory_cost} ;; ##changes in total_gross_revenue will be cascading
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    description: "Total Gross Profit"
  }

  measure: average_gross_margin{
    label: "AVG Gross Margin"
    type: average
    filters: [status: "-cancelled, -returned"]
    sql: ${sale_price} - ${inventory_items.cost};;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    description: "AVG Total Gross Profit"
  }

  measure: gross_margin{
    label: "Gross Margin %"
    type: number
    drill_fields: [products.category, products.brand, gross_margin]
    link: {
      label: "Main Driver of Gross Margin" ##source:https://cloud.google.com/looker/docs/best-practices/how-to-use-more-powerful-data-drilling?hl=de
      url: "{{link}}&pivots=products.category"
    }
    sql: ${total_gross_margin_amount} / NULLIF(${total_gross_revenue},0) ;;
    value_format_name: "percent_1"
    description: "Gross Margin %"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.last_name,
  users.id,
  users.first_name,
  inventory_items.id,
  inventory_items.product_name,
  products.name,
  products.id,
  orders.order_id
  ]
  }

}
