defmodule Bmi do
  def calc(height, weight) do
    unit = height / 100
    denominator = unit |> Kernel.*(unit)
    IO.puts(denominator)
    round(weight / denominator)
  end
end
