import Config

config :kafka_ex,
  # List of Kafka brokers as host:port strings
  brokers: [
    {"localhost", 19092}
  ],
  # required for for kraft
  kafka_version: "kayrock",
  consumer_group: "test_consumer_group",
  topics: ["test"],
  consumer_group_opts: [
    heartbeat_interval: 1_000,
    commit_interval: 1_000,
    api_versions: %{fetch: 3, offset_fetch: 3, offset_commit: 3}
  ]
