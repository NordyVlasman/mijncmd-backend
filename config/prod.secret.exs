use Mix.Config

config :mijncmd, Mijncmd.Repo,
 ssl: true,
 url: System.get_env("DATABASE_URL"),
 pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
