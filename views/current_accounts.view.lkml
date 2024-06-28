view: current_accounts {
  derived_table: {
    sql:
      SELECT
        account,
        MAX(from_date) AS most_recent_from_date
      FROM
        `lookercoredemoangiephenn.trial_dataset.order_items`
      WHERE
        to_date IS NULL
      GROUP BY
        account ;;
  }

  dimension: account {
    type: number
    sql: ${TABLE}.account ;;
  }

  dimension: most_recent_from_date {
    type: date
    sql: ${TABLE}.most_recent_from_date ;;
  }
}
