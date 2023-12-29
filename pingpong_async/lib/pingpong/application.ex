defmodule Pingpong.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Pingpong.{Ping, Pong}

  @impl true
  def start(_type, _args) do
    children = [
      Pong,
      {Ping, Pong}
      # Starts a worker by calling: Pingpong.Worker.start_link(arg)
      # {Pingpong.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pingpong.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
