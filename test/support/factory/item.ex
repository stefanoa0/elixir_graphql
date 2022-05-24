defmodule PlateStateWeb.Support.Factory.Item do
  defmacro __using__(_opts) do
    quote do
      def item_factory do
        %PlateState.Menu.Item{
          added_on: Date.utc_today(),
          description: Faker.Superhero.En.descriptor(),
          name: Faker.Superhero.En.name(),
          price: 112.13,
          category: insert(:category),
          tags: [insert(:item_tag), insert(:item_tag)]
        }
      end
    end
  end
end
