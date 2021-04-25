defmodule Mijncmd.Regexp do
  def email, do: ~r/^\S+@\S+\.\S+$/
  def slug, do: ~r/\A[a-z|0-9|_|-]+\z/

  def slug_message, do: "valid chars: a-z, 0-9, -, _"
end
