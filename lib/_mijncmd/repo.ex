# defmodule Mijncmd.Repo do
#   use Ecto.Repo,
#     otp_app: :mijncmd,
#     adapter: Ecto.Adapters.Postgres

#   require Ecto.Query

#   use Scrivener, page_size: 20

#   def count(query) do
#     one(Ecto.Query.from(r in query, select: count(r.id)))
#   end
# end
