defmodule IslandsEngine.Guesses do
  alias IslandsEngine.{Coordinate, Guesses}
  @enforce_keys [:hits, :misses]
  defstruct [:hits, :misses]
  def new(), do: %Guesses{hits: MapSet.new(), misses: MapSet.new()}
  # function to add guesses
  # function should also determine if it was a hit or miss
  def add(%Guesses{} = guesses, :hit, %Coordinate{} = coordinate),
    do: update_in(guesses.hits, &MapSet.put(&1, coordinate))

  def add(%Guesses{} = guesses, :miss, %Coordinate{} = coordinate),
    do: update_in(guesses.misses, &MapSet.put(&1, coordinate))
end
