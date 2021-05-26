defmodule Mijncmd.PostSkill do
  use Mijncmd.Schema

  alias Mijncmd.{
    Post,
    Skill
  }

  schema "post_skills" do
    field(:position, :integer)
    field(:delete, :boolean, virtual: true)

    belongs_to(:post, Post)
    belongs_to(:skill, Skill)

    timestamps()
  end

  @required_fields ~w(skill_id post_id)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:skill_id)
    |> cast_assoc(:skill)
  end
end
