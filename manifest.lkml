project_name: "corelight-chronicle"

constant: CONNECTION_NAME{
  value: "chronicle"
  export: override_required
}

constant: DATASET_NAME{
  value: "datalake"
}

constant: CHRONICLE_URL{
  value: "https://{your_tenant}.backstory.chronicle.security"
  export: override_required
}

constant: EVENTS {
  value: "@{DATASET_NAME}.events"
}
constant: ENTITY_GRAPH {
  value: "@{DATASET_NAME}.entity_graph"
}
