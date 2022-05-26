defmodule PlateStateWeb.Schema.Menus do
  @moduledoc """
  Schema to get menu types
  """
  use Absinthe.Schema.Notation

  alias PlateStateWeb.Resolvers.Menu

  @desc "Filtering options for the menu item list"
  input_object :menu_item_filter do
    @desc "Matching Item name"
    field :name, :string

    @desc "Matching Category"
    field :category, :string

    @desc "Matching tags"
    field :tag, :string

    @desc "Matching price above"
    field :priced_above, :float

    @desc "Matching price below"
    field :priced_below, :float
  end

  object :menu_queries do
    field :menu_items, list_of(:menu_item) do
      arg(:filter, :menu_item_filter)
      arg(:order, type: :sort_order)
      resolve(&Menu.itens/3)
    end
  end

  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
    field :price, :float
    field :rules, :json

    field :category, :category do
      resolve(&Menu.item_category/3)
    end

    field :tags, list_of(:tag) do
      resolve(&Menu.item_tags/3)
    end
  end
end
