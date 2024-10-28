defmodule KeepProcess do
  def message() do
    receive do
      text -> IO.puts("受け取ったメッセージ： #{text}")
      message()
    end
  end
end
