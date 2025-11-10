# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
puts "Clearing existing data..."
Character.destroy_all
Episode.destroy_all
Quote.destroy_all
Death.destroy_all
Location.destroy_all

puts "Creating characters..."
characters_data = [
  {
    name: "Walter White",
    birthday: Date.parse("1958-09-07"),
    occupation: ["High School Chemistry Teacher", "Meth King Pin"],
    img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
    status: "Deceased",
    nickname: "Heisenberg",
    appearance: [1, 2, 3, 4, 5],
    portrayed: "Bryan Cranston",
    category: "Breaking Bad"
  },
  {
    name: "Jesse Pinkman",
    birthday: Date.parse("1984-09-24"),
    occupation: ["Meth Dealer"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg",
    status: "Alive",
    nickname: "Cap n' Cook",
    appearance: [1, 2, 3, 4, 5],
    portrayed: "Aaron Paul",
    category: "Breaking Bad"
  },
  {
    name: "Skyler White",
    birthday: Date.parse("1970-08-11"),
    occupation: ["House wife", "Book Keeper", "Car Wash Manager", "Taxi Dispatcher"],
    img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg",
    status: "Alive",
    nickname: "Sky",
    appearance: [1, 2, 3, 4, 5],
    portrayed: "Anna Gunn",
    category: "Breaking Bad"
  },
  {
    name: "Hank Schrader",
    birthday: Date.parse("1966-03-10"),
    occupation: ["DEA Agent"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/HankS5.jpg",
    status: "Deceased",
    nickname: "ASAC Schrader",
    appearance: [1, 2, 3, 4, 5],
    portrayed: "Dean Norris",
    category: "Breaking Bad"
  },
  {
    name: "Saul Goodman",
    birthday: Date.parse("1960-11-12"),
    occupation: ["Lawyer"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/1/16/SaulS5.jpg",
    status: "Alive",
    nickname: "Jimmy McGill",
    appearance: [2, 3, 4, 5],
    portrayed: "Bob Odenkirk",
    category: "Breaking Bad, Better Call Saul"
  },
  {
    name: "Mike Ehrmantraut",
    birthday: Date.parse("1944-09-30"),
    occupation: ["Former Cop", "Private Investigator", "Hitman"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/e/e7/MikeS5.jpg",
    status: "Deceased",
    nickname: "Mike",
    appearance: [2, 3, 4, 5],
    portrayed: "Jonathan Banks",
    category: "Breaking Bad, Better Call Saul"
  },
  {
    name: "Gus Fring",
    birthday: Date.parse("1958-04-26"),
    occupation: ["Drug Kingpin", "Los Pollos Hermanos Owner"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/3/3f/GustavoFring.jpg",
    status: "Deceased",
    nickname: "The Chicken Man",
    appearance: [2, 3, 4, 5],
    portrayed: "Giancarlo Esposito",
    category: "Breaking Bad, Better Call Saul"
  },
  {
    name: "Marie Schrader",
    birthday: Date.parse("1972-04-15"),
    occupation: ["Radiologic Technologist"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/1/10/S5MarieSchrader.jpg",
    status: "Alive",
    nickname: "Marie",
    appearance: [1, 2, 3, 4, 5],
    portrayed: "Betsy Brandt",
    category: "Breaking Bad"
  },
  {
    name: "Walter White Jr.",
    birthday: Date.parse("1993-07-08"),
    occupation: ["High School Student"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/7/78/WalterWhiteJr.jpg",
    status: "Alive",
    nickname: "Flynn",
    appearance: [1, 2, 3, 4, 5],
    portrayed: "RJ Mitte",
    category: "Breaking Bad"
  },
  {
    name: "Tuco Salamanca",
    birthday: Date.parse("1972-07-05"),
    occupation: ["Meth Distributor"],
    img: "https://vignette.wikia.nocookie.net/breakingbad/images/a/a7/Tuco_BCS.jpg",
    status: "Deceased",
    nickname: "Tuco",
    appearance: [1, 2],
    portrayed: "Raymond Cruz",
    category: "Breaking Bad, Better Call Saul"
  }
]

characters_data.each do |char_data|
  Character.create!(char_data)
end

puts "Creating episodes..."
episodes_data = [
  { title: "Pilot", season: 1, episode: 1, air_date: Date.parse("2008-01-20"), characters: ["Walter White", "Jesse Pinkman", "Skyler White"], series: "Breaking Bad" },
  { title: "Cat's in the Bag...", season: 1, episode: 2, air_date: Date.parse("2008-01-27"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "...And the Bag's in the River", season: 1, episode: 3, air_date: Date.parse("2008-02-10"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Cancer Man", season: 1, episode: 4, air_date: Date.parse("2008-02-17"), characters: ["Walter White", "Skyler White"], series: "Breaking Bad" },
  { title: "Gray Matter", season: 1, episode: 5, air_date: Date.parse("2008-02-24"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Crazy Handful of Nothin'", season: 1, episode: 6, air_date: Date.parse("2008-03-02"), characters: ["Walter White", "Jesse Pinkman", "Tuco Salamanca"], series: "Breaking Bad" },
  { title: "A No-Rough-Stuff-Type Deal", season: 1, episode: 7, air_date: Date.parse("2008-03-09"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Seven Thirty-Seven", season: 2, episode: 1, air_date: Date.parse("2009-03-08"), characters: ["Walter White", "Jesse Pinkman", "Tuco Salamanca"], series: "Breaking Bad" },
  { title: "Grilled", season: 2, episode: 2, air_date: Date.parse("2009-03-15"), characters: ["Walter White", "Jesse Pinkman", "Hank Schrader"], series: "Breaking Bad" },
  { title: "Bit by a Dead Bee", season: 2, episode: 3, air_date: Date.parse("2009-03-22"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Down", season: 2, episode: 4, air_date: Date.parse("2009-03-29"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Breakage", season: 2, episode: 5, air_date: Date.parse("2009-04-05"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Peekaboo", season: 2, episode: 6, air_date: Date.parse("2009-04-12"), characters: ["Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Negro y Azul", season: 2, episode: 7, air_date: Date.parse("2009-04-19"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Better Call Saul", season: 2, episode: 8, air_date: Date.parse("2009-04-26"), characters: ["Walter White", "Jesse Pinkman", "Saul Goodman"], series: "Breaking Bad" },
  { title: "4 Days Out", season: 2, episode: 9, air_date: Date.parse("2009-05-03"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "Over", season: 2, episode: 10, air_date: Date.parse("2009-05-10"), characters: ["Walter White", "Skyler White"], series: "Breaking Bad" },
  { title: "Mandala", season: 2, episode: 11, air_date: Date.parse("2009-05-17"), characters: ["Walter White", "Jesse Pinkman", "Gus Fring"], series: "Breaking Bad" },
  { title: "Phoenix", season: 2, episode: 12, air_date: Date.parse("2009-05-24"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" },
  { title: "ABQ", season: 2, episode: 13, air_date: Date.parse("2009-05-31"), characters: ["Walter White", "Jesse Pinkman"], series: "Breaking Bad" }
]

episodes_data.each do |ep_data|
  Episode.create!(ep_data)
end

puts "Creating quotes..."
quotes_data = [
  { quote: "I am not in danger, Skyler. I am the danger. A guy opens his door and gets shot, and you think that of me? No! I am the one who knocks!", author: "Walter White", series: "Breaking Bad" },
  { quote: "Yeah, science!", author: "Jesse Pinkman", series: "Breaking Bad" },
  { quote: "I did it for me. I liked it. I was good at it. And I was really...I was alive.", author: "Walter White", series: "Breaking Bad" },
  { quote: "Say my name.", author: "Walter White", series: "Breaking Bad" },
  { quote: "Heisenberg", author: "Declan", series: "Breaking Bad" },
  { quote: "You're goddamn right.", author: "Walter White", series: "Breaking Bad" },
  { quote: "Yo, Mr. White!", author: "Jesse Pinkman", series: "Breaking Bad" },
  { quote: "I won.", author: "Walter White", series: "Breaking Bad" },
  { quote: "Tight, tight, tight!", author: "Tuco Salamanca", series: "Breaking Bad" },
  { quote: "Better call Saul!", author: "Jesse Pinkman", series: "Breaking Bad" },
  { quote: "If you don't know who I am, then maybe your best course would be to tread lightly.", author: "Walter White", series: "Breaking Bad" },
  { quote: "No more half-measures, Walter.", author: "Mike Ehrmantraut", series: "Breaking Bad" },
  { quote: "I am the danger.", author: "Walter White", series: "Breaking Bad" },
  { quote: "We're done when I say we're done.", author: "Walter White", series: "Breaking Bad" },
  { quote: "Gatorade me, bitch!", author: "Jesse Pinkman", series: "Breaking Bad" }
]

quotes_data.each do |quote_data|
  Quote.create!(quote_data)
end

puts "Creating deaths..."
deaths_data = [
  { death: "Emilio Koyama", cause: "Poisoned by phosphine gas", responsible: "Walter White", last_words: "Unknown", season: 1, episode: 1, number_of_deaths: 1 },
  { death: "Krazy-8", cause: "Strangled with a bike lock", responsible: "Walter White", last_words: "Walter...", season: 1, episode: 3, number_of_deaths: 1 },
  { death: "Tuco Salamanca", cause: "Shot by Hank Schrader", responsible: "Hank Schrader", last_words: "You're done!", season: 2, episode: 2, number_of_deaths: 1 },
  { death: "Jane Margolis", cause: "Choked on her own vomit", responsible: "Walter White (indirectly)", last_words: "Unknown", season: 2, episode: 12, number_of_deaths: 1 },
  { death: "Gus Fring", cause: "Bomb explosion", responsible: "Walter White", last_words: "None", season: 4, episode: 13, number_of_deaths: 1 },
  { death: "Mike Ehrmantraut", cause: "Shot by Walter White", responsible: "Walter White", last_words: "Shut the fuck up and let me die in peace.", season: 5, episode: 7, number_of_deaths: 1 },
  { death: "Hank Schrader", cause: "Shot by Jack Welker", responsible: "Jack Welker", last_words: "My name is ASAC Schrader, and you can go fuck yourself.", season: 5, episode: 14, number_of_deaths: 1 },
  { death: "Walter White", cause: "Gunshot wound", responsible: "Self (indirectly)", last_words: "None", season: 5, episode: 16, number_of_deaths: 1 }
]

deaths_data.each do |death_data|
  Death.create!(death_data)
end

puts "Creating locations..."
locations_data = [
  { name: "Walter White's House", lat: 35.126426, lng: -106.536509, address: "3828 Piermont Dr NE", city: "Albuquerque", state: "New Mexico", zip: "87111" },
  { name: "Jesse Pinkman's House", lat: 35.072933, lng: -106.617721, address: "322 16th St SW", city: "Albuquerque", state: "New Mexico", zip: "87104" },
  { name: "Los Pollos Hermanos", lat: 35.063287, lng: -106.604587, address: "4257 Isleta Blvd SW", city: "Albuquerque", state: "New Mexico", zip: "87105" },
  { name: "Saul Goodman's Office", lat: 35.126764, lng: -106.536509, address: "9800 Montgomery Blvd NE", city: "Albuquerque", state: "New Mexico", zip: "87111" },
  { name: "A1A Car Wash", lat: 35.109534, lng: -106.621986, address: "9516 Snow Heights Cir NE", city: "Albuquerque", state: "New Mexico", zip: "87112" },
  { name: "The Superlab", lat: 35.054527, lng: -106.566528, address: "Unknown", city: "Albuquerque", state: "New Mexico", zip: "Unknown" }
]

locations_data.each do |location_data|
  Location.create!(location_data)
end

puts "Seed data created successfully!"
puts "Characters: #{Character.count}"
puts "Episodes: #{Episode.count}"
puts "Quotes: #{Quote.count}"
puts "Deaths: #{Death.count}"
puts "Locations: #{Location.count}"
