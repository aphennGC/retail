connection: "genai_assistant"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
include: "/**/*.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#


access_grant: can_view_inventory_data {
  user_attribute: department
  allowed_values: [ "Inventory"]
}

 explore: order_items {
  label: "Retail 🛍"
  access_filter: { ####userangiephenn@angiephenn.altostrat.com
  field: users.country
  user_attribute: country
  }
   join: orders {
    relationship: many_to_one
     sql_on: ${orders.order_id} = ${order_items.order_id} ;;
   }

   join: users {
     relationship: many_to_one
     sql_on: ${users.id} = ${orders.user_id} ;;
  }

  join: inventory_items {
    relationship: many_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id};;
 }
}

explore:  events{
  label: "Events 🗓"
  join: users {
    relationship: many_to_one
    sql_on: ${events.user_id} =${users.id} ;;
  }}

   explore: order_items_with_check {
    join: latest_current_order_item {
      type: left_outer
      relationship: many_to_one
      sql_on: ${order_items_with_check.product_id} = ${latest_current_order_item.product_id}
      AND ${latest_current_order_item.created_at_raw} <= {% parameter order_items_with_check.selected_date %};;
      }

    # Always include the parameter from the "order_items_with_check" view
    always_filter: {
      filters: {
        field: order_items_with_check.selected_date
        value: "{% parameter order_items_with_check.selected_date %}"
      }
    }
  }


#   explore: order_items {
#     label: "Retail 🛍"
# #sql_always_where: not ${inventory_items.is_sold} ;;
# #sql_always_having: ${total_sale_price} >= 100;;

# #always_filter: {
# #filters: [inventory_items.is_sold: "No"]
# #}

# #conditionally_filter: {
#     #filters: [inventory_items.is_sold: "No"]
#     #unless: [created_date]
# #}

#     access_filter: { ####userangiephenn@angiephenn.altostrat.com
#       field: users.country
#       user_attribute: country
#     }
#     join: orders {
#       relationship: many_to_one
#       sql_on: ${orders.order_id} = ${order_items.order_id} ;;
#     }

#     join: users {
#       relationship: many_to_one
#       sql_on: ${users.id} = ${orders.user_id} ;;
#     }

#     join: inventory_items {
#       relationship: many_to_one
#       sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
#     }

#     join: products {
#       relationship: many_to_one
#       sql_on: ${products.id} = ${order_items.product_id};;
#     }
#   }

#   explore:  events{
#     label: "Events 🗓"
#     join: users {
#       relationship: many_to_one
#       sql_on: ${events.user_id} =${users.id} ;;
#     }}

#   explore: order_items_with_check {
#     join: latest_current_order_item {
#       type: left_outer
#       relationship: many_to_one
#       sql_on: ${order_items_with_check.product_id} = ${latest_current_order_item.product_id}
#         AND ${latest_current_order_item.created_at_raw} <= {% parameter order_items_with_check.selected_date %};;
#     }

#     # Always include the parameter from the "order_items_with_check" view
#     always_filter: {
#       filters: {
#         field: order_items_with_check.selected_date
#         value: "{% parameter order_items_with_check.selected_date %}"
#       }
#     }
#   }
