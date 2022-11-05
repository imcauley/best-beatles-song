defmodule SongRankWeb.SongView do
  use SongRankWeb, :view
  alias SongRankWeb.SongView

  def render("index.json", %{songs: songs}) do
    %{data: render_many(songs, SongView, "song.json")}
  end

  def render("show.json", %{song: song}) do
    %{data: render_one(song, SongView, "song.json")}
  end

  def render("song.json", %{song: song}) do
    %{
      id: song.id,
      name: song.name,
      image: song.image
    }
  end
end
