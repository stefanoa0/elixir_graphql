defmodule PlateState.Parsers.ListHelperTest do
  use PlateState.DataCase, async: true

  alias PlateState.Parsers.ListHelper

  describe "to_map/1" do
    test "list to map" do
      assert %{"max_km" => 100} =
               ListHelper.to_map([%{name: "max_km", value: "100", type: "integer"}])
    end

    test "list to map - many elems" do
      list = [
        %{name: "max_km", value: "100", type: "integer"},
        %{name: "max_cv", value: "140", type: "integer"},
        %{name: "nivel", value: "5", type: "integer"},
        %{name: "acceleration", value: "7.4", type: "float"}
      ]

      assert %{
               "max_km" => 100,
               "acceleration" => 7.4,
               "max_cv" => 140,
               "nivel" => 5
             } == ListHelper.to_map(list)
    end
  end
end
