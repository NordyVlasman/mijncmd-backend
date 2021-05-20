defmodule Mijncmd.Skill do
  use Mijncmd.Schema

  alias Mijncmd.{
    PostSkill,
    Helpers.Regexp
  }

  schema "skills" do
    field(:name, :string)
    field(:slug, :string)
    field(:description, :string)

    has_many(:post_skills, PostSkill, on_delete: :delete_all)
    has_many(:posts, through: [:post_skills, :post])

    has_many(:user_skills, UserSkill, on_delete: :delete_all)
    has_many(:users, through: [:user_skills, :user])

    timestamps()
  end

  @required_fields ~w(name slug)a
  @optional_fields ~w(description)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required([:name, :slug])
    |> validate_format(:slug, Regexp.slug(), message: Regexp.slug_message())
    |> unique_constraint(:slug)
  end
end
