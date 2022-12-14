defmodule SongRankWeb.SongVote do
  use SongRankWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :songs, random_song_tuple())
    {:ok, socket}
  end

  # def render(assigns) do
  #   test_elem = "images/sgt_peppers_lonely_hearts_club_band.jpg"

  #   ~L"""
  # <div phx-click=pick_song_1>
  #   <%= elem(@songs, 0).title %>
  # </div>

  # <div phx-click=pick_song_2>
  #   <%= elem(@songs, 1).title %>
  # </div>

  #   <.image_card image={"sgt_peppers_lonely_hearts_club_band"} />
  #   """
  # end

  def image_card(assigns) do
    ~H"""
      Happy birthday <%= @image %>!
    """
  end

  def random_song_tuple() do
    song_1 = SongRank.Song.random_song()
    song_2 = SongRank.Song.random_song(song_1.id)
    {song_1, song_2}
  end

  def handle_event("pick_song_1", _, socket) do
    song_id = elem(socket.assigns.songs, 0).id
    loser_id = elem(socket.assigns.songs, 1).id
    SongRank.Vote.vote_for_song(song_id, loser: loser_id)

    socket = assign(socket, :songs, random_song_tuple())
    {:noreply, socket}
  end

  def handle_event("pick_song_2", _, socket) do
    song_id = elem(socket.assigns.songs, 1).id
    loser_id = elem(socket.assigns.songs, 0).id
    SongRank.Vote.vote_for_song(song_id, loser: loser_id)

    socket = assign(socket, :songs, random_song_tuple())
    {:noreply, socket}
  end
end
