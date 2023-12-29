defmodule PubsubGenserver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, adapter: Phoenix.PubSub.PG2, name: PubsubGenserver.PubSub},
      {PubsubGenserver.Consumer, name: PubsubGenserver.Consumer},
      {PubsubGenserver.Producer, name: PubsubGenserver.Producer}
      # Starts a worker by calling: PubsubGenserver.Worker.start_link(arg)
      # {PubsubGenserver.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PubsubGenserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
