# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :web_server,
  ecto_repos: [WebServer.Repo]

# Configures the endpoint
config :web_server, WebServerWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: WebServerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WebServer.PubSub,
  live_view: [signing_salt: "S5zgzPz6"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :web_server, WebServer.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ex_firebase,
  project_id: "auycro-flix",
  service_account_path: "auycro-flix.json.local",
  queue_interval: 1000, # frequency in ms queued messages are sent
  queue_batch_size: 10 # number of messages sent per queue_interval

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
