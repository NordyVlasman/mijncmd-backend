defmodule Mijncmd.Skill do
  use Mijncmd.Schema

  alias Mijncmd.{
    PostSkill,
    UserSkill,
    Regexp
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

  def insert_changeset(skill, attrs \\ %{}) do
    skill
    |> cast(attrs, ~w(name slug description)a)
    |> validate_required([:name, :slug])
    |> validate_format(:slug, Regexp.slug(), message: Regexp.slug_message())
    |> unique_constraint(:slug)
  end

  def update_changeset(skill, attrs \\ %{}) do
    skill
    |> insert_changeset(attrs)
  end

  def post_count(skill), do: Repo.count(from(q in PostSkill, where: q.skill_id == ^skill.id))
end
