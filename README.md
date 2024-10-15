# Pokémon Search Application

This is a Phoenix application that allows users to search for Pokémon by name or ID, using the [PokeAPI](https://pokeapi.co). The app displays basic information such as the Pokémon’s name, ID, and sprite. It also includes navigation buttons to allow users to move to the previous or next Pokémon when the result is a single Pokémon. When the result is a list of Pokémon, the app displays all of them without the navigation buttons.

## Features

- Search by Pokémon name or ID
- Display Pokémon name, ID, and sprite when a single result is found
- Display list of Pokémon when multiple results are found
- Navigation between Pokémon using "Previous" and "Next" buttons
- Error handling when a Pokémon is not found
- Text-based search results for incomplete Pokémon names

## (Some) Decisions Made
- The application was built using the Phoenix framework, not only because it is a robust and reliable tool for building web applications but also because it is a technology I am somewhat familiar with.
- The ID navigation buttons are forms that send a GET request to the server with the ID of the Pokémon to be displayed (either the previous or the next one). This works by simply adding the id number to the end of the same URL that is used when searching for a Pokémon by name. This was made this way because it is a simple and effective way to navigate between Pokémon. I have also considered using LiveView events to handle this, making it more responsive but I decided against it because I have never done it before and because it would probably be overkill.
- It is possible to search for pokemon ID's because it is always assumed that when the input is a number, it is an ID (useful for dealing with the navigation buttons' requests). There is, however, a downside to this: if a Pokémon has a number in its name (like "Zygarde-50" [which technically is not its name, but the keyword used to search for it in the API]), the application will treat normally when typed entirely in the search bar, but if only the number is typed, the application will treat it as an ID and try to fetch the Pokémon with that ID. While this is a very specific case, it is still a limitation that was introduced by my implementation of the navigation buttons.
- The text-based search feature was implemented by fetching all Pokémon names (actually, the keywords used to search for them in the API) and then checking if the list contains any element that contais the input string (case insensitive). I am aware that this is quite inefficient but it was the most straightforward way to implement this feature.
- The application does not have a cache mechanism. This was an optional requirement that I did not complete because I have already spent the recommended amount of time on this project.


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

## Notes

Although there is an Elixir wrapper for PokeAPI called [MaxElixirPokeApi](https://github.com/HenriqueArtur/Max-Elixir-PokeAPI) that would provide me with a more maintainable and readable way to interact with the API, I did not use it in this project. I assumed the challenge's goal was to showcase my ability to work directly with APIs and to process the data, rather than relying on a wrapper to simplify these tasks. This wrapper also provides a way to automatically cache the data, which would defeat the purpose of the "Build a caching mechanism" optional requirement (which I didn't complete).