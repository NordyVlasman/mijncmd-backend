use Mix.Config

config :mijncmd, Mijncmd.Repo,
 ssl: true,
 url: database_url,
 pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
