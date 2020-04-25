defmodule SitexWeb.PageController do
  use SitexWeb, :controller

  alias Sitex.{Site,Page}

  def index(conn, _params) do
    %Page{title: title, content: content} = Site.index()

    conn
    |> assign(:page_title, title)
    |> assign(:pars, content["pars"])
    |> render("page.html")
  end

  def page(conn, %{"section" => section, "file" => file}) do
    %Page{title: title, content: content} = Page.key(section, String.replace(file, "html", "conf")) |> Site.get()

    conn
    |> assign(:page_title, title)
    |> assign(:pars, content["pars"])
    |> render("page.html")
  end
  def page(conn, %{"section" => section}), do: page(conn, %{"section" => section, "file" => "index.html"})
end
