messages = ["One", "Two"]

no_capture_operator = fn msg ->
  IO.inspect(msg, label: "no_capture_operator")
  %{itemValue: msg}
end
# no_capture_operator: "One"
# no_capture_operator: "Two"

messages |> Enum.map(no_capture_operator)

new_messages = messages |> Enum.map(&%{itemValue: &1})

IO.inspect(new_messages)
# [%{itemValue: "One"}, %{itemValue: "Two"}]

new_messages = messages |> Enum.map(fn msg ->
  IO.inspect(msg)
  %{itemValue: msg}
end)
# "One"
# "Two"

IO.inspect(new_messages, label: "new_messages =")
# new_messages =: [%{itemValue: "One"}, %{itemValue: "Two"}]

message_func = fn msg ->
  IO.inspect(msg)
  %{itemValue: msg}
end

messages |> Enum.map(&message_func.(&1))
# "One"
# "Two"

# the enum tuples have zero-based indexes, hence the + 1
message_with_odd_even = &%{itemValue: &1, type: (if rem(&2 + 1, 2) === 0, do: "even", else: "odd")}

msg_tuple = {"One", 0}

IO.inspect(message_with_odd_even.(elem(msg_tuple, 0), elem(msg_tuple, 1)))
# %{itemValue: "One", type: "odd"}

IO.inspect(message_with_odd_even.("One", 0))
# %{itemValue: "One", type: "odd"}

new_messages = messages |> Enum.with_index |> Enum.map(&message_with_odd_even.(elem(&1, 0), elem(&1, 1)))

IO.inspect(new_messages, label: "new_messages 2 =")
# new_messages 2 =: [%{itemValue: "One", type: "odd"}, %{itemValue: "Two", type: "even"}]

messages |> Enum.each(&IO.inspect(&1, label: "label for " <> &1))
# label for One: "One"
# label for Two: "Two"
