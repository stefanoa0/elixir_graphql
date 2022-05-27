defmodule PlateStateWeb.Schema.Mutation.CreateMenuItemsTest do
  use PlateStateWeb.ConnCase, async: true

  alias PlateState.Menu

  setup do
    %{id: category_id} = insert(:category)

    {:ok, category_id: category_id, conn: build_conn()}
  end

  describe "" do
    @query """
    mutation CreateMenuItem($menuItem: MenuItemInput!) {
      createMenuItem(input: $menuItem) {
        id
        name
        description
        price
        category {
          id
        }
      }
    }
    """
    test "createMenuItem field creates an item", %{category_id: category_id, conn: conn} do
      menu_item = %{
        "name" => Faker.Dog.PtBr.name(),
        "description" => Faker.Address.En.street_address(),
        "price" => "129.90",
        "category_id" => category_id
      }

      conn =
        post(conn, "/api",
          query: @query,
          variables: %{"menuItem" => menu_item}
        )

      %{"name" => menu_name, "price" => menu_price, "description" => description} = menu_item

      assert %{
               "data" => %{
                 "createMenuItem" => %{
                   "name" => ^menu_name,
                   "description" => ^description,
                   "price" => ^menu_price,
                   "category" => %{
                     "id" => ^category_id
                   }
                 }
               }
             } = json_response(conn, 200)
    end
  end
end
