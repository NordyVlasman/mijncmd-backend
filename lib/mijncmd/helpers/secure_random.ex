defmodule Mijncmd.Helpers.SecureRandom do
  @moduledoc """
  Returns random Base64 encoded string.
  """

  def urlsafe_base64(length) do
    length
    |> :crypto.strong_rand_bytes()
    |> :base64.encode_to_string()
    |> to_string
    |> String.replace(~r/[\n\=]/, "")
    |> String.replace(~r/\+/, "-")
    |> String.replace(~r/\//, "_")
  end
end
