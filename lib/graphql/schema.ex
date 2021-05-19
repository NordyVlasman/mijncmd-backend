defmodule Mijncmd.GraphQL.Schema do
  use Absinthe.Schema

  alias Mijncmd.Repo

  # Scalars
  import_types(Mijncmd.GraphQL.DatetimeScalar)

  import_types(Mijncmd.GraphQL.Types.User)
  import_types(Mijncmd.GraphQL.Types.MutationResult)

  query do

  end

  mutation do

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
