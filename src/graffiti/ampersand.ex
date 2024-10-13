numbers = [2,11,-4]
result = Enum.map(numbers, &(&1 + 1))
IO.inspect(result)
