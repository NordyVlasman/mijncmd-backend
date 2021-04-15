defmodule MijncmdWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias MijncmdWeb.Resolvers

  @desc "A user"
  object :user do
    field :email, :string
    field :id, :id
  end

  object :create_user_mutation do
    @desc """
    create user
    """

    @desc "Create a user"
    field :register, :user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.create_user/3)
    end
  end

  object :login_mutation do
    @desc """
    login with the params
    """

    field :login, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Accounts.login/2)
    end
  end

  object :user_query do
    @desc """
    return a user
    """

    field :get_user, :user do
      resolve(&Resolvers.Accounts.current/2)
    end
  end

  @desc "session value"
  object :session do
    field(:token, :string)
    field(:user, :user)
  end
end
