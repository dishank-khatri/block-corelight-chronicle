include: "/views/directions.view"
explore: directions {
  join: connections_orig {
    type: left_outer
    sql_on: ${directions.principal_ip_directions} = ${connections_orig.principal_ip_conn} ;;
    relationship: one_to_one
  }
  join: connections_resp {
    type: left_outer
    sql_on: ${directions.target_ip_directions} = ${connections_resp.target_ip_conn} ;;
    relationship: one_to_one
  }
}