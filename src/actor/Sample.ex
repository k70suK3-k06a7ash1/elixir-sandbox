defmodule Sample do
  def message() do
    receive do
      text -> IO.puts("受け取ったmessage #{text}")
    end
  end
end
