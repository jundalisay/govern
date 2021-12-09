defmodule GovernWeb.PageController do
  use GovernWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
