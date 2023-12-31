defmodule KafkaConsumerTest do
  use ExUnit.Case
  doctest KafkaConsumer

  test "greets the world" do
    assert KafkaConsumer.hello() == :world
  end
end
