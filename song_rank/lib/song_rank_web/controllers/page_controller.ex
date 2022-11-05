defmodule SongRankWeb.PageController do
  use SongRankWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/vote")
  end
end
