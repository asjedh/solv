# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#first clear out categories to avoid duplicates
Category.destroy_all

categories = [
  {name: "Technology"},
  {name: "Business"},
  {name: "Policy"},
  {name: "Design"},
  {name: "Lifestyle"},
  {name: "Health"},
  {name: "Science"},
  {name: "Art, Film, and Literature"}
  ]

categories.each do |option|
  Category.find_or_create_by(option)
end
