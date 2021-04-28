defmodule Mijncmd.Uploaders.Image do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]
  @extension_whitelist ~w(.jpg .jpeg .gif .png .svg)

  def validate({ file, _}) do
    file_extension = get_file_name(file)
    Enum.member?(@extension_whitelist, file_extension)
  end

  def transform(:thumb, {file, scope}) do
    is_gif = get_file_name(file) == ".gif"
    is_svg = get_file_name(file) == ".svg"

    if !is_gif and !is_svg do
      {:convert, "-thumbnail 100x100^ -gravity center -extent 100x100 -format png", :png}
    else
      :noaction
    end
  end

  def filename(version, {file, scope}) do
    file_name = Path.basename(file.file_name, Path.extname(file.file_name))
    "#{version}_#{file_name}"
  end

  def filename(version, _), do: version

  def default_url(:thumb) do
    "https://placehold.it/100x100"
  end

  defp get_file_name(file) do
    file.file_name |> Path.extname() |> String.downcase()
  end
end
