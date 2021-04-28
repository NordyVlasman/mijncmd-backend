defmodule Mijncmd.Files.Image do
  use Mijncmd.File, [:jpg, :jpeg, :png, :gif, :svg, :string]

  @versions [:original, :large, :medium, :small]

  def storage_dir(_, {_, scope}), do: expanded_dir("/#{source(scope)}/#{hashed(scope.id)}")
  def filename(version, _), do: version

  def transform(:original, _), do: :noaction

  def transform(version, {file, _scope}) do
    case file_type(file) do
      :gif -> :noaction
      :svg -> :noaction
      _ -> {:convert, "-strip -resize #{dimensions(version)}"}
    end
  end

  defp dimensions(:large), do: "1200>"
  defp dimensions(:medium), do: "600>"
  defp dimensions(:small), do: "300>"
end