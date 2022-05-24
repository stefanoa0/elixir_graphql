defmodule PlateStateWeb.Resolvers.Menu do
  @moduledoc """
  Resolver to get menu filters
  """
  alias PlateState.Menu

  def itens(_, args, _) do
    {:ok, Menu.list_items(args)}
  end

  def item_category(item, _, _) do
    {:ok, Menu.list_items_category(item)}
  end

  def item_tags(item, _, _) do
    {:ok, Menu.list_item_tags(item)}
  end

  def categories(_, _, _) do
    {:ok, Menu.list_categories()}
  end

  def tags(_, _, _) do
    {:ok, Menu.list_tags()}
  end
end
