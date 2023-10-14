import Config

postgres_user =
  System.get_env("POSTGRES_USER") ||
  raise """
  environment variable POSTGRES_USER is missing.
  For example: postgres
  """

postgres_password =
  System.get_env("POSTGRES_PASSWORD") ||
  raise """
  environment variable POSTGRES_PASSWORD is missing.
  For example: postgres
  """

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :l5r_keeper, L5rKeeper.Repo,
  username: postgres_user,
  password: postgres_password,
  hostname: "localhost",
  database: "l5r_keeper_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :l5r_keeper, L5rKeeperWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tHpJ1Y0b2UESmqhloLAp4encV9Gn12s0IO5akWafCqMRqleMG6OfdpOT3Z5CN9zT",
  server: false

# In test we don't send emails.
config :l5r_keeper, L5rKeeper.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
