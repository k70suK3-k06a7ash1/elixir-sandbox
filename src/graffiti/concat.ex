concat = fn
   a, "" -> a
   "", b -> b
   a,b ->  a <> " " <> b
end

result1 = concat.("","")
IO.inspect(result1)


result2 = concat.("a","")
IO.inspect(result2)

result3 = concat.("","b")
IO.inspect(result3)

result4 = concat.("a","b")
IO.inspect(result4)
