defmodule KafkaConsumer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def parse_kafka_brokers(brokers_string) do
    brokers_string
    # Split by comma to get the individual "host:port" pairs
    |> String.split(",")
    |> Enum.map(fn broker ->
      # Split by colon to separate host and port
      [host, port_string] = String.split(broker, ":")
      # Convert to a tuple with an integer port
      {host, String.to_integer(port_string)}
    end)
    |> IO.inspect(label: "brokers")
  end

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec
    # Retrieve configuration for KafkaEx
    brokers = parse_kafka_brokers(Application.get_env(:kafka_ex, :brokers))
    consumer_group_name = Application.get_env(:kafka_ex, :consumer_group)
    topic_names = Application.get_env(:kafka_ex, :topics)
    consumer_group_opts = Application.get_env(:kafka_ex, :consumer_group_opts)

    IO.puts("brokers: #{inspect(brokers)}")
    IO.puts("consumer_group_name: #{inspect(consumer_group_name)}")
    IO.puts("topic_names: #{inspect(topic_names)}")
    IO.puts("consumer_group_opts: #{inspect(consumer_group_opts)}")

    children = [
      supervisor(
        KafkaEx.ConsumerGroup,
        [KafkaConsumer.Consumer, consumer_group_name, topic_names, consumer_group_opts]
      )
      # Starts a worker by calling: KafkaConsumer.Worker.start_link(arg)
      # {KafkaConsumer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KafkaConsumer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
