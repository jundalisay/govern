import Config

config :govern, GovernWeb.Endpoint,
  url: [host: "govern.herokuapp.com", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info
