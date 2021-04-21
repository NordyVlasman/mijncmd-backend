defmodule MijncmdWeb.Resolvers.Posts do
  alias Mijncmd.{
    Post,
    Repo,
    Accounts.User
  }

  import Absinthe.Resolution.Helpers
  import Ecto.Query, warn: false
  import Ecto

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    if user do
      user
      |> build_assoc(:posts)
      |> Post.insert_changeset(args)
      |> Repo.insert()
    end
  end

  def create_post(%Post{} = post, _, %{context: %{loader: loader}}) do
    loader
    |> Dataloader.load(:db, User, post.author_id)
    |> on_load(fn loader ->
      actor =
        loader
        |> Dataloader.get(:db, User, post.author_id)

      author = actor

      {:ok, author}
    end)
  end
end
