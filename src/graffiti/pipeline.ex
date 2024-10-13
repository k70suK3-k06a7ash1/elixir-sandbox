result = [1, 2, 3, 4, 5]
|> Enum.map(fn x -> x * 3 end)
|> Enum.sum()

IO.puts(result)
