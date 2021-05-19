defmodule Mijncmd.Schemas do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      @type t :: struct
      @foreign_key_type :binary_id
      @timestamps_opts [type: :utc_datetime_usec]

      import Ecto
      import Ecto.Changeset
    end
  end
end
