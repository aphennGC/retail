view: users {
  sql_table_name: `lookercoredemoangiephenn.trial_dataset.users` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
   dimension: city {
    group_label: "Location Hierarchy"
    type: string
    sql: ${TABLE}.city ;;
    action: {
      label: "Email Customer Churn Promotion"
      url: "https://"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "🛍️ Last Chance! 50% off in {{ value }}"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "🌟 Special Offer Just for You! 🌟

        Dear Valued Customer,

        We've noticed you haven't been around in a while, and we're missing your presence! To show how much we value you, we've crafted an exclusive offer that's just too good to pass up.
        🔥 LIMITED TIME ONLY: Enjoy a special 20% discount on your next purchase! Use code: WELCOMEBACK20 at checkout.
        But wait, there's more! We're also giving you early access to our newest products and a complimentary premium service upgrade for the next month.
        We're committed to ensuring your experience with us is nothing short of exceptional. Your satisfaction is our top priority, and we're here to support you every step of the way.
        Don't miss out on this opportunity to rediscover what you've been missing. This special offer is valid for a limited time, so act fast!

        Warm regards,
        The 'The Look' Team

        P.S. We're always here to listen. If there's anything specific you're looking for or feedback you'd like to share, please don't hesitate to reach out. Your voice matters to us!
        🛍️ Rediscover the Magic at 'The Look' – Your Satisfaction, Our Promise! 🌈"
      }
    }
  }
  dimension: country {
    group_label: "Location Hierarchy"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

filter: country_filter {
  type: string
  suggest_dimension: country
}


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, day_of_week, week, week_of_year, month, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;

  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: postal_code {
    hidden: yes
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: state {
    group_label: "Location Hierarchy"
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: street_address {
    group_label: "Location Hierarchy"
    type: string
    sql: ${TABLE}.street_address ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

###CUSTOM DIMENSIONS###
  dimension: age_tier {
    type: tier
    tiers: [15,25,35,50,65]
    style: integer # the default value, could be excluded
    sql: ${age};;
  }

  dimension: full_name {
    label: "Customer Name"
    type:  string
    sql: CONCAT(${first_name},' ',${last_name}) ;;
  }

  dimension: full_name_filter {
    type:  string
    sql: ${full_name} ;;
    link: {
      label: "Drill into Specific Customer"
      url: "https://1a910b92-e236-4bcc-b1db-97bd51bba386.looker.app/dashboards/uznIl0mWHpGi6WufruhUdC?Customer+Name={{full_name_filter._value}}"
    }
  }

  dimension: country_flag{
    type: string
    sql:
    CASE
    WHEN ${country} = 'United States' THEN '🇺🇸' -- For Emoji
    WHEN ${country} = 'Canada' THEN '🇨🇦'
    WHEN ${country} = 'Germany' THEN '🇩🇪'
    WHEN ${country} = 'United Kingdom' THEN '🇬🇧'
    WHEN ${country} = 'Australia' THEN '🇦🇺'
    WHEN ${country} = 'Austria' THEN '🇦🇹'
    WHEN ${country} = 'Belgium' THEN '🇧🇪'
    WHEN ${country} = 'Brasil' THEN '🇧🇷'
    WHEN ${country} = 'China' THEN '🇨🇳'
    WHEN ${country} = 'Colombia' THEN '🇨🇴'
    WHEN ${country} = 'Spain' THEN '🇪🇸'
    WHEN ${country} = 'France' THEN '🇫🇷'
    WHEN ${country} = 'Japan' THEN '🇯🇵'
    WHEN ${country} = 'Poland' THEN '🇵🇱'
    WHEN ${country} = 'South Korea' THEN '🇰🇷'
    ELSE '🏳'
    END;;
  }

  dimension_group: tenure {
    label: "User group by tenure"
    type: duration
    intervals: [day]
    sql_start: ${created_date};; ##source: https://cloud.google.com/looker/docs/reference/param-field-dimension-group
    sql_end: CURRENT_DATE ;;
    description: "Calculates tenure of each customer"
  }

  dimension: tenure_category {
    label: "Tenure Category"
    type: string
    sql: case when ${days_tenure} > 90 then 'Establ. Customer' else 'New Customer' end ;; ##source: https://yaqs.corp.google.com/eng/q/5083940556208340992
    description: "Distinguishes between new customers and well established customers"
  }

##source: https://cloud.google.com/looker/docs/reference/param-dimension-filter-parameter-types#location
  dimension: location {
    label: "Customer Location"
    hidden: yes
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

dimension: zip {
  group_label: "Location Hierarchy"
  label: "ZIP"
  description: "User Address Postcode"
  type: zipcode
  sql: ${postal_code};;
  drill_fields: [city]
  }

  dimension: approx_latitude {
    hidden: yes
    label: "Approx Latitude"
    type: number
    sql: round(${TABLE}.latitude,1) ;;
  }

  dimension: approx_longitude {
    hidden:  yes
    label: "Approx Longitude"
    type: number
    sql:round(${TABLE}.longitude,1) ;;
  }


  dimension: approx_location {
    group_label: "Location Hierarchy"
    label: "Approx Customer Location"
    type: location
    drill_fields: [location]
    sql_latitude: ${approx_latitude} ;;
    sql_longitude: ${approx_longitude} ;;
    link: {
      label: "Google Directions from {{ distribution_centers.name._value }}"
      url: "{% if distribution_centers.location._in_query %}https://www.google.com/maps/dir/'{{ distribution_centers.latitude._value }},{{ distribution_centers.longitude._value }}'/'{{ approx_latitude._value }},{{ approx_longitude._value }}'{% endif %}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.google.com"
    }
    }

###CUSTOM MEASURES###
  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  last_name,
  first_name,
  orders.count,
  events.count,
  order_items.count
  ]
  }
}
