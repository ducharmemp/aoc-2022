defmodule Aoc2022.Day01 do
  def part1(lines) do
    lines
    |> chunk_elf_calories
    |> Enum.map(&sum_elf_calories/1)
    |> Enum.max()
  end

  def part2(lines) do
    lines
    |> chunk_elf_calories
    |> Enum.map(&sum_elf_calories/1)
    |> Enum.sort(:desc)
    |> Enum.slice(0..2)
    |> Enum.sum()
  end

  defp chunk_elf_calories(lines) do
    chunk_fun = fn element, acc ->
      if element == "" do
        {:cont, acc, []}
      else
        {:cont, [element | acc]}
      end
    end

    after_fun = fn
      [] -> {:cont, []}
      acc -> {:cont, acc, []}
    end

    Enum.chunk_while(lines, [], chunk_fun, after_fun)
    |> Enum.reject(&Enum.empty?/1)
  end

  defp sum_elf_calories(line) do
    Enum.sum(line |> Enum.map(&parse_integer/1))
  end

  defp parse_integer(string) do
    {val, ""} = Integer.parse(string)
    val
  end
end
