defmodule PlateStateWeb.Schema.Categories do
  @moduledoc """
  Schema to get category types
  """
  use Absinthe.Schema.Notation

  alias PlateStateWeb.Resolvers.Menu

  @desc "Filtering options for the menu item list"
  input_object :category_filter do
    @desc "Matching Category name"
    field :name, :string
  end

  object :category_queries do
    field :categories, list_of(:category) do
      resolve(&Menu.categories/3)
    end
  end

  object :category do
    field :id, :id
    field :name, :string
    field :description, :string
  end
end
