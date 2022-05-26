defmodule PlateState.Parsers.ListHelper do
@moduledoc """
  ListHelper is responsible to parse lists to another types
"""
alias PlateState.Parsers.TypeHelper

  @doc """
    to_map([])


  """
  def to_map(list) do
    list
    |> Enum.map(&parse/1)
    |> Enum.into(%{})
  end

  defp parse(%{name: name, value: value, type: type}) do
    {name, TypeHelper.string_to(value, type)}
  end

  defp parse(%{name: name, value: value}) do
    {name, value}
  end
end
