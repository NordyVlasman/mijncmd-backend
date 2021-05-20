defmodule Mijncmd.GraphQL.Types.Role do
  use Absinthe.Schema.Notation

  enum :role do
    value(:student, as: "student")
    value(:admin, as: "admin")
    value(:teacher, as: "teacher")
  end

  object :role_item do
    field(:slug, non_null(:role))
  end
end