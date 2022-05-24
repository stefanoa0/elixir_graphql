defmodule PlateStateWeb.Support.Factory.ItemTag do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      def item_tag_factory do
        %PlateState.Menu.ItemTag{
          name: Faker.Pokemon.name(),
          description: Faker.Pokemon.location()
        }
      end
    end
  end
end
