# elixir

mix new my_app --sup
mix deps.get
mix deps.compile
iex -S mix

# pub sub

Phoenix.PubSub.broadcast(PubsubGenserver.PubSub, "test", "my_message")
Phoenix.PubSub.subscribe(PubsubGenserver.PubSub, "test")

# reference

- https://papercups.io/blog/genserver
