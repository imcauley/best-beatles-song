defmodule SongRankWeb.PageController do
  use SongRankWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/ranking")
  end
end
