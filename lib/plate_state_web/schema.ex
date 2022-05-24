defmodule PlateStateWeb.Schema do
  @moduledoc """
  Schema to GraphQL
  """
  use Absinthe.Schema

  import_types(__MODULE__.Categories)
  import_types(__MODULE__.Menus)
  import_types(__MODULE__.Tags)

  query do
    import_fields(:menu_queries)
    import_fields(:category_queries)
    import_fields(:tag_queries)
  end

  enum :sort_order do
    value(:asc)
    value(:desc)
  end
end
