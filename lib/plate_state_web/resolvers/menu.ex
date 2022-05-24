defmodule PlateStateWeb.Resolvers.Menu do
  alias PlateState.Menu

  def itens(_, args, _) do
    {:ok, Menu.list_items(args)}
  end

  def categories(_, _, _) do
    {:ok, Menu.list_categories()}
  end
end
