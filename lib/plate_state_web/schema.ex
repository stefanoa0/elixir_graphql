defmodule PlateStateWeb.Schema do
  @moduledoc """
  Schema to GraphQL
  """
  use Absinthe.Schema

  import_types(__MODULE__.Custom.JSON)
  import_types(__MODULE__.Custom.DecimalType)
  import_types(__MODULE__.Categories)
  import_types(__MODULE__.Menus)
  import_types(__MODULE__.Tags)
  import_types(__MODULE__.Search)

  mutation do
    field :create_menu_item, :menu_item do
      arg(:input, non_null(:menu_item_input))
      resolve(&PlateStateWeb.Resolvers.Menu.create_item/3)
    end
  end

  query do
    import_fields(:menu_queries)
    import_fields(:category_queries)
    import_fields(:tag_queries)
    import_fields(:search)
  end

  enum :sort_order do
    value(:asc)
    value(:desc)
  end
end
