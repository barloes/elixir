defmodule PubsubGenserverTest do
  use ExUnit.Case
  doctest PubsubGenserver

  test "greets the world" do
    assert PubsubGenserver.hello() == :world
  end
end
