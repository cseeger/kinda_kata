defmodule RobotSimulator do
  defguard is_valid_direction(d) when d in [:north, :south, :east, :west]
  defguard is_valid_position(position)
    when
      is_tuple(position)
      and tuple_size(position) == 2
      and is_number(elem(position, 0))
      and is_number(elem(position, 1))

  def create(direction \\ :north, position \\ {0,0})
  def create(direction, _position) when not is_valid_direction(direction),
    do: {:error, "invalid direction"}

  def create(_, position) when not is_valid_position(position),
    do: {:error, "invalid position"}

  def create(direction, {x, y}), do: %{direction: direction, position: {x,y}}

  def simulate(robot, instructions) do
    cond do
      String.match?(instructions, ~r/^[LAR]+$/) == false ->
        {:error, "invalid instruction"}
      true ->
        String.graphemes(instructions)
        |> Enum.reduce(robot, fn instruction, acc ->
          case instruction do
            "L" -> turn_left(acc)
            "R" -> turn_right(acc)
            "A" -> advance(acc)
          end
        end)
    end
  end

  def advance(robot) do
    {x, y} = robot.position
    case robot.direction do
      :north -> %{robot| position: {x, y+1}}
      :south -> %{robot| position: {x, y-1}}
      :east -> %{robot| position: {x+1, y}}
      :west -> %{robot| position: {x-1, y}}
    end
  end

  def turn_left(robot) do
    case robot.direction do
      :north -> %{robot| direction: :west}
      :south -> %{robot| direction: :east}
      :east -> %{robot| direction: :north}
      :west -> %{robot| direction: :south}
    end
  end

  def turn_right(robot) do
    case robot.direction do
      :north -> %{robot| direction: :east}
      :south -> %{robot| direction: :west}
      :east -> %{robot| direction: :south}
      :west -> %{robot| direction: :north}
    end
  end

  def direction(robot) do
    robot.direction
  end

  def position(robot) do
    robot.position
  end
end
