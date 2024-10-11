defmodule PokemonApp.PokeAPI do
  @moduledoc """
  Módulo responsável por lidar com a API
  """
  @api_url "https://pokeapi.co/api/v2/pokemon/"

  @doc """
  Verifica se o Pokémon existe na API, se existir, retorna os dados do mesmo. Caso contrário, retorna um erro.
  """
  def get_pokemon(pokemon_name) do
    url = "#{@api_url}#{String.downcase(pokemon_name)}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        # Converte o JSON para um mapa. Se falhar, lança uma exceção.
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:error, _reason} ->
        {:error, :request_failed}
    end
  end

  @doc """
  Retorna uma lista com os nomes de todos os Pokémons.
  """
  def get_all_pokemon_names do
    url = "#{@api_url}?limit=1025"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        case Jason.decode(body) do
          {:ok, %{"results" => results}} ->
            # Extrai os nomes dos Pokémon
            Enum.map(results, fn %{"name" => name} -> name end)

          {:error, reason} ->
            IO.puts("Erro ao decodificar JSON: #{reason}")
            []
        end

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Erro ao fazer a requisição: #{reason}")
        []
    end
  end
end
