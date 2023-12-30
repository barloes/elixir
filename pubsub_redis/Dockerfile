# Use an official Elixir runtime as a parent image
FROM elixir:1.16.0-alpine

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# Install Phoenix dependencies
RUN mix deps.get
RUN mix deps.compile

# Compile the project
RUN mix do compile

CMD ["mix", "run", "--no-halt"]