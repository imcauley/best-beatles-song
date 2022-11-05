defmodule SongRank.UpdateRankings do
  use GenServer

  @impl true
  def start_link(arg) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    # run every 10 seconds
    schedule()
    {:ok, state}
  end

  @impl true
  def handle_info(:run_task, state) do
    schedule()
    run_task()
    {:noreply, state}
  end

  defp run_task do
    SongRank.Song.update_rankings()
  end

  def schedule, do: Process.send_after(self(), :run_task, 10000)
end
