- dashboard: purple_oldschool_header
  title: purple_oldschool_header
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: iK8YJQvjPNZEXvuRlA0V3q
  elements:
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"text-align: center; display: inline-block;\">\n<a style=\"\
      \n\tcolor: #4285F4;\n    border: solid 1px #4285F4;\n    float: left;\n    font-weight:\
      \ 400;\n    text-align: center;\n    vertical-align: middle;\n    cursor: pointer;\n\
      \    user-select: none;\n    padding: 10px;\n    margin: 5px;\n    font-size:\
      \ 1rem;\n    line-height: 1.5;\n    border-radius: 5px;\"\n    href=\"#\">\n\
      \    This is a button!\n</a>\n\n<a style=\"\n\tcolor: #EA4335;\n    border:\
      \ solid 1px #EA4335;\n    float: left;\n    font-weight: 400;\n    text-align:\
      \ center;\n    vertical-align: middle;\n    cursor: pointer;\n    user-select:\
      \ none;\n    padding: 10px;\n    margin: 5px;\n    font-size: 1rem;\n    line-height:\
      \ 1.5;\n    border-radius: 5px;\"\n    href=\"#\">\n    This is a button!\n\
      </a>\n\n<a style=\"\n\tcolor: #FBBC04;\n    border: solid 1px #FBBC04;\n   \
      \ float: left;\n    font-weight: 400;\n    text-align: center;\n    vertical-align:\
      \ middle;\n    cursor: pointer;\n    user-select: none;\n    padding: 10px;\n\
      \    margin: 5px;\n    font-size: 1rem;\n    line-height: 1.5;\n    border-radius:\
      \ 5px;\"\n    href=\"#\">\n    This is a button!\n</a>\n\n<a style=\"\n\tcolor:\
      \ #34A852;\n    border: solid 1px #34A852;\n    float: left;\n    font-weight:\
      \ 400;\n    text-align: center;\n    vertical-align: middle;\n    cursor: pointer;\n\
      \    user-select: none;\n    padding: 10px;\n    margin: 5px;\n    font-size:\
      \ 1rem;\n    line-height: 1.5;\n    border-radius: 5px;\"\n    href=\"#\">\n\
      \    This is a button!\n</a></div>"
    row: 6
    col: 0
    width: 19
    height: 2
  - title: Number of Order Items by Category from different Traffic Sources
    name: Number of Order Items by Category from different Traffic Sources
    model: gen_ai
    explore: order_items
    type: looker_column
    fields: [order_items.count, products.category, users.traffic_source]
    pivots: [users.traffic_source]
    sorts: [users.traffic_source, order_items.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Count users by Traffic Source
    name: Count users by Traffic Source
    model: gen_ai
    explore: order_items
    type: looker_grid
    fields: [users.count, users.traffic_source]
    sorts: [users.count desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Number of Products by Category by Department
    name: Number of Products by Category by Department
    model: gen_ai
    explore: order_items
    type: looker_grid
    fields: [products.count, products.department, products.category]
    pivots: [products.department]
    sorts: [products.department, products.count desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Number of Customers per Country
    name: Number of Customers per Country
    model: gen_ai
    explore: order_items
    type: looker_grid
    fields: [users.country_flag, users.count]
    sorts: [users.count desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      users.country_flag: 84
    listen: {}
    row:
    col:
    width:
    height:
  - title: Number of Customers per Traffic Source per Country
    name: Number of Customers per Traffic Source per Country
    model: gen_ai
    explore: order_items
    type: looker_scatter
    fields: [users.country_flag, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    sorts: [users.traffic_source, users.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      users.country_flag: 84
    hidden_pivots: {}
    listen: {}
    row:
    col:
    width:
    height:
  - title: Customer Tenure
    name: Customer Tenure
    model: gen_ai
    explore: order_items
    type: looker_pie
    fields: [users.tenure_category, users.count]
    sorts: [users.count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Order Items Count per Product Category
    name: Order Items Count per Product Category
    model: gen_ai
    explore: order_items
    type: looker_bar
    fields: [order_items.count, products.category, users.gender]
    pivots: [users.gender]
    sorts: [users.gender, order_items.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
