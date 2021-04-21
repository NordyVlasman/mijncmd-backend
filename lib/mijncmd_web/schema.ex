defmodule MijncmdWeb.Schema do
  @moduledoc false

  use Absinthe.Schema

  alias MijncmdWeb.Data

  import_types MijncmdWeb.Schema.Objects
  import_types MijncmdWeb.Schema.Mutations

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Data, Data.data())

    Map.put(ctx, :loader, loader)
  end

  query do
    @desc "The current authenticated user."
    field :get_user, :user do
      resolve(fn _, %{context: %{current_user: current_user}} ->
        {:ok, current_user}
      end)
    end
  end

  mutation do
    field :login, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &MijncmdWeb.Resolvers.Accounts.login/2
    end

    field :register, :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      arg :name, non_null(:string)
      arg :website_url, :string
      arg :github_url, :string
      arg :dribbble_url, :string

      resolve &MijncmdWeb.Resolvers.Accounts.create_user/3
    end

    field :create_post, type: :create_post_payload do
      arg :title, non_null(:string)
      arg :slug, non_null(:string)
      arg :description, non_null(:string)
      arg :body, non_null(:string)
      resolve &MijncmdWeb.Mutations.Post.create_post/2
    end

    field :create_skill, type: :create_skill_payload do
      arg :name, non_null(:string)
      arg :slug, non_null(:string)
      arg :description, :string
      resolve &MijncmdWeb.Mutations.Skill.create_skill/2
    end
  end
end
