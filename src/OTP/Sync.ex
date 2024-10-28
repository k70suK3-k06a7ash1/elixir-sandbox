defmodule Sync do
  use GenServer

  def init(state)do
    IO.puts("カウンタの初期化：#{state}")
    {:ok, state}
  end

  def handle_call(:up,from, state) do
    state = state + 1 # カウントアップ
    {:reply, "カウントアップ： #{inspect state}", state}
  end
end
