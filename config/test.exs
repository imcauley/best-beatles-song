import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :song_rank, SongRank.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "song_rank_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :song_rank, SongRankWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "fh67FHKcAt9q3otFkl72fQS+9eR8WG35Dg4ecoP+PARi66qd8UnJIoV9l5T+NA0q",
  server: false

# In test we don't send emails.
config :song_rank, SongRank.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
