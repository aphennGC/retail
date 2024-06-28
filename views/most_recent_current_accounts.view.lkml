####This table calculates the most recent from_date for each account where the to_date is null.
view: most_recent_current_accounts {
  derived_table: {
    sql:
      SELECT
        product_id,
        MAX(created_at) AS most_recent_created_date
      FROM
        `lookercoredemoangiephenn.trial_dataset.order_items`
      WHERE
        delivered_at IS NULL
      GROUP BY
        product_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: most_recent_created_date {
    type: date
    sql: ${TABLE}.most_recent_created_date ;;
  }
}
