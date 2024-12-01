defmodule Day01 do
  import Util, only: [file_to_list: 2]

  defp split(input) do
    String.split(input, " ", trim: true) |> Enum.map(&(String.to_integer(&1)))
  end

  defp split_into_arrs(list) do
    [first | second] = split(hd(list))
    list_one = [] ++ [first]
    list_two = second
    split_into_arrs(tl(list), list_one, list_two)
  end

  defp split_into_arrs([head | tail], list_one, list_two) when length(tail) >= 0 do
    [first | second] = split(head)
    list_one = list_one ++ [first]
    list_two = list_two ++ second
    split_into_arrs(tail, list_one, list_two)
  end

  defp split_into_arrs(list, list_one, list_two) when length(list) === 0 do
    [list_one, list_two]
  end

  def part_one(input) do
    [first | [second | _]] = file_to_list(input, "\n") |> split_into_arrs |> Enum.map(&(Enum.sort(&1)))
    Enum.zip_reduce(first, second, [], fn x, y, acc -> acc ++ [abs(x - y)] end) |> Enum.sum
  end

  def part_two(input) do
    [first | [second | _]] = file_to_list(input, "\n") |> split_into_arrs
    Enum.reduce(first, [], fn x, acc -> acc ++ [x * Enum.count(second, fn y -> y == x end)] end) |> Enum.sum
  end

  def run do
    {:ok, input} = File.read("lib/day01/input")
    IO.puts(part_one(input))
    IO.puts(part_two(input))
  end
end
