defmodule Mijncmd.GraphQL.Resolvers.Post do
  require Ecto.Query

  alias Mijncmd.{
    PostCreate,
    Post,
    Repo
  }

  def create_post(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case PostCreate.create(user, params) do
      {:ok, post} ->
        {:ok, %{post: post, errors: nil}}
      {:error, _reason} ->
        {:ok, %{post: nil, errors: ["Failed"]}}
    end
  end

  def get_posts(_, _, info) do
    user = info.context[:conn].assigns[:current_user]
    posts =
      Post
      |> Repo.all()
      |> Post.preload_author()
    {:ok, posts}
  end

  def like_post(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case PostCreate.like(user, params) do
      {:ok, post} ->
        {:ok, %{post: post, errors: nil}}
    end
  end

  def dislike_post(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case PostCreate.dislike(user, params) do
      {:ok, post} ->
        {:ok, %{post: post, errors: nil}}
    end
  end
end
