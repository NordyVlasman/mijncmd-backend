defmodule Mijncmd.PostComment do
  use Mijncmd.Schema

  alias Mijncmd.{
    Repo
  }

  schema "post_comments" do
    field(:content, :string)

    belongs_to(:author, Mijncmd.User, foreign_key: :author_id)
    belongs_to(:post, Mijncmd.Post, foreign_key: :post_id)

    belongs_to(:parent, Mijncmd.PostComment, foreign_key: :parent_id)
    has_many :children, Mijncmd.PostComment, foreign_key: :parent_id

    field :edited_at, :utc_datetime
    field :deleted_at, :utc_datetime

    timestamps()
  end

  @required_fields ~w(author_id post_id content)a
  @optional_fields ~w(parent_id)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> general_changeset
  end

  defp general_changeset(content) do
    content
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:author_id)
    |> foreign_key_constraint(:parent_id)
  end

  def with_author(%Mijncmd.PostComment{} = comment), do: Repo.preload(comment, :author)
  def with_author(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :author)

  def preload_children(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :children)
  def preload_children(%Mijncmd.PostComment{} = comment), do: Repo.preload(comment, :children)

  def preload_parent(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :parent)
  def preload_parent(%Mijncmd.PostComment{} = comment), do: Repo.preload(comment, :parent)

  def preload_all(query_or_comment) do
    query_or_comment
    |> with_author()
    |> preload_parent()
    |> preload_children()
  end

  def nested(nil), do: []
  def nested([]), do: []

  def nested(comments) do
    comments
    |> Enum.map(&Map.put(&1, :children, []))
    |> Enum.reduce(%{}, fn comment, map ->
      comment = %{comment | children: Map.get(map, comment.id, [])}
      Map.update(map, comment.parent_id, [comment], fn comments -> [comment | comments] end)
    end)
    |> Map.get(nil)
  end
end
