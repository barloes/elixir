defmodule PubsubGenserver.Producer do
  use GenServer

  @topic "test"
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, name: __MODULE__)
  end

  # Server Api
  def init(_opts) do

    Process.send_after(self(), :publish, 1000)
    {:ok, %{}}
  end

  def handle_info(:publish, state) do
    Phoenix.PubSub.broadcast(PubsubGenserver.PubSub, @topic, "Hello from producer")
    Process.send_after(self(), :publish, 1000)
    {:noreply, state}
  end

end
