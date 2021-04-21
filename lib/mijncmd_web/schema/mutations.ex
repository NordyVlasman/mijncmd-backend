defmodule MijncmdWeb.Schema.Mutations do
  @moduledoc false

  use Absinthe.Schema.Notation

  @desc "Interface for payloads containing validation data."
  interface :validatable do
    field :success, non_null(:boolean)
    field :errors, list_of(:error)
    resolve_type fn _, _ -> nil end
  end

  @desc "A validation error."
  object :error do
    @desc "The name of the invalid attribute."
    field :attribute, non_null(:string)

    @desc "A human-friendly error message."
    field :message, non_null(:string)
  end

  @desc "The response to posting a message to a group."
  object :create_post_payload do
    @desc """
    A boolean indicating if the mutation was successful. If true, the errors
    list is empty. Otherwhise errors may contain objects describing why
    the mutation failed.
    """
    field :success, non_null(:boolean)

    @desc "A list of validation errors."
    field :errors, list_of(:error)

    @desc """
    The mutated object. If the mutation was not successful,
    this field will be nil
    """
    field :post, :post

    interface :validatable
  end

  object :create_skill_payload do
    @desc """
    A boolean indicating if the mutation was successful. If true, the errors
    list is empty. Otherwhise errors may contain objects describing why
    the mutation failed.
    """
    field :success, non_null(:boolean)

    @desc "A list of validation errors."
    field :errors, list_of(:error)

    @desc """
    The mutated object. If the mutation was not successful,
    this field will be nil
    """
    field :skill, :skill

    interface :validatable
  end
end
