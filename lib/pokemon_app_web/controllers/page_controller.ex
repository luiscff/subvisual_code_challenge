defmodule PokemonAppWeb.PageController do
  use PokemonAppWeb, :controller
  alias PokemonApp.PokeAPI

  def home(conn, %{"pokemon" => pokemon_name}) do
    case PokeAPI.get_pokemon(pokemon_name) do
      {:ok, pokemon_data} ->
        conn |>
        render(:home, pokemon: pokemon_data)

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Pokémon not found")
        |> render(:home, pokemon: nil)
    end
  end

  def home(conn, _params) do
    # Lida com o caso em que o parâmetro pokemon não está presente
    render(conn, :home, pokemon: nil)
  end
end
