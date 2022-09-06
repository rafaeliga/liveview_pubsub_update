defmodule LiveviewPubsubUpdateWeb.PageController do
  use LiveviewPubsubUpdateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
