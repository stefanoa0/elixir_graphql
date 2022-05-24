# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PlateState.Repo.insert!(%PlateState.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

category =
  PlateState.Repo.insert!(%PlateState.Menu.Category{
    description: "Automobiles with 4 tires",
    name: "Cars"
  })

audi_tag =
  PlateState.Repo.insert!(%PlateState.Menu.ItemTag{
    description: "Audi Cars",
    name: "Audi"
  })

audi_a8 =
  PlateState.Repo.insert!(%PlateState.Menu.Item{
    name: "Audi A8",
    description: "3.0 gasolina injeção direta",
    price: 355_378.00,
    category_id: category.id,
    tags: [audi_tag]
  })

audi_a3 =
  PlateState.Repo.insert!(%PlateState.Menu.Item{
    name: "Audi A3",
    description: "3.0 gasolina injeção direta",
    price: 284_990.00,
    category_id: category.id,
    tags: [audi_tag]
  })
