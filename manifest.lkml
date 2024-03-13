project_name: "ex-assistant-colab"

constant: dataset_model {
  value: "lookercoredemoangiephenn.trial_dataset.vertex_ai"
}

constant: context {
  value: "

  Dimensions :
  inventory_items.cost:
  inventory_items.created_date:
  inventory_items.created_month:
  inventory_items.created_quarter:
  inventory_items.created_time:
  inventory_items.created_week:
  inventory_items.created_year:
  inventory_items.id:
  inventory_items.product_brand:
  inventory_items.product_category:
  inventory_items.product_department:
  inventory_items.product_distribution_center_id:
  inventory_items.product_id:
  inventory_items.product_name:
  inventory_items.product_retail_price:
  inventory_items.product_sku:
  inventory_items.sold_date:
  inventory_items.sold_month:
  inventory_items.sold_quarter:
  inventory_items.sold_time:
  inventory_items.sold_week:
  inventory_items.sold_year:
  order_items.created_date:
  order_items.created_month:
  order_items.created_quarter:
  order_items.created_time:
  order_items.created_week:
  order_items.created_year:
  order_items.delivered_date:
  order_items.delivered_month:
  order_items.delivered_quarter:
  order_items.delivered_time:
  order_items.delivered_week:
  order_items.delivered_year:
  order_items.id:
  order_items.inventory_item_id:
  order_items.order_id:
  order_items.product_id:
  order_items.returned_date:
  order_items.returned_month:
  order_items.returned_quarter:
  order_items.returned_time:
  order_items.returned_week:
  order_items.returned_year:
  order_items.sale_price:
  order_items.shipped_date:
  order_items.shipped_month:
  order_items.shipped_quarter:
  order_items.shipped_time:
  order_items.shipped_week:
  order_items.shipped_year:
  order_items.status:
  order_items.user_id:
  orders.created_date:
  orders.created_month:
  orders.created_quarter:
  orders.created_time:
  orders.created_week:
  orders.created_year:
  orders.delivered_date:
  orders.delivered_month:
  orders.delivered_quarter:
  orders.delivered_time:
  orders.delivered_week:
  orders.delivered_year:
  orders.gender:
  orders.num_of_item:
  orders.order_id:
  orders.returned_date:
  orders.returned_month:
  orders.returned_quarter:
  orders.returned_time:
  orders.returned_week:
  orders.returned_year:
  orders.shipped_date:
  orders.shipped_month:
  orders.shipped_quarter:
  orders.shipped_time:
  orders.shipped_week:
  orders.shipped_year:
  orders.status:
  orders.user_id:
  products.brand:
  products.category:
  products.cost:
  products.department:
  products.distribution_center_id:
  products.id:
  products.name:
  products.retail_price:
  products.sku:
  users.age:
  users.city:
  users.country:
  users.created_date:
  users.created_month:
  users.created_quarter:
  users.created_time:
  users.created_week:
  users.created_year:
  users.email:
  users.first_name:
  users.gender:
  users.id:
  users.last_name:
  users.latitude:
  users.longitude:
  users.postal_code:
  users.state:
  users.street_address:
  users.traffic_source:

  Measures :
  inventory_items.count:
  order_items.count:
  orders.count:
  products.count:
  users.count:

  input: dimension_1 with measure_1 > 100
  output: fields=dimension_1&f[measure_1 ]=>100&sorts=measure_1&vis={\"type\":\"looker_grid\"}

  input: What s the measure_1 by dimension_1 as bar chart
  output: fields=dimension_1, measure_1&sorts=measure_1 desc&vis={\"type\":\"looker_bar\"}

  input: What s the measure_1, measure_2 by dimension_1 as line chart
  output: fields=dimension_1, measure_1, measure_2&sorts=measure_1 desc&vis={\"type\":\"looker_line\"}

  input: What\'s the measure_1 by dimnesion_1 and dimension_2 as bar chart
  output: fields=dimension_1, dimension_2, measure_1&pivots=dimension_2&sorts=measure_1 asc&limit=500&column_limit=50&vis={\"type\":\"looker_bar\"}

  input: What\'s the measure_1 by dimnesion_1, dimension_2  and dimension_3 as area chart
  output: fields=dimension_1, dimension_2, dimension_3, measure_1&pivots=dimension_3&sorts=measure_1 asc&&vis={\"type\":\"looker_area\"}

  input: top 10 dimension_1 by measure_1 desc as table
  output: fields=view.dimension_1,view.measure_1&sorts=view.measure_1 desc&limit=10&vis={\"type\":\"looker_grid\"}

  input: top 10 dimension_1 by measure 1 asc, plot as columm chart
  output: fields=view.dimension_1,view.measure_1&sorts=view.measure_1 asc&limit=10&vis={\"type\":\"looker_column\"}

  input: What s the measure_1 by dimension_1 as bar chart for last 7 days
  output: fields=dimension_1, measure_1&f[order_items.created_date]=7 days&sorts=measure_1 desc&vis={\"type\":\"looker_bar\"}

  input: What s the measure_1, measure_2 by dimension_1 for the last month
  output: fields=dimension_1, measure_1, measure_2&f[order_items.created_date]=30 days&sorts=measure_1 desc&vis={\"type\":\"looker_line\"}

  input: What\'s the measure_1 by dimnesion_1 and dimension_2 as bar chart this year
  output: fields=dimension_1, measure_1, measure_2&f[order_items.created_date]=this year&sorts=measure_1 desc&vis={\"type\":\"looker_line\"}

  input: What\'s the measure_1 by dimnesion_1, dimension_2  and dimension_3 this week ?  as area
  output: fields=dimension_1, dimension_2, measure_1&f[order_items.created_date]=this week&pivots=dimension_3&sorts=measure_1 desc&vis={\"type\":\"looker_area\"}

  input: What s the measure_1 for dimension_1 \'value\' for this week ?
  output: fields=measure_1&f[order_items.created_date]=this week&f[view.dimension_1]=value&sorts=measure_1 desc&vis={\"type\":\"single_value\"}

  input: What s the measure_1 for dimension_1 \'value\'  and \' value_other\' for this week ?
  output: fields=measure_1&f[order_items.created_date]=this week&f[view.dimension_1]=value, value_other&sorts=measure_1 desc&vis={\"type\":\"single_value\"}

  input: What s the measure_1 for dimension_1 \'value\'  and dimension 2 \'value_other\' for this week ?
  output: fields=measure_1&f[order_items.created_date]=this week&f[view.dimension_1]=value&f[view.dimension_2]=value_other&sorts=measure_1 desc&vis={\"type\":\"looker_bar\"}

  input: What s the measure_1 for dimension_1 \'value\'  and measure_2 => 2 for last week ? as pie chart
  output: fields=measure_1&f[order_items.created_date]=this week&f[view.dimension_1]=value&f[view.measure_2]=>=2&sorts=measure_1 desc&vis={\"type\":\"looker_pie\"}

  input: What s the measure_1 by date for the last 30 days ?
  output: fields=measure_1, events.date&f[order_items.created_date]=30 days&vis={\"type\":\"looker_line\"}

  input: What s the measure_1, measure_2 by date for the last 30 days for dimension_1 \'value\' ?
  output: fields=measure_1, measure_2,order_items.created_date&f[order_items.created_date]=30 days&f[view.dimension_1]=value&vis={\"type\":\"looker_line\"}

  input: What s the measure_1, dimension_1 by date for the last week for dimension_2 \'value\' ?
  output: fields=measure_1, measure_2,dimension_1, order_items.created_date&f[order_items.created_date]=30 days&f[view.dimension_2]=value&pivots=dimension_1&vis={\"type\":\"looker_line\"}

  input: measure_1 this year vs last year as column
  output: fields=order_items.created_year,view.measure_1&f[order_items.created_date]=this year, last year&vis={\"type\":\"looker_column\"}

  input: measure_1 this week vs last week as bar
  output: fields=order_items.created_week,view.measure_1&f[order_items.created_date]=this week, last week&vis={\"type\":\"looker_bar\"}

  input: measure_1 this month vs last month as bar
  output: fields=order_items.created_month,view.measure_1&f[order_items.created_date]=this month, last month&vis={\"type\":\"looker_bar\"}

  input: measure_1 today vs 7 days ago as bar chart
  output: fields=order_items.created_date,view.measure_1&f[order_items.created_date]=today, 7 days ago&vis={\"type\":\"looker_bar\"}

  input: measure_1 by dimension_1 this year vs last year as column
  output: fields=order_items.created_year,measure_1,dimension_1&f[order_items.created_date]=this year, last year&pivots=dimension_1&vis={\"type\":\"looker_column\"}

  input: measure_1  by dimension_1 this week vs last week as bar
  output:  fields=order_items.created_week,measure_1,dimension_1&f[order_items.created_date]=this week, last week&pivots=dimension_1&vis={\"type\":\"looker_bar\"}


  input: measure_1  by dimension_1 this month vs last month as bar
  output: fields=order_items.created_month,measure_1,dimension_1&f[order_items.created_date]=this month, last month&pivots=dimension_1&vis={\"type\":\"looker_bar\"}


  input: measure_1  by dimension_1 today vs 7 days ago as bar chart
  output: fields=order_items.created_date,measure_1,dimension_1&f[order_items.created_date]=today, 7 days ago&pivots=dimension_1&vis={\"type\":\"looker_bar\"}
  "
}
