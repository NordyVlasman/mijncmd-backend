defmodule MijncmdWeb.Schema do
  use Absinthe.Schema

  alias MijncmdWeb.Schema

  import_types Absinthe.Type.Custom
  import_types(Schema.UserTypes)
  import_types(Schema.SkillTypes)

  query do
    # user
    import_fields(:user_query)

    # skills
    import_fields(:skill_query)
    # threads

    # posts
  end

  mutation do
    # authentication
    import_fields(:login_mutation)
    import_fields(:create_user_mutation)

    # skills
    import_fields(:create_skill_mutation)

    # posts

    # threads
  end
end
