defmodule Mijncmd.UserSkill do
  use Mijncmd.Schema

  alias Mijncmd.{
    Accounts.User,
    Skill
  }

  schema "user_skills" do
    field :delete, :boolean, virtual: true

    belongs_to :user, User
    belongs_to :skill, Skill

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(user_id skill_id)a)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:skill_id)
    |> mark_for_deletion()
  end
end
