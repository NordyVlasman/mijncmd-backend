defmodule Mijncmd.GraphQL.Resolvers.User do
  require Ecto.Query

  alias Mijncmd.{
    UserCreate,
    Repo,
    User,
    UserSkillCreate,
  }

  def login(%{email: email, password: password}, _args) do
    case UserCreate.login(%{email: email, password: password}) do
      {:ok, %{user: user, token: token}} ->
        {:ok, %{user: user, errors: nil, access_token: token}}
      _ ->
        {:ok, %{user: nil, errors: "failed", access_token: nil}}
    end
  end

  def create(_, params, _) do
    case UserCreate.create(params) do
      {:ok, user} ->
        {:ok, %{user: user, errors: nil}}
      {:error, _reason} ->
        {:ok, %{user: nil, errors: ["unproccessable_entity"]}}
    end
  end

  def current_user(_, _, info) do
    user = info.context[:conn].assigns[:current_user]
    {:ok, user}
  end

  def list_users(_, _, _info) do
    users =
      User
      |> Ecto.Query.order_by(desc: :inserted_at)
      |> Repo.all()
    {:ok, users}
  end
  def add_skill(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case UserSkillCreate.create(user, params) do
      {:ok, user} ->
        {:ok, %{user: user, errors: nil}}
      {:error, _reason} ->
        {:ok, %{user: nil, errors: ["Failed"]}}
    end
  end
end
