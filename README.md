# Rails Mini Project

## Objectives

1. Build a small Rails project
2. Be able to create basic models, migrations, controllers, and views

## Instructions

For this mini project, you'll create a small Rails app. The topic is open-ended.
You could build a small recipe app, or a todo list, or even a small blogging
platform.

### Requirements

- Have at least 3 distinct models
- There should be at least one many-to-many relationship
- Create seed data

### Bonus

- Hit at least 1 API

For example: use the [rest-client](https://github.com/rest-client/rest-client) gem to access data from an API like the [Pokemon API](https://pokeapi.co/), and use the API to seed your data:

```rb
# db/seeds.rb
require 'rest-client'
require 'json'

def get_pokemon(id)
  response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{id}")
  JSON.parse(response)
end

pikachu_data = get_pokemon(1)
Pokemon.create(name: pikachu_data["name"], image: pikachu_data["sprites"]["front_default"])

ivysaur_data = get_pokemon(2)
Pokemon.create(name: ivysaur_data["name"], image: ivysaur_data["sprites"]["front_default"])
```

Here's a [list of public APIs](https://github.com/public-apis/public-apis) you
can explore for data. Avoid using any APIs that require authentication for a
simple project like this!

### Ultra Bonus

- Write model tests
- Practice refactoring
- Make it pretty with Bootstrap or Materialize (look into the
  [Rails Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html))
