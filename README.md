# Breaking Bad API

A RESTful JSON API for the Breaking Bad TV series providing detailed data about characters, episodes, quotes, deaths, and filming locations.

## Features

- **Characters**: Complete character information including name, birthday, occupation, status, and more
- **Episodes**: Episode details with season, episode number, air date, and character appearances
- **Quotes**: Memorable quotes from the series with author attribution
- **Deaths**: Death records including cause, responsible party, and last words
- **Locations**: Filming locations with coordinates and addresses
- **Random Endpoints**: Get random quotes and episodes
- **Pagination**: All list endpoints support pagination
- **Filtering**: Filter results by various attributes
- **Swagger Documentation**: Interactive API documentation

## Tech Stack

- **Ruby**: 3.2.3
- **Rails**: 7.1.6 (API mode)
- **Database**: SQLite3
- **Testing**: RSpec with Factory Bot
- **Documentation**: Swagger/OpenAPI 3.0
- **Pagination**: Kaminari
- **CORS**: Rack CORS

## Installation

1. Clone the repository:
```bash
git clone https://github.com/imlakshay08/breaking-bad-api.git
cd breaking-bad-api
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
bundle exec rake db:create db:migrate db:seed
```

4. Start the server:
```bash
bundle exec rails server
```

The API will be available at `http://localhost:3000`

## API Endpoints

### Characters

- `GET /api/v1/characters` - List all characters
  - Query params: `page`, `per_page`, `name`, `status`, `category`
- `GET /api/v1/characters/:id` - Get a specific character

### Episodes

- `GET /api/v1/episodes` - List all episodes
  - Query params: `page`, `per_page`, `season`, `series`
- `GET /api/v1/episodes/:id` - Get a specific episode
- `GET /api/v1/episodes/random` - Get a random episode

### Quotes

- `GET /api/v1/quotes` - List all quotes
  - Query params: `page`, `per_page`, `author`, `series`
- `GET /api/v1/quotes/:id` - Get a specific quote
- `GET /api/v1/quotes/random` - Get a random quote

### Deaths

- `GET /api/v1/deaths` - List all deaths
  - Query params: `page`, `per_page`, `season`, `responsible`
- `GET /api/v1/deaths/:id` - Get a specific death

### Locations

- `GET /api/v1/locations` - List all locations
  - Query params: `page`, `per_page`, `city`, `state`
- `GET /api/v1/locations/:id` - Get a specific location

## Example Requests

### Get all characters
```bash
curl http://localhost:3000/api/v1/characters
```

### Get a random quote
```bash
curl http://localhost:3000/api/v1/quotes/random
```

### Filter characters by status
```bash
curl "http://localhost:3000/api/v1/characters?status=Alive"
```

### Get episodes from season 2
```bash
curl "http://localhost:3000/api/v1/episodes?season=2"
```

## Pagination

All list endpoints support pagination using the following query parameters:

- `page`: Page number (default: 1)
- `per_page`: Items per page (default: 10, max: 100)

Example:
```bash
curl "http://localhost:3000/api/v1/characters?page=1&per_page=5"
```

## API Documentation

Interactive Swagger documentation is available at:
```
http://localhost:3000/api-docs
```

## Testing

Run the test suite:

```bash
# All tests
bundle exec rspec

# Model tests only
bundle exec rspec spec/models

# Request tests only
bundle exec rspec spec/requests

# Integration tests
bundle exec rspec spec/integration
```

## Database Schema

### Characters
- name, birthday, occupation, img, status, nickname, appearance, portrayed, category

### Episodes
- title, season, episode, air_date, characters, series

### Quotes
- quote, author, series

### Deaths
- death, cause, responsible, last_words, season, episode, number_of_deaths

### Locations
- name, lat, lng, address, city, state, zip

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the MIT License.

## Acknowledgments

- Data sourced from the Breaking Bad TV series
- Built with Ruby on Rails
- Inspired by the need for comprehensive Breaking Bad data