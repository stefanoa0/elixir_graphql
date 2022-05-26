defmodule PlateStateWeb.Schema.Search do
  @moduledoc false
  use Absinthe.Schema.Notation

  alias PlateStateWeb.Resolvers.Menu

  object :search do
    field :search, list_of(:search_result) do
      arg :matching, non_null(:string)
      resolve &Menu.search/3
    end
  end

  union :search_result do
    types [:menu_item, :category]
    resolve_type(&Menu.type/2)
  end
end
