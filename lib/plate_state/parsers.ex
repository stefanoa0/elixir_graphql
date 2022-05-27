defmodule PlateState.Parsers do
  @moduledoc """
  Doc
  """
  alias PlateState.Helpers.List, as: ListHelper

  @default_args [:rules]
  def pivot_entity(entity, args \\ @default_args)

  def pivot_entity(entities, args) when is_list(entities) do
    Enum.map(entities, &pivot_entity(&1, args))
  end

  def pivot_entity(entity, args) do
    var =
      args
      |> Enum.map(fn arg ->
        key = Map.get(entity, arg)
        {arg, ListHelper.to_map(key)}
      end)
      |> Enum.into(%{})

    Map.merge(entity, var)
  end
end
