defmodule Mijncmd.UserSkill do
  use Mijncmd.Schema

  alias Mijncmd.{
    User,
    Skill
  }

  schema "user_skills" do
    field(:position, :integer)
    field(:delete, :boolean, virtual: true)

    belongs_to(:user, User)
    belongs_to(:skill, Skill)

    timestamps()
  end

  @required_fields ~w(skill_id user_id)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:skill_id)
  end
end
