defmodule SongRankWeb.SongRanking do
  use SongRankWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, songs: SongRank.Song.get_songs_with_votes())
    if connected?(socket), do: Phoenix.PubSub.subscribe(SongRank.PubSub, "update")
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

  def handle_info({:ranking_update, songs_with_votes}, socket) do
    socket = assign(socket, songs: songs_with_votes)
    {:no_reply, socket}
  end
end
