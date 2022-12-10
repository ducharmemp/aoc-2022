defmodule Aoc2022.Day05 do
  def part1(lines) do
    [initial_stacks, instructions] = divide_input(lines)
    stacks = create_stacks(tl(initial_stacks))

    final_state =
      for instruction <- instructions, reduce: stacks do
        acc -> crank_instruction(instruction, acc)
      end

    decode_message(final_state)
  end

  def part2(lines) do
    [initial_stacks, instructions] = divide_input(lines)
    stacks = create_stacks(tl(initial_stacks))

    final_state =
      for instruction <- instructions, reduce: stacks do
        acc -> crank_instruction_grouped(instruction, acc)
      end

    decode_message(final_state)
  end

  defp divide_input(lines) do
    segments = lines |> Enum.chunk_by(fn line -> String.length(line) == 0 end)
    [stacks, instructions] = Enum.reject(segments, fn segment -> length(segment) == 1 end)
    [Enum.reverse(stacks), instructions]
  end

  defp create_stacks(stacks) do
    stack_matrix =
      for stack_line <- stacks do
        stack_line |> String.codepoints() |> Enum.chunk_every(4) |> Enum.map(&Enum.join/1)
      end

    stacked_columns = Enum.zip(stack_matrix) |> Enum.map(&Tuple.to_list/1)

    filtered_stacks =
      for stack <- stacked_columns do
        for elem <- stack, String.trim(elem) != "" do
          String.trim(elem) |> String.replace(~r/[\[\]]/, "")
        end
      end

    for {stack, index} <- Enum.with_index(filtered_stacks), reduce: %{} do
      acc -> Map.put(acc, index, stack)
    end
  end

  defp crank_instruction(instruction_line, current_state) do
    [_move, count, _from, from_stack_idx, _to, to_stack_idx] = String.split(instruction_line)
    from_stack_idx = String.to_integer(from_stack_idx) - 1
    to_stack_idx = String.to_integer(to_stack_idx) - 1
    count = String.to_integer(count)
    from_stack = Map.get(current_state, from_stack_idx)
    to_stack = Map.get(current_state, to_stack_idx)
    {from_stack, crates_to_move} = Enum.split(from_stack, length(from_stack) - count)
    to_stack = to_stack ++ Enum.reverse(crates_to_move)
    current_state = Map.put(current_state, from_stack_idx, from_stack)
    current_state = Map.put(current_state, to_stack_idx, to_stack)
    current_state
  end

  defp crank_instruction_grouped(instruction_line, current_state) do
    [_move, count, _from, from_stack_idx, _to, to_stack_idx] = String.split(instruction_line)
    from_stack_idx = String.to_integer(from_stack_idx) - 1
    to_stack_idx = String.to_integer(to_stack_idx) - 1
    count = String.to_integer(count)
    from_stack = Map.get(current_state, from_stack_idx)
    to_stack = Map.get(current_state, to_stack_idx)
    {from_stack, crates_to_move} = Enum.split(from_stack, length(from_stack) - count)
    to_stack = to_stack ++ crates_to_move
    current_state = Map.put(current_state, from_stack_idx, from_stack)
    current_state = Map.put(current_state, to_stack_idx, to_stack)
    current_state
  end

  def decode_message(state) do
    message =
      for {_idx, stack} <- state, reduce: [] do
        acc -> [List.last(stack) | acc]
      end

    message |> Enum.reverse() |> Enum.join("")
  end
end
