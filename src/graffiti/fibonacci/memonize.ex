defmodule Fibonacci do
  def fib(n), do: fib(n, %{0 => 0, 1 => 1})

  defp fib(0, memo), do: {0, memo}
  defp fib(1, memo), do: {1, memo}
  defp fib(n, memo) do
    case Map.fetch(memo, n) do
      {:ok, value} -> {value, memo}
      :error ->
        {n1, memo} = fib(n - 1, memo)
        {n2, memo} = fib(n - 2, memo)
        value = n1 + n2
        {value, Map.put(memo, n, value)}
    end
  end
end

# 使用例
{result, _memo} = Fibonacci.fib(1000)
IO.puts result # 55
