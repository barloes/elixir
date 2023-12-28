defmodule Pingpong.Pong do
  use GenServer
  # Client
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def ping(pid) do
    GenServer.call(pid, :ping)
  end

  # Server
  def init(:ok) do
    {:ok, 0}
  end

  def handle_call(:ping, _from, state) do
    # after one second call pong
    IO.puts("Pong replying Ping")
    new_state = state + 1
    {:reply, {:pong, new_state}, new_state}
  end
end
