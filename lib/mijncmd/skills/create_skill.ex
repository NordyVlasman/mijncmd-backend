defmodule Mijncmd.Skills.CreateSkill do
  @moduledoc false

  alias Ecto.Multi

  alias Mijncmd.{
    Repo,
    Skill
  }

  def perform(params) do
    Multi.new()
    |> insert_skill(params)
    |> Repo.transaction()
  end

  defp insert_skill(multi, params) do
    Multi.insert(multi, :skill, Skill.insert_changeset(%Skill{}, params))
  end
end
