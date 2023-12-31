defmodule KafkaConsumer.MixProject do
  use Mix.Project

  def project do
    [
      app: :kafka_consumer,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {KafkaConsumer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # add to your existing deps
      {:kafka_ex, "~> 0.13.0"},
      # # If using snappy-erlang-nif (snappy) compression
      # {:snappy, git: "https://github.com/fdmanana/snappy-erlang-nif"},
      # if using snappyer (snappy) compression
      {:snappyer, "~> 1.2"}
    ]
  end
end
