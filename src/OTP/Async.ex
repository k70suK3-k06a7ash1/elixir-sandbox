defmodule Async do
  use GenServer

  def init(state)do
    IO.puts("カウンタの初期化：#{state}")
    {:ok, state}
  end

  def handle_cast(:up, state)do
    state = state + 1
    IO.puts("カウントアップ（非同期） #{inspect state}")
    {:noreply, state}
  end


  def handle_cast(:down, state)do
    state = state - 1
    IO.puts("カウントダウン（非同期） #{inspect state}")
    {:noreply, state}
  end
end
