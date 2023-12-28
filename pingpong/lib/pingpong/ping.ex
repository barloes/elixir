defmodule Pingpong.Ping do
  use GenServer
  # Client
  def start_link(pong_pid) do
    GenServer.start_link(__MODULE__, pong_pid, name: __MODULE__)
  end

  # Server
  def init(pong_pid) do
    # call ping
    Pingpong.Pong.ping(pong_pid)
    {:ok, []}
  end
end
