FROM elixir:1.16.0

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set up the working directory
WORKDIR /workspace