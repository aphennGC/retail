connection: "genai_assistant"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: order_items {
  label: "Retail 🛍"
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
  }
}
