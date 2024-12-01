defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "gets correct result for part 1" do
    input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3"
    expected = 11

    assert Day01.part_one(input) === expected
  end

  test "gets correct result for part 2" do
    input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3"
    expected = 31

    assert Day01.part_two(input) === expected
  end
end
