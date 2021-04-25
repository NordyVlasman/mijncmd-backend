defmodule MijncmdWeb.Resolvers.Skills do
  alias Mijncmd.Skills
  alias Mijncmd.Skill

  alias Mijncmd.Repo

  import Ecto.Query

  def create_skill(_parent, args, %{context: %{current_user: user}}) do
    if user do
      changeset = Skill.insert_changeset(%Skill{}, args)
      case Repo.insert(changeset) do
        {:ok, skill} ->
          {:ok, skill}
        {:error, changeset} ->
          {:error, changeset}
      end
    end
  end

  def list_skills(_parent, _args,  %{context: %{current_user: user}}) do
    if user do
      data =
        Skill
        |> order_by([q], asc: q.name)
        |> Repo.all()
      {:ok, data}
    end
  end
end
