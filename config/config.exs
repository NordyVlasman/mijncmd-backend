# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mijncmd,
  ecto_repos: [Mijncmd.Repo]

config :mijncmd, Mijncmd.Guardian,
  issuer: "mijncmd",
  verify_issuer: true,
  secret_key: "x8Hm9S7RQnZy/3CzmOTidj3J5BE45pJWMKvXlGrIloQapFB7LpWh42DcR8wsMZBU93Q=",
  ttl: {3, :days}


# Configures the endpoint
config :mijncmd, MijncmdWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wWNVNM19yWwqL2q2EAoavuYDgYP0Rh2RWq06clo5+fif/ckpk3TnKRepT62OAkNo",
  render_errors: [view: MijncmdWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Mijncmd.PubSub,
  live_view: [signing_salt: "HId9xzQv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mijncmd, :arc,
  storage_dir: "priv/uploads"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
