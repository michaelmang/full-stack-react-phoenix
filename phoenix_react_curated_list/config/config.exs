# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_react_curated_list,
  ecto_repos: [PhoenixReactCuratedList.Repo]

# Configures the endpoint
config :phoenix_react_curated_list, PhoenixReactCuratedList.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IeJTNEd9iIgy+utXNg/qMxDQfCn4gXIw7WCtqP162e7hOp6WJ7dXl8JBgYeVtQMz",
  render_errors: [view: PhoenixReactCuratedList.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixReactCuratedList.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
