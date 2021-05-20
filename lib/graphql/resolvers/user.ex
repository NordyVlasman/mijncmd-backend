defmodule Mijncmd.GraphQL.Resolvers.User do
  require Ecto.Query

  alias Mijncmd.{
    UserCreate
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
end
