defmodule PlateStateWeb.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: PlateState.Repo

  use PlateStateWeb.Support.Factory.Category
  use PlateStateWeb.Support.Factory.ItemTag
  use PlateStateWeb.Support.Factory.Item
end
