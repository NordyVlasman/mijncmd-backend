defmodule Mijncmd.GraphQL.Resolvers.PostComment do
  require Ecto.Query

  alias Mijncmd.{
    PostCommentCreate,
    CommentUpvoteCreate,
  }

  def create_post_comment(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case PostCommentCreate.create(user, params) do
      {:ok, comment} ->
        {:ok, %{comment: comment, erros: nil}}
      {:error, _reason} ->
        {:ok, %{comment: nil, errors: ["Failed"]}}
    end
  end

  def upvote_comment(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case CommentUpvoteCreate.upvote(user, params) do
      {:ok, comment} ->
        {:ok, %{comment: comment, errors: nil}}
    end
  end
end
