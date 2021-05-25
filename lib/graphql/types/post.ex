defmodule Mijncmd.GraphQL.Types.Post do
  use Absinthe.Schema.Notation
  import Ecto.Query, warn: false

  alias Mijncmd.{
    Post,
    Repo
  }

  object :post do
    field(:id, non_null(:id))
    field(:title, non_null(:string))
    field(:slug, non_null(:string))

    field(:description, :string)
    field(:body, :string)

    field(:likes_count, :integer)

    field :cover_url, :string do
      resolve(fn post, _, _ ->
        {:ok, Post.with_cover(post)}
      end)
    end

    field :author, non_null(:user) do
      resolve(fn post, _, _ ->
        post = post
        |> Post.preload_author()
        {:ok, post.author}
      end)

    end

    field :comments, list_of(:comment) do
      resolve(fn post, _, _ ->
        post = post
        |> Post.preload_comments()
        comments = Mijncmd.PostComment.nested(post.comments)
        {:ok, comments}
      end)
    end

    field :has_liked, :boolean do
      resolve(fn post, _, info ->
        user = info.context[:conn].assigns[:current_user]
        exists_query = from(u in Mijncmd.PostLike, where: u.post_id == ^post.id, where: u.user_id == ^user.id)
        exists = Repo.aggregate(exists_query, :count)
        case exists do
          0 -> {:ok, false}
          1 -> {:ok, true}
        end
      end)
    end
  end
end
