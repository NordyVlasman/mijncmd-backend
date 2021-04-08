defmodule Mijncmd.Repo do
  use Ecto.Repo,
    otp_app: :mijncmd,
    adapter: Ecto.Adapters.Postgres
end
