defmodule Mijncmd.Imagers do
  use Mijncmd.Schemas
  use Arc.Ecto.Schema
  import Ecto.Changeset

  alias Mijncmd.{
    Uploaders.Image,
    Repo
  }

  schema "create_pictures" do
    field(:name, :string)
    field(:image, Image.Type)

    timestamps()
  end

  @required_fields ~w(name image)a
  def creation_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> cast_attachments(params, [:image])
    |> validate_required(@required_fields)
  end

  def file_changeset(model, attrs \\ %{}),
    do: cast_attachments(model, attrs, [:image], allow_urls: true)
end
