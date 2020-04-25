defmodule Sitex.Page do
  alias Sitex.Page

  @enforce_keys [:filename, :title, :content]
  defstruct [:filename, :parent, :title, :content]

  def parse!(filename) do
    [parent, file] = filename |> Path.split() |> Enum.take(-2)

    parent = case parent do
      "pages" -> nil
      other -> other
    end

    case Hocon.decode(File.read!(filename)) do
      {:ok, data} -> %Page{filename: file, parent: parent, title: data["title"], content: data}
      {:error, msg} -> %Page{filename: file, parent: parent, title: "Error", content: %{msg: msg}}
    end
  end

  def key(nil, filename) do
    filename
  end
  def key(year, filename) do
    year <> "/" <> filename
  end
  def key(%Page{filename: filename, parent: nil}) do
    filename
  end
  def key(%Page{filename: filename, parent: parent}) do
    parent <> "/" <> filename
  end
end
