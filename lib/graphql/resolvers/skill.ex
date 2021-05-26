defmodule Mijncmd.GraphQL.Resolvers.Skill do
  require Ecto.Query

  alias Mijncmd.{
    Skill,
    Repo
  }

  def create_skill(_, _, _) do

  end

  def get_skills(_, params, info) do
    skills =
      Skill
      |> Repo.all()
    {:ok, skills}
  end
end
