defmodule BmiTest do
  use ExUnit.Case
  doctest Bmi

  test "BMI" do
    assert Bmi.calc(170, 55) == 19
  end

  test "Rate: A" do
    assert Bmi.calc(170, 55) |> Bmi.rate() == "A"
  end

  test "Rate: B" do
    assert Bmi.calc(160, 60) |> Bmi.rate() == "B"
  end

  test "Rate: C" do
    assert Bmi.calc(160, 80) |> Bmi.rate() == "C"
  end
end
