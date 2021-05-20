defmodule MijncmdWeb.Resolvers.Accounts do
  alias Mijncmd.Accounts
  alias Mijncmd.Accounts.User

  def create_user(_parent, args, _context) do
    with {:ok, %{user: user}} <- Accounts.register_user(args) do
      {:ok, %{user: User.map_user_avatar_url(user)}}
    end
  end

  def current(_, %{context: %{current_user: user}}) do
    {:ok, User.map_user_avatar_url(user)}
  end

  def login(%{email: email, password: password}, _info) do
    # with %User{} = user <- Accounts.get_user_by_email_and_password(email, password),
    #       {:ok, jwt, _full_claims} <- Mijncmd.Guardian.encode_and_sign(user) do
    #   {:ok, %{token: jwt, user: User.map_user_avatar_url(user)}}
    # else
    #   _ -> {:error, "Incorrect email or password"}
    # end
  end
end
