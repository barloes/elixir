defmodule Pingpong.Ping do
  use GenServer
  # Client
  def start_link(pong_pid) do
    GenServer.start_link(__MODULE__, pong_pid, name: __MODULE__)
  end

  # Server
  def init(pong_pid) do
    # calling Pong

    Process.send_after(self(), {:ping, pong_pid}, 2000)
    {:ok, []}
  end

  def handle_info({:ping, pong_pid}, state) do
    {:pong, pong_state} = Pingpong.Pong.ping(pong_pid)
    IO.puts("Ping received #{pong_state}")
    Process.send_after(self(), {:ping, pong_pid}, 2000)

    {:noreply, state}
  end
end
