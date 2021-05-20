defmodule Mijncmd.Loaders.Database do
  @moduledoc false

  import Ecto.Query, warn: false

  alias Mijncmd.{
    Repo,
    Post,
    Posts
  }

  def source(%{current_user: _user} = params) do
    Dataloader.Ecto.new(Repo, query: &query/2, default_params: params)
  end

  def source(_), do: raise("authentication required")

  # Posts
  def query(Post, %{current_user: user}), do: Posts.post_base_query(user)

end
