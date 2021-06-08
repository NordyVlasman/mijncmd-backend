defmodule Mijncmd.GraphQL.Schema do
  use Absinthe.Schema

  alias Mijncmd.Repo

  # Scalars
  import_types(Absinthe.Plug.Types)

  import_types(Mijncmd.GraphQL.DatetimeScalar)

  import_types(Mijncmd.GraphQL.Types.User)
  import_types(Mijncmd.GraphQL.Types.Post)
  import_types(Mijncmd.GraphQL.Types.Skill)
  import_types(Mijncmd.GraphQL.Types.Product)
  import_types(Mijncmd.GraphQL.Types.Comment)
  import_types(Mijncmd.GraphQL.Types.Role)
  import_types(Mijncmd.GraphQL.Types.MutationResult)

  query do
    field :user, :user do
      resolve(&Mijncmd.GraphQL.Resolvers.User.current_user/3)
    end

    field :users, list_of(:user) do
      resolve(&Mijncmd.GraphQL.Resolvers.User.list_users/3)
    end

    field :posts, list_of(:post) do
      resolve(&Mijncmd.GraphQL.Resolvers.Post.get_posts/3)
    end

    field :post_slug, :post do
      arg :slug, :string
      resolve(&Mijncmd.GraphQL.Resolvers.Post.get_post/3)
    end

    field :skills, list_of(:skill) do
      resolve(&Mijncmd.GraphQL.Resolvers.Skill.get_skills/3)
    end

    field :products, list_of(:product) do
      resolve(&Mijncmd.GraphQL.Resolvers.Product.get_products/3)
    end

    field :roles, non_null(list_of(non_null(:role_item))) do
      resolve(&Mijncmd.GraphQL.Resolvers.Role.list/3)
    end
  end

  mutation do
    import_types(Mijncmd.GraphQL.Mutations.User)
    import_types(Mijncmd.GraphQL.Mutations.Post)
    import_types(Mijncmd.GraphQL.Mutations.Comment)
    import_types(Mijncmd.GraphQL.Mutations.Product)

    import_fields(:user_mutations)
    import_fields(:post_mutations)
    import_fields(:comment_mutations)
    import_fields(:product_mutations)
  end

  def context(absinthe_context) do
    default_query = fn queryable, _ -> queryable end
    default_source = Dataloader.Ecto.new(Repo, query: default_query)

    loader =
      [
        Mijncmd.User
      ]
      |> Enum.reduce(Dataloader.new(), &Dataloader.add_source(&2, &1, default_source))

    Map.put(absinthe_context, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
