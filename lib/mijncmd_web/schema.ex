defmodule MijncmdWeb.Schema do
  use Absinthe.Schema

  alias MijncmdWeb.Schema

  import_types Absinthe.Type.Custom
  import_types(Schema.UserTypes)

  query do
    # Add queries here.
  end

  mutation do
    import_fields(:login_mutation)
    import_fields(:create_user_mutation)
  end
end
