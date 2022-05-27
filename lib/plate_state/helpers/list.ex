defmodule PlateState.Helper.List do
  @moduledoc """
    ListHelper is responsible to parse lists to another types
  """
  alias PlateState.Helpers.Type

  @doc """
    iex> to_map([%{name: "rule", value: "value"}])
    %{
      "rule" => "value"
    }
  """
  def to_map(list) do
    list
    |> Enum.map(&parse/1)
    |> Enum.into(%{})
  end

  defp parse(%{name: name, value: value, type: type}) do
    {name, Type.string_to(value, type)}
  end

  defp parse(%{name: name, value: value}) do
    {name, value}
  end
end
