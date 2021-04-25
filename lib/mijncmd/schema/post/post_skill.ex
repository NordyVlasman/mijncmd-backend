defmodule Mijncmd.PostSkill do
  use Mijncmd.Schema

  alias Mijncmd.{
    Post,
    Skill
  }

  schema "post_skills" do
    field :delete, :boolean, virtual: true

    belongs_to :post, Post
    belongs_to :skill, Skill

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(post_id skill_id)a)
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:skill_id)
    |> mark_for_deletion()
  end
end
