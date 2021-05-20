defmodule Mijncmd.UserRemote.Authenticator do
  alias Mijncmd.{
    UserRemote.TokenGiver,
    User,
    Repo
  }

  def authenticate(%{email: email, password: password}) do
    user = Repo.get_by(User, email: email)
    if User.valid_password?(user, password) do
      case TokenGiver.grant_token(user) do
        {:ok, token} ->
          %{user: user, token: token.token}
        _ ->
          IO.puts("fail")
      end
        # TokenGiver.grant_token(user)
    else
      IO.puts("FML")
    end
  end
end
