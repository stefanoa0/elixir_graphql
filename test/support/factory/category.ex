defmodule PlateStateWeb.Support.Factory.Category do
  @moduledoc false

  alias Faker.Lorem.Shakespeare

  defmacro __using__(_opts) do
    quote do
      def category_factory do
        %PlateState.Menu.Category{
          name: Faker.StarWars.planet(),
          description: Shakespeare.as_you_like_it()
        }
      end
    end
  end
end
