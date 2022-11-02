defmodule SongRankWeb.PageController do
  use SongRankWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
