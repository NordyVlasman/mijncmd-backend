defmodule MijncmdWeb.Resolvers.Posts do
  alias Mijncmd.{
    Post,
    Repo
  }

  import Ecto
  import Ecto.Query, warn: false

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    if user do
      user
      |> build_assoc(:posts)
      |> Post.insert_changeset(args)
      |> Repo.insert()
      # changeset = Post.insert_changeset(%Post{}, args)
      # case Repo.insert(changeset) do
      #   {:ok, post} ->
      #     {:ok, post}
      #   {:error, changeset} ->
      #     {:error, changeset}
      # end
    end
  end
end
