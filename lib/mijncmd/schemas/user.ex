defmodule Mijncmd.User do
  use Mijncmd.Schema

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:handle, :string)

    field(:website_url, :string)
    field(:github_url, :string)
    field(:dribbble_url, :string)

    field(:password, :string, virtual: true)
    field(:hashed_password, :string)
    field(:confirmed_at, :naive_datetime)

    timestamps()
  end

  @required_fields ~w(name email password handle)a
  @optional_fields ~w(website_url github_url dribbble_url avatar)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> update_change(:email, &String.trim/1)
    |> validate_format(:email, ~r/.+@.+/)
  end

  def with_avatar(%User{} = user) when user.avatar, do: Image.url({user.avatar, user}, :thumb, signed: true)
end
