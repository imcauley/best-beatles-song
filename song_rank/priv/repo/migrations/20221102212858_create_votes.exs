defmodule SongRank.Repo.Migrations.CreateVotes do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add(:song_id, :integer)
      add(:inserted_at, :utc_datetime)
    end
  end
end
