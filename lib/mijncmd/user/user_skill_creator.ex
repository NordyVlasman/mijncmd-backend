defmodule Mijncmd.UserSkillCreate do
  alias Mijncmd.{User, Repo, UserSkill}
  import Ecto.Query, warn: false

  def create(%User{} = user, params) do
    params = Map.put(params, :user_id, user.id)
    Enum.each(params.skills, fn skill ->
      userSkill = %{user_id: user.id, skill_id: skill}
      %UserSkill{}
      |> UserSkill.create_changeset(userSkill)
      |> Repo.insert()
    end)
    user = Repo.get(User, user.id)
    {:ok, user}
  end
end
