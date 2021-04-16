defmodule Mijncmd.Repo do
  use Ecto.Repo,
    otp_app: :mijncmd,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 20
end
