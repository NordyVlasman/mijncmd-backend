defmodule Mijncmd.UserCreate do
  alias Mijncmd.{User, Repo, UserRemote.Authenticator}

  def create(params) do
    %User{}
    |> User.create_changeset(params)
    |> Repo.insert()
  end

  def login(%{email: email, password: password}) do
    case Authenticator.authenticate(%{email: email, password: password}) do
      %{user: user, token: token} ->
        {:ok, %{user: user, token: token}}
      _ ->
        {:ok ,%{user: nil, errors: "something bad happened", access_token: nil}}
    end
  end
end
