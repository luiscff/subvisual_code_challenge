defmodule PokemonAppWeb.PageControllerTest do
  use PokemonAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Search for a Pokémon"
  end
end
