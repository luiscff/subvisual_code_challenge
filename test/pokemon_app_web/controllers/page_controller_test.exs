defmodule PokemonAppWeb.PageControllerTest do
  use PokemonAppWeb.ConnCase
  use ExUnit.Case

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Search for a Pokémon"
  end

  test "GET / with a Pokémon name", %{conn: conn} do
    conn = get(conn, ~p"/?pokemon=pikachu")
    assert html_response(conn, 200) =~ "pikachu"
  end

  test "clicking previous button navigates to previous pokemon", %{conn: conn} do
    # Primeira requisição: mostra o Pokémon com ID 2
    conn = get(conn, ~p"/?pokemon=2")
    assert html_response(conn, 200) =~ "Id: 2"

    # Segunda requisição: simula clicar no botão Previous e verifica o Pokémon anterior
    conn = get(conn, ~p"/?pokemon=1")
    assert html_response(conn, 200) =~ "Id: 1"
  end
end
