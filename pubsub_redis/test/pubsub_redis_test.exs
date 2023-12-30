defmodule PubsubRedisTest do
  use ExUnit.Case
  doctest PubsubRedis

  test "greets the world" do
    assert PubsubRedis.hello() == :world
  end
end
