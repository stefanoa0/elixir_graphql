defmodule PlateStateWeb.Schema.Tags do
  @moduledoc """
  Schema to get tags types
  """
  use Absinthe.Schema.Notation

  alias PlateStateWeb.Resolvers.Menu

  @desc "Filtering options for the menu item list"
  input_object :tags_filter do
    @desc "Matching Category name"
    field :tags, :string
  end

  object :tag_queries do
    field :tags, list_of(:tag) do
      resolve(&Menu.tags/3)
    end
  end

  object :tag do
    field :id, :id
    field :name, :string
  end
end
