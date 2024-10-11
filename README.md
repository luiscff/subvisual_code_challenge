# Pokémon Search Application

This is a Phoenix application that allows users to search for Pokémon by name or ID, using the [PokeAPI](https://pokeapi.co). The app displays basic information such as the Pokémon’s name, ID, and sprite. It also includes navigation buttons to allow users to move to the previous or next Pokémon.

## Features

- Search by Pokémon name or ID
- Display Pokémon name, ID, and sprite
- Navigation between Pokémon using "Previous" and "Next" buttons
- Error handling when a Pokémon is not found
- Text-based search results for incomplete Pokémon names

## Technologies Used

- **Phoenix Framework**: The backend framework used to render the interface and handle requests.
- **PokeAPI**: Public API used to fetch Pokémon data.
- **HTTPoison**: To make HTTP requests to PokeAPI.
- **Jason**: Used to parse the JSON responses from PokeAPI.

## How to Run the Project

1. Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/luiscff/pokemon_app.git

cd pokemon_app
```

## 2. Install Dependencies

To install the necessary dependencies, run:

```bash
mix setup
```
## 3. Run the Application

To start the Phoenix endpoint, run:

```bash
mix phx.server
```

or

```bash
iex -S mix phx.server
```

By default, the application will be available at http://localhost:4000 from your browser.

4. Usage

    On the homepage, you can search for a Pokémon by entering its name or ID.
    The Pokémon’s name, ID, and sprite will be displayed if found.
    You can use the "Previous" and "Next" buttons to navigate between Pokémon by their ID.

5. Tests

To run the automated tests, execute the following command:

```bash
mix test
```

# Notes

Although there is an Elixir wrapper for PokeAPI called [MaxElixirPokeApi](https://github.com/HenriqueArtur/Max-Elixir-PokeAPI) that would provide me with a more maintainable and readable way to interact with the API, I did not use it in this project. I assumed the challenge's goal was to showcase my ability to work directly with APIs and to process the data, rather than relying on a wrapper to simplify these tasks. This wrapper also provides a way to automatically cache the data, which would defeat the purpose of the "Build a caching mechanism" optional requirement (which I didn't complete).