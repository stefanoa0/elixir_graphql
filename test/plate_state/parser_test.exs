defmodule PlateState.ParsersTest do
  use PlateState.DataCase, async: true

  alias PlateState.Parsers, as: EntityParser

  describe "pivot_entity/2" do
    test "list to map" do
      entity = %{name: "bla", rules: [%{name: "max_km", value: "100"}]}
      assert %{
        name: "bla",
        rules: %{"max_km" => "100"}
        } = EntityParser.pivot_entity(entity) |> IO.inspect()
    end

    test "list to map - many elems" do
      service = %{
        name: "bla",
        rules: [
          %{name: "max_km", value: "100", type: "integer"},
          %{name: "max_cv", value: "140", type: "integer"},
          %{name: "nivel", value: "5", type: "integer"},
          %{name: "acceleration", value: "7.4", type: "float"}
        ]
      }

      assert %{
        name: "bla",
        rules: %{
          "max_km" => 100,
          "acceleration" => 7.4,
          "max_cv" => 140,
          "nivel" => 5
        }
      } == EntityParser.pivot_entity(service)
    end

    test "list to map - many columns" do
      service = %{
        name: "bla",
        rules: [
          %{name: "max_km", value: "100", type: "integer"},
          %{name: "max_cv", value: "140", type: "integer"},
          %{name: "nivel", value: "5", type: "integer"},
          %{name: "acceleration", value: "7.4", type: "float"}
        ],
        preferences: [
          %{name: "max_km", value: "10", type: "integer"},
          %{name: "max_cv", value: "12", type: "integer"},
          %{name: "nivel", value: "3", type: "integer"},
          %{name: "acceleration", value: "5.4", type: "float"}
        ]
      }

      assert %{
        name: "bla",
        rules: %{
          "max_km" => 100,
          "acceleration" => 7.4,
          "max_cv" => 140,
          "nivel" => 5
        },
        preferences: %{
          "max_km" => 10,
          "acceleration" => 5.4,
          "max_cv" => 12,
          "nivel" => 3
        }
      } == EntityParser.pivot_entity(service, [:rules, :preferences])
    end
  end
end
