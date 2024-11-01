defmodule Bmi do
  def calc(height, weight) do
    unit = height / 100
    denominator = unit |> Kernel.*(unit)
    IO.puts(denominator)
    round(weight / denominator)
  end

  def rate(bmi) do
    cond do
      bmi < 20 -> "A"
      bmi > 20 and bmi < 25 -> "B"
      bmi >= 25 -> "C"
    end
  end
end
