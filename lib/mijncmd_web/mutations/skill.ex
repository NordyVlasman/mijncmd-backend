defmodule MijncmdWeb.Mutations.Skill do
  alias Mijncmd.{
    Skills.CreateSkill
  }

  def create_skill(args, %{context: %{current_user: _user}}) do
    with {:ok, %{skill: skill}} <- CreateSkill.perform(args) do
      {:ok, %{success: true, skill: skill, errors: []}}
    else
      {:error, :skill, changeset, _} ->
        {:ok, %{success: false, skill: nil, errors: changeset}}
      err ->
        err
    end
  end
end
