defmodule Mijncmd.PostLike do
  use Mijncmd.Schema

  @primary_key false
  schema "post_likes" do
    belongs_to(:user, Mijncmd.User, foreign_key: :user_id)
    belongs_to(:post, Mijncmd.Post, foreign_key: :post_id)
  end

  @required_fields ~w(user_id post_id)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
