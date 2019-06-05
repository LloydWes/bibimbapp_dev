# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Emptying tables"
Result.destroy_all
Vocabulary.destroy_all
Lesson.destroy_all
User.destroy_all
Level.destroy_all
puts "--> All tables are empty"

puts "Filling levels"
Level.create!(niveau: "A1")
Level.create!(niveau: "A2")
Level.create!(niveau: "B1")
Level.create!(niveau: "B2")
puts "--> levels has been filled"

puts "Filling users"
10.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(first_name: first_name, 
    last_name: last_name, 
    email: "#{first_name}.#{last_name}@yopmail.com", 
    password: "password", 
    date_of_birth: Faker::Date.between(Date.today-20000, Date.today-4000),
    gender: rand(0..1) > 0 ? 'Female' : 'Male',
    avatar: nil,
    is_admin?: false,
    level_id: Level.all.sample.id
    )
end
puts "-->users has been filled"


puts "Filling lessons"
  order = 0
20.times do
  order += 1
  order = 1 if order > 15
  Lesson.create!(level_id: Level.all.sample.id,
                  order: order,
                  title: Faker::Lorem.sentence(5),
                  script: Faker::Lorem.paragraph,
                  grammar: Faker::Lorem.paragraph,
                  media: nil,

                  )
end
puts "-->lessons has been filled"


puts "Filling vocabularies"
100.times do
  Vocabulary.create!(lesson_id: Lesson.all.sample.id,
                    word: Faker::Color.color_name,
                    traduction: Faker::Color.hex_color
                    )
end
puts "-->vocabularies has been filled"


puts "Filling results"
score = nil
20.times do
  score = rand(5..20)
  Result.create!(score: rand(5..20),
                user_id: User.all.sample.id,
                lesson_id: Lesson.all.sample.id,
                date_exam: Faker::Time.between( Date.today-200, Date.today),
                is_past?: score > 15 ? true : false
                )
end
puts "-->results has been filled"

puts "Displaying tables count"
print "Level : ", Level.count," entries\n"
print "User : ", User.count," entries\n"
print "Lesson : ", Lesson.count," entries\n"
print "Vocabulary : ", Vocabulary.count," entries\n"
print "Result : ", Result.count," entries\n"
puts "--------Seed is done--------"