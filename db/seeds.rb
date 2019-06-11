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

puts "Do you want to empy the assessments tables ? (y/N)"
print ">"
rep = STDIN.gets.chomp.downcase.strip

if rep == 'y'
  puts "Emptying tables"
  AssessmentAnswer.destroy_all if AssessmentAnswer.count > 0
  puts "--> 1"
  AssessmentOption.destroy_all if AssessmentOption.count > 0
  puts "--> 2"
  AssessmentQuestion.destroy_all if AssessmentQuestion.count > 0
  puts "--> 3"
  Assessment.destroy_all if Assessment.count > 0
  puts "--> 4"
  puts "--> assessments tables are empty"
end

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


puts "Filling lessons"

# order = 0
# 20.times do
#   order += 1
#   order = 1 if order > 15
#   Lesson.create!(level: Level.all[0],
#     order: order,
#     title: Faker::Lorem.sentence(5),
#     script: Faker::Lorem.paragraph,
#     grammar: Faker::Lorem.paragraph,
#     media: nil,
#     icone: "fas fa-sort-alpha-down-alt"
#
#   )
# end
Lesson.create!(level: Level.all[0],
  order: 3,
  title: "Alphabet",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-sort-alpha-down-alt"
)
Lesson.create!(level: Level.all[0],
  order: 6,
  title: "Say Hi / Dire Bonjour",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-handshake"
)
Lesson.create!(level: Level.all[1],
  order: 9,
  title: "Introduce yourself / Se présenter",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-users"
)
Lesson.create!(level: Level.all[1],
  order: 12,
  title: "Apologize / S'excuser",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-pray"
)
Lesson.create!(level: Level.all[2],
  order: 15,
  title: "Work / Travailler",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-paperclip"
)
Lesson.create!(level: Level.all[2],
  order: 18,
  title: "News / Actualités",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-newspaper"
)
Lesson.create!(level: Level.all[3],
  order: 21,
  title: "Travel / Voyager",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-luggage-cart"
)
Lesson.create!(level: Level.all[3],
  order: 24,
  title: "Standpoint / Prise de positions",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  icone: "fas fa-microphone"
)

puts "-->lessons has been filled"


puts "Filling vocabularies"
100.times do
  Vocabulary.create!(
    lesson_id: Lesson.all.sample.id,
    word: Faker::Color.color_name,
    traduction: Faker::Color.hex_color
  )
end
puts "-->vocabularies has been filled"


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

if rep == 'y'

  puts "Filling assessments"
  5.times do
    Assessment.create!(lesson_id: Lesson.all.sample.id,
      attempt_limit: 10)
  end
  puts "-->assessments has been filled"

  puts "Filling assessment_questions"
  20.times do
    case rand(1..4)
    when 1
      letter = 'a'
    when 2
      letter = 'b'
    when 3
      letter = 'c'
    when 4
      letter = 'd'
    end
    AssessmentQuestion.create!(
      active: true,
      order: rand(1..10),
      level_id:Level.all.sample.id,
      question: Faker::Lorem.sentence(5) + '?',
      correct_letter: letter,
      correct_answer: 'idkwid',
      assessment_id: Assessment.all.sample.id
      )
  end
  puts "-->assessment_questions has been filled"

  puts "Filling assessment_options"
  80.times do
    case rand(1..4)
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
    assess_question = AssessmentQuestion.all.sample
    AssessmentOption.create!(
      letter: letter,
      answer: answer,
      assessment_question_id: assess_question.id,
      assessment_id: assess_question.assessment.id
      )
  end
  puts "-->assessment_options has been filled"

=begin
  puts "Filling assessment_answers"
  50.times do
    case rand(1..4)
    when 1
      letter = 1
      answer = 'a'
    when 2
      letter = 2
      answer = 'b'
    when 3
      letter = 3
      answer = 'c'
    when 4
      letter = 4
      answer = 'd'
    end
    AssessmentAnswer.create!(
      letter: letter,
      answer: answer,
      correct: rand(0..1) == 1 ? true : false,
      assessment_question_id: AssessmentQuestion.all.sample.id,
      assessment_id: Assessment.all.sample.id,
      user_id: User.all.sample.id,
      attempt_number: 1
      )
  end
  puts "-->assessment_answers has been filled"
=end

end






puts "Displaying tables count"
print "Level : ", Level.count," entries\n"
print "User : ", User.count," entries\n"
print "Lesson : ", Lesson.count," entries\n"
print "Vocabulary : ", Vocabulary.count," entries\n"
print "Result : ", Result.count," entries\n"
puts "--------Seed is done--------"
