import Config

config :kafka_ex,
  brokers: System.get_env("BROKERS", "localhost:19092"),
  kafka_version: "kayrock",
  consumer_group: System.get_env("CONSUMER_GROUP", "default_consumer_group"),
  topics: String.split(System.get_env("TOPIC_NAMES", "test"), ","),
  consumer_group_opts: [
    heartbeat_interval: 1_000,
    commit_interval: 1_000,
    api_versions: %{fetch: 3, offset_fetch: 3, offset_commit: 3}
  ]
