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
  order: 1,
  title: "Say Hi / Dire Bonjour",
  script: "- Say hi to a friend
  - Salut ça va ?
  - Oui et toi ?
  - Ça va bien.",
  grammar:'Different ways to say “hi”  in French :
“Salut” : If you want to say hi to a friend you can say “Salut”,no matter what time it is, (morning, afternoon or night etc).
“Bonjour”: this one is the most use cause we can use either to a friend, a member of family or someone we don’t know well. Usually we do not use it at night.
“Bonsoir” : means like “Good evening”, we use this one to say hello at night. It is more used in formal way than to friends
“Ça va ?” : means “How’re you?” or “How’s it going?”. This expression is really used we use it more between friends or close people, if we want to use it with people we do not well we use more “Comment allez-vous ?”. “Ça va ?” is really used in daily conversation and we can use the same expression to answer. It is super easy.
 For example:
A  : - Ça va ?
B : - Ça va.
Some other way to say Ça va ? = comment vas-tu ? or comment tu vas?(this one is not really but people use it).
“Quoi de neuf ?” : means like “what’s up?”, you can use it to ask for news. Or if you don’t know what to talk about.
“Enchanté” : means like “nice to meet you”.
“Coucou” : it is a bit like “Salut”, just use it with close friend, we can translate it by “hey”.',
  media: "https://images.unsplash.com/photo-1500576992153-0271099def59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  media2: "https://images.unsplash.com/photo-1518082593638-b6e73b35d39a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1948&q=80",
  description:"Learn how to say hi to everyone if you come in France",
  icone: "fas fa-handshake",
)
Lesson.create!(level: Level.all[0],
  order: 2,
  title: "S'excuser / Apologize",
  script: "Different ways to apologize in French :

- Pardon : example : imagine you(re stuck in the subway and have to get off. It can be used when you didn’t understand something someone say but in this situation it is more polite to use 'je vous demande pardon?' than just 'pardon?'
- Je suis désolé :
- Excusez-moi
- C'est ma faute",

  grammar: "If you want to upgrade apologize you can use :

  - Je suis vraiment désolé = I’m really sorry.
  - Je suis sincèrement désolé = I’m sincerely sorry.
  - Je suis tellement désolé = I’m so sorry.
  - Je suis profondément désolé = I’m deeply sorry.

  If you want to apologize in a formal way (job for example) you can use :

  -Veuillez m'excuser, we can translate it by 'please accept my apologies'

BONUS: Between very close friends, some french people says 'déso', a shortway to say désolé. It is use for little mistakes.",
  media: "https://images.pexels.com/photos/2022077/pexels-photo-2022077.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  media2: "https://images.unsplash.com/photo-1483193722442-5422d99849bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  description:'after this lesson you will be able to apologize to any French people.',
  icone: 'fas fa-pray',
)
Lesson.create!(level: Level.all[1],
  order: 3,
  title: "Introduce yourself / Se présenter",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-users"
)
Lesson.create!(level: Level.all[1],
  order: 4,
  title: "Apologize / S'excuser",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-pray"
)
Lesson.create!(level: Level.all[2],
  order: 5,
  title: "Work / Travailler",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-paperclip"
)
Lesson.create!(level: Level.all[2],
  order: 6,
  title: "News / Actualités",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-newspaper"
)
Lesson.create!(level: Level.all[3],
  order: 7,
  title: "Travel / Voyager",
  script: Faker::Lorem.paragraph,
  grammar: Faker::Lorem.paragraph,
  media: nil,
  media2: nil,
  description: Faker::Lorem.paragraph,
  icone: "fas fa-luggage-cart"
)
Lesson.create!(level: Level.all[3],
  order: 8,
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
