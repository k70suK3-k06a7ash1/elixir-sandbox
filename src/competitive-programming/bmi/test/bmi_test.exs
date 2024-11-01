defmodule BmiTest do
  use ExUnit.Case
  doctest Bmi

  test "BMI" do
    assert Bmi.calc(170, 55) == 19
  end
end
