defmodule SongRankWeb.SongRanking do
  use SongRankWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :songs, SongRank.Song.get_songs_with_votes())
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div>
      <%= for song <- @songs do %>
        <div>
        <%= song[:title] %>
        <%= song[:votes] %>
        </div>
      <% end %>

    </div>
    """
  end
end
