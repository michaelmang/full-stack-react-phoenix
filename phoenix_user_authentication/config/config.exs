# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_user_authentication,
  ecto_repos: [PhoenixUserAuthentication.Repo]

# Configures the endpoint
config :phoenix_user_authentication, PhoenixUserAuthentication.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NVJoEzxDG2zLyqRuRqEBZxEP6wDxtFSaVElfNtKo56zoz66m+GG0BVSu5ZzzUaoT",
  render_errors: [view: PhoenixUserAuthentication.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixUserAuthentication.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :guardian, Guardian,
  issuer: "PhoenixUserAuthentication",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: PhoenixUserAuthentication.GuardianSerializer,
  secret_key: "syR5soTnDOp25yxyU4Y4rL/r0j4v/MNy/5l2gnjRcMwCx/UlWO88C28lWI0UrgJP"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
