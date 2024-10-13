defmodule MathTest do
  use ExUnit.Case
  doctest Math

  test "addition_1" do
    assert Math.add(1, 2) == 3
  end
  test "addition_2" do
    assert Math.add(2, 2) == 4
  end
end
