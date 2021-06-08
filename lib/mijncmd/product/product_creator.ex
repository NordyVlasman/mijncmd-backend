defmodule Mijncmd.ProductCreate do
  alias Mijncmd.{
    Product,
    Repo
  }
  import Ecto.Query, warn: false

  def create(_user, params) do
    %Product{}
    |> Product.create_changeset(params)
    |> Repo.insert()
  end
end
