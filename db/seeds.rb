# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


Rails.application.configure do
  config.action_mailer.perform_deliveries = false
  puts ""
  puts "*"*10,config.action_mailer.perform_deliveries,"*"*10
  puts ""
end

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



Rails.application.configure do
  config.action_mailer.perform_deliveries = true
  puts ""
  puts "*"*10,config.action_mailer.perform_deliveries,"*"*10
  puts ""
end


lesson1 = [
  {'salut' => 'hi'},
  {'ça va ?' => 'how are you?'},
  {'ça va' => 'I am fine'},
  {'comment allez-vous' => 'polite way to say “how are you?”'},
  {'bonjour' => 'hello'},
  {'quoi de neuf ?' => 'what’s up?'},
  {'bonsoir' => 'good evening'},
  {'coucou' => 'hey'},
  {'enchanté' => 'nice to meet you'}
]

lesson2 = [
  {'here' => 'ici'},
  {'je suis désolé' => 'I am sorry '},
  {'pardon' => 'sorry'},
  {'descendre' => 'stopget off'},
  {'metro' => 'subway'},
  {'veuillez +  verb' => 'Please + verb'},
  {'je vous demande pardon?' => 'Can you repeat please'}
]

lesson3 = [
  {'Je m’appelle' => 'my name is'},
  {'J’ai … ans' => 'I am … years old'},
  {'I like' => 'j’aime bien'},
  {'J’aime beaucoup' => 'i really like'},
  {'théâtre' => 'drama'},
  {'photography' => 'photographie'},
  {'Je suis allé en + somewhere / J’ai été en + somewhere' => 'I have been in + somewhere'},
  {'temps libre' => 'free time / spare time'},
  {'during' => 'pendant'},
  {'étudier' => 'to study'},
  {'lire' => 'to read '},
  {'manger' => 'to eat'},
  {'par' => 'by'},
  {'bien' => 'good'},
  {'voyage' => 'trip'},
  {'article' => 'article'},
  {'aimer' => 'to love (“aimer’ without the word “bien” after does not mean “to love” but “like”)'},
  {'faire' => 'do'},
  {'vélo' => 'bike'},
  {'faire du vélo' => 'to ride bike'}
]

lesson4 = [
  {'davantage' => 'more '},
  {'Moi aussi' => 'me too'},
  {'écologie' => 'ecology'},
  {'pas assez' => 'not enough'},
  {'devoir' => 'to have to'}
]

lesson5 = [
  {'travailler' => 'to work'},
  {'la grasse matinée' => 'to sleep in / to have a lie in / to sleep late'},
  {'se reposer' => 'to have a rest'},
  {'travailler à distance / télétravail' =>  'remote working == working remotely'},
  {'un/une collègue' => 'a colleague'},
  {'un bureau' => 'an office'},
  {'une idée' => 'an idea'},
  {'un patron' => 'a boss'},
  {'un boulot' => 'a job/ a grind. This is a familiar way to say a job.'},
  {'avoir de la chance' => 'to feel lucky'},
  {'prendre des jours' => 'familiar expression to say “take some days off”'},
  {'collègues de bureau' => 'coworkers'},
  {'la mer' =>  'sea'},
  {'téléphoner' => 'to call / to phone'},
  {'un projet' => 'a project'},
  {'un client' => 'a customer/ a client'},
  {'la grève' => 'you will experience that if you go in France. This means strike.'},
  {'sans doute' => 'we can translate it like ‘perhaps’ or ‘probably’ in this case. “On va sans doute partir à la mer” =  ‘We probably will go to the sea.”'},
  {'un mail / un courriel' => 'an email'},
  {'demain' => 'tomorrow'},
  {'la fin' => 'the end'},
  {'la semaine' => 'the week'},
  {'venir' => 'to come'},
  {'après-midi' => 'afternoon'},
  {'une réunion' => 'meeting'}
]

lesson6=[
  {'rouge' => 'red'},
  {'bleu' => 'bleu'},
  {'vert' => 'green'},
  {'jaune' => 'yellow'},
  {'orange' => 'orange'},
  {'marron' => 'brown'},
  {'un pantalon' => 'pant'},
  {'une voiture' => 'car'},
  {'un crayon' => 'pen'}
]

lesson7=[
  {'Indiquer' => 'to indicate / to tell'},
  {'pouvoir' => 'to can'},
  {"un mauvais sens de l’orientation" => "a bad sens of direction"}
]

lesson8 = [
  {'une nouvelle' => 'news'},
  {'un incendie' => 'fire'},
  {'blessé' => 'to be hurt / injured'},
  {'un journaliste' => 'a reporter'},
  {'découvert' => 'discovered'},
  {'personne' => 'nobody'},
  {'une personne' => 'someone'}
]

voc_array = Array.new()
voc_array << lesson1
voc_array << lesson2
voc_array << lesson3
voc_array << lesson4
voc_array << lesson5
voc_array << lesson6
voc_array << lesson7
voc_array << lesson8

voc_array.each do |lesson_voc|
  lesson_voc.each do |voc_hash|
    voc_hash.each_pair do |key,value|
      Vocabulary.create(word: key, traduction: value, lesson: Lesson.all.sample)
    end
  end
end
