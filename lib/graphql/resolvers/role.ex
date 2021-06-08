defmodule Mijncmd.GraphQL.Resolvers.Role do
  alias Mijncmd.{
    Role
  }

  def list(_, _, _), do: {:ok, Role.all()}
end
