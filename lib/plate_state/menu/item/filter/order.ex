defmodule PlateState.Menu.Item.Order do
  import Ecto.Query

  def sort(order, item) do
    order(order, item)
  end

  def order(nil, query), do: query

  def order(order, query) do
    order_by(query, [q], {^order, :name})
  end
end
