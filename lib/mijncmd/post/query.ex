defmodule Mijncmd.Posts.Query do
  @moduledoc """
  Functions for building post queries.
  """
  import Ecto.Query

  alias Mijncmd.{
    Post,
    Accounts.User
  }

  def base_query(%User{id: user_id} = _user) do
    query =
      from p in Post,
        join: u in User,
        on: u.user_id == ^user_id

    build_base_query_with_user(query)
  end

  defp build_base_query_with_user(query) do
    from [p, u] in query,
      left_join: pu in assoc(p, :author),
      on: pu.author_id == u.id
  end
end
