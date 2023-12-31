# elixir

mix new my_app --sup
mix deps.get
mix deps.compile
iex -S mix

# permission issue

```
sudo chown -R $(whoami):$(whoami) *
sudo chmod -R u+rw *
```

# setting up kafka

- https://github.com/barloes/learning-kafka

````
kafka-console-producer --topic test --bootstrap-server localhost:29092

iex --sname consumer_1 -S mix
iex --sname consumer_2 -S mix

```



<!-- # umbrella app
mix new distributed_pubsub --umbrella
mix new apps/consumer --module Consumer --sup
mix new apps/publisher --module Publisher --sup

iex --sname producer --cookie mysecretcookie -S mix
iex --sname consumer --cookie mysecretcookie -S mix -->

# dev container

- set up elixir version 1.16
- start development in vscode with `ctrl+shift+p -> Dev Container: Open Folder in Container`

# pub sub command

Phoenix.PubSub.broadcast(PubsubGenserver.PubSub, "test", "my_message")
Phoenix.PubSub.subscribe(PubsubGenserver.PubSub, "test")

# reference

- https://papercups.io/blog/genserver
````
