defmodule MijncmdWeb.Resolvers.Skills do
  alias Mijncmd.Skills
  alias Mijncmd.Skills.UserSkill
  alias Mijncmd.Skills.Skill

  def create_skill(_parent, args, %{context: %{current_user: user}}) do
    if user do
      {:ok}
      # with {:ok, %Skill{} = user_skill} <- Skills.create_user_skill(user, args) do
      #   {:ok, %{skill: user_skill}}
      # end
    end
  end

  # def list(_, %{context: %{current_user: user}}) do
  #   if user do
  #     Skills.list_skills!()
  #   end
  # end

  def list_skills(_parent, _args,  %{context: %{current_user: user}}) do
    if user do
      {:ok, Skills.list_skills}
    end
  end
end
