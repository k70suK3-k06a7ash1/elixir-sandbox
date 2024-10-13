numbers = [2,11,-4]
result = Enum.map(numbers, fn n -> n + 1 end)
IO.inspect(result)
