defmodule Mijncmd.Image do
  use Mijncmd.Schema
  use Arc.Ecto.Schema

  schema "create_pictures" do
    field(:name, :string)
    field(:image, Mijncmd.Files.Image.Type)

    timestamps()
  end

  @required_fields ~w(name image)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> cast_attachments(params, [:image])
    |> validate_required(@required_fields)
  end
end
