defmodule Mijncmd.GraphQL.Helpers.Fields do
  use Absinthe.Schema.Notation

  def field_alias(field) do
    fn root, _, _ -> {:ok, Map.get(root, field)} end
  end
end
