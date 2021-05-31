defmodule Mijncmd.CommentUpvote do
  use Mijncmd.Schema

  @primary_key false
  schema "comment_upvotes" do
    belongs_to(:user, Mijncmd.User, foreign_key: :user_id)
    belongs_to(:comment, Mijncmd.PostComment, foreign_key: :comment_id)
  end

  @required_fields ~w(user_id comment_id)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
