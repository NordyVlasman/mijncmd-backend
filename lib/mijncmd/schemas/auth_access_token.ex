defmodule Mijncmd.AccessToken do
  use Mijncmd.Schema

  schema "auth_access_tokens" do
    field(:token, :string)
    field(:revoked_at, :naive_datetime)

    belongs_to(:user, Mijncmd.User)

    timestamps()
  end
end
