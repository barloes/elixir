defmodule KafkaConsumer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec
    # Retrieve configuration for KafkaEx
    brokers = Application.get_env(:kafka_ex, :brokers)
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
