defmodule Mijncmd.PostCreate do
  alias Mijncmd.{User, Repo, Post}

  def create(%User{} = user, params) do
    params = Map.put(params, :author_id, user.id)

    %Post{}
    |> Post.create_changeset(params)
    |> Repo.insert()
  end
end
