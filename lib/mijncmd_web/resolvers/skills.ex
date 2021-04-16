defmodule MijncmdWeb.Resolvers.Skills do
  alias Mijncmd.Skills

  def create_skill(_parent, args, %{context: %{current_user: user}}) do
    if user do
      Skills.create_skill(args)
    end
  end

  # def list(_, %{context: %{current_user: user}}) do
  #   if user do
  #     Skills.list_skills!()
  #   end
  # end

  def list_skills(_parent, _args,  %{context: %{current_user: user}}) do
    if user do
      {:ok, Skills.list_skills! }
    end
  end
end
