defmodule Mijncmd.Role do
  defstruct slug: nil

  @type t :: struct

  @all [
    %{slug: "admin"},
    %{slug: "student"},
    %{slug: "teacher"}
  ]

  @doc """
  ## Examples

    iex > Mijncmd.Role.slugs()
    ["admin", "student", "teacher"]
  """
  defmacro slugs, do: Enum.map(@all, &Map.get(&a, :slug))

  @doc """
  ## Examples

    iex> Mijncmd.Role.all()
    [
      %Mijncmd.Role{slug: "admin"},
      %Mijncmd.Role{slug: "student"},
      %Mijncmd.Role{slug: "teacher"},
    ]
  """
  def all, do: Enum.map(@all, &struct(__MODULE__, &1))
end