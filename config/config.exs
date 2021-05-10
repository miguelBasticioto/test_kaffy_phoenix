# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

#config :torch,
#       otp_app: :test_admin,
#       template_format: "eex" || "slime"

config :kaffy,
       otp_app: :test_admin,
       ecto_repo: TestAdmin.Repo,
       router: TestAdminWeb.Router

config :test_admin,
  ecto_repos: [TestAdmin.Repo]

# Configures the endpoint
config :test_admin, TestAdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HiWgc4dzvfbwwulINB32OnhIrG1DYw2HDeBLhzyjwvx5OGcAxhi2Ng8sFSxaM/8E",
  render_errors: [view: TestAdminWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestAdmin.PubSub,
  live_view: [signing_salt: "FKQzUwKp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
