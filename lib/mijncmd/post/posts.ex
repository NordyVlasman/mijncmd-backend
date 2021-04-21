defmodule Mijncmd.Posts do
  @moduledoc """
  The posts context.
  """

  import Ecto.Query, warn: false

  alias Mijncmd.{
    Posts,
    Posts.CreatePost,
    Posts.Query
  }

  def post_base_query(user) do
    Posts.Query.base_query(user)
  end
end
