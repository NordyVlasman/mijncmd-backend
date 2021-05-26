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

  def get_posts(_, _, _) do
    posts =
      Post
      |> Repo.all()
    {:ok, posts}
  end

  def get_post(_, params, _) do
    case Repo.get_by(Post, slug: params.slug) do
      %Post{} = post ->
        {:ok, post}
    end
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
