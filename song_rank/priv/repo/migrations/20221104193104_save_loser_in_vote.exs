defmodule SongRank.Repo.Migrations.SaveLoserInVote do
  use Ecto.Migration

  def change do
    alter table("votes") do
      add(:loser_song_id, :integer, null: true)
    end
  end
end
