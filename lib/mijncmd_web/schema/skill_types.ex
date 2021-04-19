defmodule MijncmdWeb.Schema.SkillTypes do
  use Absinthe.Schema.Notation

  alias MijncmdWeb.Resolvers

  @desc "A skill"
  object :skill do
    field :title, :string
    field :downcase_name, :string
    field :description, :string
    field :slug, :string
  end

  @desc "A user Skill"
  object :user_skill do
    field :skill_id, :id
    field :user_id, :id
  end

  object :create_skill_mutation do
    @desc """
    create skill
    """

    @desc "Create a skill"
    field :create_skill, :user_skill do
      arg(:title, non_null(:string))
      resolve(&Resolvers.Skills.create_skill/3)
    end
  end

  object :skill_query do
    @desc "Get all skills"
    field :skills, list_of(:skill) do
      resolve(&Resolvers.Skills.list_skills/3)
    end
  end
end
