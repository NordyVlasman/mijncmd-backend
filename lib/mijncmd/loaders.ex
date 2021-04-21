defmodule Mijncmd.Loaders do
  @moduledoc """
  Sources for dataloader.
  """

  alias Mijncmd.Loaders.Database

  @dialyzer {:nowarn_function, database_source: 1}

  def database_source(params) do
    Database.source(params)
  end
end
