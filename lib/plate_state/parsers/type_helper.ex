defmodule PlateState.Parsers.TypeHelper do

  @spec string_to(String.t(), String.t()) :: any()
  def string_to(value, type \\ "string")

  def string_to(value, "string"), do: value
  def string_to(value, "integer"), do: String.to_integer(value)

  def string_to(value, "float"), do: String.to_float(value)
  def string_to(value, "list"), do: String.split(value, ",")
end
