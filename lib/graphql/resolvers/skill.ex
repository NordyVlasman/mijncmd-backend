defmodule Mijncmd.GraphQL.Resolvers.Skill do
  require Ecto.Query

  alias Mijncmd.{
    Skill,
    Repo
  }

  def get_skills(_, _, _) do
    skills =
      Skill
      |> Repo.all()
    {:ok, skills}
  end
end
