# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :sitex, SitexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EDE0UInuze19pN+pwiW3YRMr++mHXi3DuPmOCUWg1RZpYoyL0VLCmzyyGVldqBjH",
  render_errors: [view: SitexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sitex.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "T2rGxA00"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :sitex, :generator,
  out: Path.relative_to_cwd("site")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
