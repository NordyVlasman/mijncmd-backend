defmodule Mijncmd.Skill do
  use Mijncmd.Schema

  alias Mijncmd.{
    PostSkill,
    UserSkill
  }

  schema "skills" do
    field :name, :string
    field :slug, :string
    field :description, :string

    has_many :post_skills, PostSkill, on_delete: :delete_all
    has_many :posts, through: [:post_skills, :post]

    has_many :user_skills, UserSkill, on_delete: :delete_all
    has_many :users, through: [:user_skills, :user]

    timestamps()
  end
end
