defmodule PubsubRedis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Starting PubsubRedis")
    IO.puts("REDIS_URL: #{System.get_env("REDIS_URL")}")
    IO.puts("NODE_NAME: #{System.get_env("NODE_NAME")}")
    children = [
      {Phoenix.PubSub,
       adapter: Phoenix.PubSub.Redis,
       host: System.get_env("REDIS_URL"),
       node_name: System.get_env("NODE_NAME"),
       name: PubsubRedis.PubSub}
      # Starts a worker by calling: PubsubRedis.Worker.start_link(arg)
      # {PubsubRedis.Worker, arg}
    ]
    # children = [
    #   {Phoenix.PubSub,
    #    adapter: Phoenix.PubSub.Redis,
    #    host: "localhost",
    #    node_name: "test",
    #    name: PubsubRedis.PubSub}
    #   # Starts a worker by calling: PubsubRedis.Worker.start_link(arg)
    #   # {PubsubRedis.Worker, arg}
    # ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PubsubRedis.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
