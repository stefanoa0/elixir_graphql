defmodule PlateStateWeb.Schema do
  use Absinthe.Schema

  alias PlateStateWeb.Resolvers.Menu

  query do
    field :menu_items, list_of(:menu_item) do
      arg(:filter, :menu_item_filter)
      arg(:order, type: :sort_order)
      resolve(&Menu.itens/3)
    end

    field :categories, list_of(:category) do
      resolve(&Menu.categories/3)
    end
  end

  @desc "Filtering options for the menu"
  input_object :menu_item_filter do
    @desc "Matching name"
    field :name, :string

    field :category, :string

    field :tag, :string

    field :priced_above, :float

    field :priced_below, :float
  end

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
    field :price, :float
  end

  object :category do
    field :id, :id
    field :name, :string
  end
end
