numbers = [2,11,-4]
increment = fn n -> n + 1 end
result = Enum.map(numbers, increment)
IO.inspect(result)
