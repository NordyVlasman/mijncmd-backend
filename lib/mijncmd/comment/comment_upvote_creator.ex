defmodule Mijncmd.CommentUpvoteCreate do
  alias Mijncmd.{
    User,
    Repo,
    PostComment,
    CommentUpvote
  }
  import Ecto.Query, warn: false

  def upvote(%User{} = user, params) do
    exists_query = from(u in CommentUpvote, where: u.comment_id == ^params.comment_id, where: u.user_id == ^user.id)
    exists = Repo.aggregate(exists_query, :count)

    comment = Repo.get(PostComment, params.comment_id)

    case exists do
      0 ->
        count_query = from(u in CommentUpvote, where: u.comment_id == ^params.comment_id)
        cur_count = Repo.aggregate(count_query, :count)

        new_count = Enum.max([0, cur_count])
        map = Map.put(%{}, :upvote_count, new_count + 1)
        params = Map.put(params, :user_id, user.id)

        comment
        |> PostComment.update_changeset(map)
        |> Repo.update()

        %CommentUpvote{}
        |> CommentUpvote.create_changeset(params)
        |> Repo.insert()

        comment = Repo.get(PostComment, params.comment_id)
        {:ok, comment}
      1 ->
        {:ok, comment}
    end
  end
end
