defmodule PlateState.Menu.Search do
  @moduledoc false
  import Ecto.Query

  alias PlateState.Repo

  @search_schemas [PlateState.Menu.Item, PlateState.Menu.Category]

  @spec search(String.t()) :: atom()
  def search(term) do
    pattern = "%#{term}%"
    Enum.flat_map(@search_schemas, &search_by(&1, pattern))
  end

  def search_by(schema, pattern) do
    from(
      s in schema,
      where: ilike(s.name, ^pattern) or ilike(s.description, ^pattern)
    )
    |> Repo.all()
  end
end
