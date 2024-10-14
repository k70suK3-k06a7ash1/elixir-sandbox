defmodule Fibonacci do
  def fib(n) do
    fib_iter(n, 0, 1)
  end

  defp fib_iter(0, a, _), do: a
  defp fib_iter(n, a, b) do
    fib_iter(n - 1, b, a + b)
  end
end

# 使用例
IO.puts Fibonacci.fib(100000)
