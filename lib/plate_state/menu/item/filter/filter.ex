defmodule PlateState.Menu.Item.Filter do
  @moduledoc false
  import Ecto.Query

  @spec filter(Map.t(), atom()) :: atom()
  def filter(filters, item) do
    filters
    |> Enum.reduce(item, &filter_item/2)
  end

  def filter_item(nil, query), do: query

  def filter_item({_, nil}, query), do: query

  def filter_item({:name, name}, query) do
    where(query, [q], ilike(q.name, ^"%#{name}%"))
  end

  def filter_item({:priced_above, priced_above}, query) do
    where(query, [q], q.price >= ^priced_above)
  end

  def filter_item({:priced_below, priced_below}, query) do
    where(query, [q], q.price <= ^priced_below)
  end

  def filter_item({:tag, tag}, query) do
    from q in query,
      join: t in assoc(q, :tags),
      where: ilike(t.name, ^"%#{tag}%")
  end

  def filter_item({:category, name}, query) do
    from q in query,
      join: c in assoc(q, :category),
      where: ilike(c.name, ^"%#{name}%")
  end
end
