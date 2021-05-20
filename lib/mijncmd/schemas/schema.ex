defmodule Mijncmd.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      @type t :: struct
      @timestamps_opts [type: :utc_datetime_usec]

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end
end
