defmodule PlateStateWeb.Schema.Query.MenuItemsTest do
  use PlateStateWeb.ConnCase, async: true

  setup %{conn: conn} do
    conn = init_test_session(conn, %{})
    %{conn: conn}
  end

  describe "menuItems" do
    @query """
    {
      menuItems {
        name
      }
    }
    """
    test "returns menu items", %{conn: conn} do
      items = insert_list(3, :item)
      items_names = Enum.map(items, fn item -> %{"name" => item.name} end)

      conn = get conn, "/api", query: @query

      assert %{
               "data" => %{
                 "menuItems" => ^items_names
               }
             } = json_response(conn, 200)
    end

    @query """
    {
      menuItems {
        name
        description
      }
    }
    """
    test "returns menu items with description", %{conn: conn} do
      items = insert_list(3, :item)

      items_names =
        Enum.map(items, fn item -> %{"name" => item.name, "description" => item.description} end)

      conn = get conn, "/api", query: @query

      assert %{
               "data" => %{
                 "menuItems" => ^items_names
               }
             } = json_response(conn, 200)
    end

    test "returns menu items with matching", %{conn: conn} do
      items = insert_list(3, :item)
      %{name: name} = hd(items)

      query = """
      {
        menuItems(filter: {name: "#{name}"}) {
          name
          description
        }
      }
      """

      [item, _, _] =
        Enum.map(items, fn item -> %{"name" => item.name, "description" => item.description} end)

      conn = get conn, "/api", query: query

      assert %{
               "data" => %{
                 "menuItems" => [^item]
               }
             } = json_response(conn, 200)
    end

    test "returns menu items with order and matching", %{conn: conn} do
      items = insert_list(3, :item)

      query = """
      query {
        menuItems(order: ASC) {
          name
          description
        }
      }
      """

      items =
        items
        |> Enum.map(fn item -> %{"name" => item.name, "description" => item.description} end)
        |> Enum.sort_by(& &1["name"])

      conn = get conn, "/api", query: query

      assert %{
               "data" => %{
                 "menuItems" => ^items
               }
             } = json_response(conn, 200)
    end

    test "returns menu items without matching", %{conn: conn} do
      query = """
      {
        menuItems(filter: {name: 1234}) {
          name
          description
        }
      }
      """

      conn = get conn, "/api", query: query

      assert %{
               "errors" => [
                 %{
                   "locations" => [%{"column" => 13, "line" => 2}],
                   "message" =>
                     "Argument \"filter\" has invalid value {name: 1234}.\nIn field \"name\": Expected type \"String\", found 1234."
                 }
               ]
             } = json_response(conn, 200)
    end
  end

  describe "menuItems with variables" do
    test "returns menu items matching with variables", %{conn: conn} do
      items = insert_list(3, :item)
      %{name: name, description: description} = hd(items)

      query = """
      query ($filter: MenuItemFilter!) {
        menuItems(filter: $filter) {
          name
          description
        }
      }
      """

      conn = get conn, "/api", query: query, variables: %{filter: %{name: name}}

      assert %{
               "data" => %{
                 "menuItems" => [%{"name" => ^name, "description" => ^description}]
               }
             } = json_response(conn, 200)
    end
  end
end
