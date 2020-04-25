defmodule Sitex.Site do
  alias Sitex.Page

  pages_paths = "pages/**/*.conf" |> Path.wildcard() |> Enum.sort()

  pages = for page_path <- pages_paths do
    @external_resource Path.relative_to_cwd(page_path)
    Page.parse!(page_path)
  end

  @pages Enum.reduce(pages, %{}, fn page, map -> Map.put(map, Page.key(page), page) end)

  def pages() do
    @pages
  end

  def index() do
    get(Page.key(nil, "index.conf"))
  end

  def get(key) do
    pages()[key]
  end

  def get_urls() do
    pages() |> Map.keys() |> Enum.map(fn file -> String.replace(file, "conf", "html") end)
  end
end
