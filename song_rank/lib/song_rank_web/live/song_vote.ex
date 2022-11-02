defmodule SongRankWeb.SongVote do
  use SongRankWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :songs, random_song_tuple())
    {:ok, socket}
  end

  def render(assigns) do
    song_1 = random_song()

    ~L"""
    <h1>Pick One</h1>

    <div phx-click=pick_song_1>
      <%= elem(@songs, 0).title %>
    </div>

    <div phx-click=pick_song_2>
      <%= elem(@songs, 1).title %>
    </div>
    """
  end

  def random_song_tuple() do
    {random_song(), random_song()}
  end

  def random_song() do
    index = :rand.uniform(3)

    SongRank.Repo.get(SongRank.Song, index)
  end

  def handle_event("pick_song_1", _, socket) do
    song_id = elem(socket.assigns.songs, 0).id
    SongRank.Vote.vote_for_song(song_id)

    socket = assign(socket, :songs, random_song_tuple())
    {:noreply, socket}
  end

  def handle_event("pick_song_2", _, socket) do
    song_id = elem(socket.assigns.songs, 1).id
    SongRank.Vote.vote_for_song(song_id)

    socket = assign(socket, :songs, random_song_tuple())
    {:noreply, socket}
  end
end
