defmodule Counter do
  use GenServer

  def init(state)do
    IO.puts("カウンタの初期化：#{state}")
    {:ok, state}
  end
end
