defmodule PlateStateWeb.Support.Factory.Category do
  defmacro __using__(_opts) do
    quote do
      def category_factory do
        %PlateState.Menu.Category{
          name: Faker.StarWars.planet(),
          description: Faker.Lorem.Shakespeare.as_you_like_it()
        }
      end
    end
  end
end
