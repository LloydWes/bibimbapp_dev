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

# puts "Do you want to empy the assessments tables ? (y/N)"
# print ">"
# rep = STDIN.gets.chomp.downcase.strip

# if rep == 'y'
  puts "Emptying tables"
  AssessmentAnswer.destroy_all if AssessmentAnswer.count > 0
  AssessmentOption.destroy_all if AssessmentOption.count > 0
  AssessmentQuestion.destroy_all if AssessmentQuestion.count > 0
  Assessment.destroy_all if Assessment.count > 0
  puts "--> assessments tables are empty"
# end

puts "Filling levels"
Level.create!(niveau: "A1", level_description: 'NEWBIE')
Level.create!(niveau: "A2", level_description: 'ELEMENTARY')
Level.create!(niveau: "B1", level_description: 'INTERMEDIATE')
Level.create!(niveau: "B2", level_description: 'ADVANCED')
puts "--> levels has been filled"

puts "Filling users"
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  # puts "#{first_name}.#{last_name}@yopmail.com"
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@yopmail.com",
    password: "password",
    date_of_birth: Faker::Date.between(Date.today-20000, Date.today-4000),
    gender: rand(0..1) > 0 ? 'female' : 'male',
    avatar: nil,
    is_admin?: false,
    level_id: Level.all.sample.id
  )
end
puts "-->users has been filled"

puts "Creating admin"
User.create!(
  first_name: 'jean',
  last_name: 'dupont',
  email: "jean.dupont@yopmail.com",
  password: "password",
  date_of_birth: Faker::Date.between(Date.today-20000, Date.today-4000),
  gender: rand(0..1) > 0 ? 'female' : 'male',
  avatar: nil,
  is_admin?: true,
  level_id: Level.all.sample.id
)
puts '#######"Admin is jean.dupont@yopmail.com'
puts "--> Admin has been created"


puts "Filling lessons"

Lesson.create!(level: Level.all[0],
  order: 3,
  title: "Alphabet",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-sort-alpha-down-alt"
)
Lesson.create!(level: Level.all[0],
  order: 6,
  title: "Say Hi / Dire Bonjour",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-handshake"
)
Lesson.create!(level: Level.all[1],
  order: 9,
  title: "Introduce yourself / Se présenter",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-users"
)
Lesson.create!(level: Level.all[1],
  order: 12,
  title: "Apologize / S'excuser",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-pray"
)
Lesson.create!(level: Level.all[2],
  order: 15,
  title: "Work / Travailler",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-paperclip"
)
Lesson.create!(level: Level.all[2],
  order: 18,
  title: "News / Actualités",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-newspaper"
)
Lesson.create!(level: Level.all[3],
  order: 21,
  title: "Travel / Voyager",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-luggage-cart"
)
Lesson.create!(level: Level.all[3],
  order: 24,
  title: "Standpoint / Prise de positions",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-microphone"
)

puts "-->lessons has been filled"


# puts "Filling vocabularies"
# 100.times do
#   Vocabulary.create!(
#     lesson_id: Lesson.all.sample.id,
#     word: Faker::Color.color_name,
#     traduction: Faker::Color.hex_color
#   )
# end
# puts "-->vocabularies has been filled"


puts "Filling results"
score = nil
20.times do
  score = rand(5..20)
  Result.create!(
    score: rand(5..20),
    user_id: User.all.sample.id,
    lesson_id: Lesson.all.sample.id,
    date_exam: Faker::Time.between( Date.today-200, Date.today),
    is_past?: score > 15 ? true : false
  )
end
puts "-->results has been filled"

# if rep == 'y'

  puts "Filling assessments"
  5.times do
    Assessment.create!(lesson_id: Lesson.all.sample.id,
      attempt_limit: 10)
    end
    puts "-->assessments has been filled"

    puts "Filling assessment_questions"
    puts "Filling assessment_options"
    assessment_id = Assessment.first.id
    correct_letter = nil
    correct_answer = nil
    for n in (1..25)
      case rand(1..4)
      when 1
        correct_letter = 'a'
        correct_answer = Faker::Lorem.sentence(3)
      when 2
        correct_letter = 'b'
        correct_answer = Faker::Lorem.sentence(3)
      when 3
        correct_letter = 'c'
        correct_answer = Faker::Lorem.sentence(3)
      when 4
        correct_letter = 'd'
        correct_answer = Faker::Lorem.sentence(3)
      end
      AssessmentQuestion.create!(
        active: true,
        order: rand(1..10),
        level_id:Level.all.sample.id,
        question: Faker::Lorem.sentence(5) + '?',
        correct_letter: correct_letter,
        correct_answer: correct_answer,
        assessment_id: assessment_id
      )
      assessment_question_id = AssessmentQuestion.last.id
      is_triggered = false
      for i in (1..4)
        case i
        when 1
          letter = 'a'
          answer = Faker::Lorem.sentence(3)
        when 2
          letter = 'b'
          answer = Faker::Lorem.sentence(3)
        when 3
          letter = 'c'
          answer = Faker::Lorem.sentence(3)
        when 4
          letter = 'd'
          answer = Faker::Lorem.sentence(3)
        end
        if i == 4 && !is_triggered
          letter = correct_letter
        end
        if letter == correct_letter
          is_triggered = true
          answer = correct_answer
        end
        AssessmentOption.create!(
          letter: letter,
          answer: answer,
          assessment_question_id: assessment_question_id,
          assessment_id: assessment_id
        )
      end
      assessment_id += 1 if n % 5 == 0
    end
    puts "-->assessment_questions has been filled"
    puts "-->assessment_options has been filled"

  # end





  puts "Displaying tables count"
  print "Level : ", Level.count," entries\n"
  print "User : ", User.count," entries\n"
  print "Lesson : ", Lesson.count," entries\n"
  print "Vocabulary : ", Vocabulary.count," entries\n"
  print "Result : ", Result.count," entries\n"
  puts "--------Seed is done--------"
