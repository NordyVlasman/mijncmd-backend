defmodule Mijncmd.UserAuthFetcher do
  import Ecto.Query, only: [from: 2]

  alias Mijncmd.{
    Repo,
    User
  }

  def fetch(access_token) do
    access_token
    |> fetch_user
  end

  defp fetch_user("Bearer " <> token) when is_binary(token) do
    from(
      user in User,
      inner_join: access_token in assoc(user, :access_tokens),
      where: access_token.token == ^token,
      where: is_nil(access_token.revoked_at)
    )
    |> Repo.one()
  end

  defp fetch_user(_any), do: nil

  defp map_permissions(nil), do: nil
end
