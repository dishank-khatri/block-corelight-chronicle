- dashboard: security_posture
  title: Security Posture
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: CLGvZ96npTG69GVRR0369F
  elements:
  - title: Self Signed Certs
    name: Self Signed Certs
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_network_tls_client_server_name_2]
    filters:
      events__security_result__detection_fields_validation_status.value: self signed
        certificate
      events.metadata__product_event_type: ssl
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.network__tls__client__server_name
      expression: ''
      label: Count of Network Tls Client Server Name
      measure: count_of_network_tls_client_server_name_2
      type: count_distinct
    filter_expression: "${events__about__labels__uid__only.value} = ${conn_events_search_derived.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 2
    col: 0
    width: 8
    height: 3
  - title: Certs w/ Low Keys
    name: Certs w/ Low Keys
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_fingerprint_value]
    filters:
      events.metadata__product_event_type: x509
      events__about__labels_certificate_key_length.value_in_integer: "<2048"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Fingerprint Value
      based_on: events__about__labels_fingerprint.value
      _kind_hint: measure
      measure: count_of_fingerprint_value
      type: count_distinct
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 2
    col: 8
    width: 8
    height: 3
  - title: Expiring Certs
    name: Expiring Certs
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_fingerprint_value]
    filters:
      events.metadata__product_event_type: x509
      events.cert_day_to_expire: "[1,15]"
    sorts: [count_of_value desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Fingerprint Value
      based_on: events__about__labels_fingerprint.value
      _kind_hint: measure
      measure: count_of_fingerprint_value
      type: count_distinct
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 2
    col: 16
    width: 8
    height: 3
  - title: Encrypted Traffic Over Time
    name: Encrypted Traffic Over Time
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_hour, encrypted_traffic_volume]
    fill_fields: [events.event_timestamp_hour]
    filters:
      events.metadata__product_event_type: ssl
    sorts: [encrypted_traffic_volume desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Encrypted Traffic Volume
      based_on: events.metadata__id
      _kind_hint: measure
      measure: encrypted_traffic_volume
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      expression: coalesce(${encrypted_traffic_volume}, 0)
      label: Encrypted Traffic Volume
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: encrypted_traffic_volume_1
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: encrypted_traffic_volume_1,
            id: encrypted_traffic_volume_1, name: Encrypted Traffic Volume}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Hours
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [encrypted_traffic_volume]
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 11
    col: 0
    width: 24
    height: 7
  - title: TLS Versions
    name: TLS Versions
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [count, events.version_status]
    filters:
      events.metadata__product_event_type: ssl
    sorts: [count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    value_labels: labels
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
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 5
    col: 0
    width: 12
    height: 6
  - title: Internal vs External Certificates Use
    name: Internal vs External Certificates Use
    model: corelight-chronicle
    explore: events
    type: looker_column
    fields: [count, events.version_status]
    filters:
      events.metadata__product_event_type: ssl
    sorts: [count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
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
    value_labels: legend
    label_type: labPer
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 5
    col: 12
    width: 12
    height: 6
  - title: Unencrypted Connections
    name: Unencrypted Connections
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.distinct_count]
    filters:
      events.metadata__product_event_type: '"etc_viz"'
      events__about__labels_viz_stats.value: C,Cc
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 20
    col: 0
    width: 8
    height: 3
  - title: Telnet Sessions
    name: Telnet Sessions
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.talnet_session_count]
    filters:
      events.metadata__product_event_type: conn
      events.target__port: '23'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
    row: 20
    col: 8
    width: 8
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal; text-align:center;">Encrypted
      Traffic Hygiene</h4>

      '
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal; text-align:center;">Unencrypted
      Traffic Hygiene - Indicators</h4>

      '
    row: 18
    col: 0
    width: 24
    height: 2
  filters:
  - name: Global Time Restriction
    title: Global Time Restriction
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.event_timestamp_time
  - name: Sensor
    title: Sensor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.observer__hostname
