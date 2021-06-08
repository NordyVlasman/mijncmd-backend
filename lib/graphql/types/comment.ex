defmodule Mijncmd.GraphQL.Types.Comment do
  use Absinthe.Schema.Notation
  import Ecto.Query, warn: false

  alias Mijncmd.{
    Repo
  }

  object :comment do
    field(:id, :id)
    field(:content, :string)

    field(:upvote_count, :integer)

    field(:inserted_at, :datetime)

    field :has_upvoted, :boolean do
      resolve(fn comment, _, info ->
        user = info.context[:conn].assigns[:current_user]
        exists_query = from(u in Mijncmd.CommentUpvote, where: u.comment_id == ^comment.id, where: u.user_id == ^user.id)
        exists = Repo.aggregate(exists_query, :count)
        case exists do
          0 -> {:ok, false}
          1 -> {:ok, true}
        end
      end)
    end

    field :author, :user do
      resolve(fn comment, _, _ ->
        comment = Mijncmd.PostComment.with_author(comment)
        {:ok, comment.author}
      end)
    end

    field :children, list_of(:comment) do
      resolve(fn comment, _, _ ->
        children = Mijncmd.PostComment.preload_children(comment)
        {:ok, children}
      end)
    end
  end
end
