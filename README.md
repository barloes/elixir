# elixir

mix new my_app --sup
mix deps.get
mix deps.compile
iex -S mix

# dev container

- set up elixir version 1.16
- start development in vscode with `ctrl+shift+p -> Dev Container: Open Folder in Container`

# pub sub command

Phoenix.PubSub.broadcast(PubsubGenserver.PubSub, "test", "my_message")
Phoenix.PubSub.subscribe(PubsubGenserver.PubSub, "test")

# reference

- https://papercups.io/blog/genserver
