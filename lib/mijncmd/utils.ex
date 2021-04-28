defmodule Mijncmd.Utils do

  @type changeset :: Ecto.Changeset.t()
  @type conn :: Plug.Conn.t()

  def stringify_struct(schema, nil), do: struct(schema, %{})

  def stringify_struct(schema, params) when is_map(params) do
    keys =
      schema
      |> struct([])
      |> Map.from_struct()
      |> Map.keys()
      |> Enum.map(&Atom.to_string/1)

    params =
      params
      |> Map.take(keys)
      |> Enum.map(fn {key, value} -> {String.to_atom(key), value} end)

    struct(schema, params)
  end
end
