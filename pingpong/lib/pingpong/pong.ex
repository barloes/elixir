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
    {:ok, []}
  end

  def handle_call(:ping, _from, state) do
    # after one second call pong
    Process.sleep(1000)
    IO.puts("Pong calling Ping")
    {:reply, :pong, state}
  end
end
