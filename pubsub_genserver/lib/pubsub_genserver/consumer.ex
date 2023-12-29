defmodule PubsubGenserver.Consumer do
  use GenServer
  @topic "test"

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, name: __MODULE__)
  end

  # Server Api
  def init(_opts) do
    Phoenix.PubSub.subscribe(PubsubGenserver.PubSub, @topic)
    {:ok, %{}}
  end

  def handle_info({:pubsub, _from, _topic, payload}, state) do
    IO.inspect(payload)
    {:noreply, state}
  end

  def handle_info(message, state) do
    IO.inspect(message, label: "Unexpected message")
    {:noreply, state}
  end
end
