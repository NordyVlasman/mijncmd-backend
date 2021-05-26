defmodule Mijncmd.PostCommentCreate do
  alias Mijncmd.{
    User,
    Repo,
    PostComment
  }
  import Ecto.Query, warn: false

  def create(%User{} = user, params) do
    params = Map.put(params, :author_id, user.id)

    %PostComment{}
    |> PostComment.create_changeset(params)
    |> Repo.insert()
  end
end
