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
  title: "Se présenter/ Introduce yourself",
  script:"Bonjour, je m’appelle Alice, j’ai vingt-sept ans. J’aime bien le théâtre et la photographie. J’étudie le français pendant mon temps libre. Je suis allé deux fois en France. J’aime beaucoup les croissants.

Hello, my name is Alice, i am 27 years old. I like theater/drama and photography I study french during my free time. I have been two times in France. I really like croissants.
",
  grammar: "In French there are different ways to express what we like:
enjoy something = apprécier quelque chose. ex = i enjoy reading => j’apprécie lire.
I like = j’aime bien. ex = I like riding bike => j’aime bien faire du vélo
love = adorer. ex = i love eating => j’adore manger
be fond of = être attirer par. ex = i am fond of learning languages => je suis attiré par l’apprentissage des langues.
To be interested in = apprécier, être intéressé par. ex = I am interested in writing articles about traveling. => je suis intéressé par la rédaction d’articles sur le voyage.",
  media: "https://images.unsplash.com/photo-1545747868-8ab0d13285e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2668&q=80",
  media2: "https://images.unsplash.com/photo-1436076863939-06870fe779c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  description:"To know how to introduce yourself to other people, and talk about what you like.",
  icone: "fas fa-users"
)
Lesson.create!(level: Level.all[1],
  order: 4,
  title: "Exprimer son opinion / To express one's opinion",
  script: "Je pense que nous devons parler davantage d’écologie. Selon moi, je trouve que nous n’en parlons pas assez.
Moi aussi. A mon avis, les politiques n’en parlent pas assez.
C’est vrai. Mais j’ai l’impression que c’est en train de changer.",
  grammar:"There are different expressions to explain your point of view in french, here are the most used:
De mon point vue = from my point of view
je pense que = i think that ..
je trouve que = i find that...
j’ai l’impression que = I have the feeling that
selon moi = in my opinion
à mon avis = in my view, in my opinion
vrai = true",

  media:"https://images.unsplash.com/photo-1551845728-6820a30c64e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  media2: "https://images.pexels.com/photos/630831/pexels-photo-630831.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&w=500",
  description: "Having some vocabulary to express your opinion.",
  icone: "fas fa-microphone"
)
Lesson.create!(level: Level.all[2],
  order: 5,
  title: "Travailler / Work",
  script: "Two friends are talking about their work.
- Salut, tu travailles demain ?
- Oui. Mais ça va j’irai au boulot à quatorze heures.
- Tu as de la chance. Tu vas pouvoir faire la grasse matinée.
- Pas vraiment. Le matin je dois travailler à distance. Je dois finir d’envoyer des mails et téléphoner à des clients pour préparer la réunion de cet après-midi. Mais en fait je dois partir tôt de chez moi car il y a la grève des bus.
- Ah d’accord. Tu as quand même de la chance, car mon patron ne veut pas que je travaille à distance.
- Oui, en plus tu travailles beaucoup en ce moment.
- Beaucoup trop ! Je dois rendre un projet avant la fin de la semaine. Ensuite je pense que je vais prendre quelques jours pour me reposer. On va sans doute partir à la mer avec des collègues de bureau.
- C’est une bonne idée.",
  grammar:"The verb 'devoir'in 'Je dois rendre un projet avant la fin de la semaine' or 'Je dois finir d’envoyer des mails et téléphoner à des clients.'' is used like the verb 'I have to'.
“sans doute” is an expression to express about something you are not sure about but its close to be sure at the same time. Ex: Je viendrai sans doute à la fête ce weekend =  I will probably go to the party this weekeed.",
  media: "https://images.pexels.com/photos/1270950/pexels-photo-1270950.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&w=500",
  media2: "https://images.pexels.com/photos/313690/pexels-photo-313690.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  description:"learn more vocabulary about work",
  icone: "fas fa-paperclip"
)
Lesson.create!(level: Level.all[2],
  order: 6,
  title: "Couleur / Color",
  script:"- Ces pommes sont vertes.
- Ces pantalons sont verts
- Cette voiture est verte
- Ce crayon est vert",
  grammar:"Most adjectives in French come after the noun, unlike in English.

In the script we can see that adjectives agreement depends of the noun before. You can see that “vert “ can take different endings depending of the noun before. In French, adjectives must agree with their noun, which means that they have to show whether they are masculine or feminine and singular or plural to match the noun.

So if i want to know how end the adjective i have to first check how is the noun : if the noun is feminine i will put a “e” at the end (“verte”), if its masculine i will put nothing (“vert”), if its plural you have to put “s” at the end of adjective (verts). And if its feminine + plural you add “es” at the end (“vertes”).

Everything is good, but how can i know what is the gender of the nouns? First you can check the grammar determinant before the noun. Ex : la pomme => you see “la” so it means the gender is feminine so you can write “la pomme verte”. You added “e”.
Second, if you want to take a good habit, everytime you learn a word do not forget to learn it with determinant. If you have to learn the word “pomme” do not learn it without “la”. Like this it will be 10 times easier.

As always in french there are exceptions of the rules… :(. In two cases there are no agreement between noun and adjectives:
when the colour is described by a phrase containing two or more words (black and white, dark green, light blue)
 when the colour actually derives from a real thing like a fruit, material, animal (orange, chestnut)
Ok you did it. Even if we talk about colors and it sounds basics, the agreements are not that easy.  Don’t worry if you don’t memorize everything now, we will see it again and again in other lessons.",
  media:"https://images.pexels.com/photos/6035/healthy-apple-summer-garden.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  media2: "https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  description: "Try to learn basic colors and agreement between adjective and noun.",
  icone: "fas fa-tint"
)
Lesson.create!(level: Level.all[3],
  order: 7,
  title: "Travel / Voyager",
  script:"- Bonjour Monsieur, je souhaiterais me rendre rue Mouffetard, pourriez-vous m’indiquer la direction?
- Oui bien sûr. Il vous suffit de prendre la première à droite et puis d’aller toujours tout droit.
- Je vous remercie beaucoup. J’ai un mauvais sens de l’orientation.
- Je vous en prie.",
  grammar:  "To ask something (formal way)
'pourriez-vous' can be translated by 'Would you like to'. It is a polite way to ask something.
'je souhaiterais' / 'je voudrais' =  this is used to tell something you would like with polite way.",
  media: "https://images.pexels.com/photos/2132126/pexels-photo-2132126.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&w=500",
  media2: "https://images.pexels.com/photos/2106776/pexels-photo-2106776.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&w=500",
  description:"learn how to use vocabulary link to directions",
  icone: "fas fa-plane"
)

Lesson.create!(level: Level.all[3],
  order: 8,
  title: "Actualités / News",
  script: "Tu as entendu la dernière nouvelle ?
  Non. Que s’est-il passé ?
  Il y a eu un incendie à Bordeaux. C’est passé à la télévision.
  Comment s’est-il déclenché?
  Les journalistes ont annoncé que la police n’avait toujours pas découvert l’origine de l’incendie.
  J’espère que personne n’a été blessé.",
  grammar: "'J’espère que'  = I hope that…
  Que s’est-il passé ? = What happened ? We can say to Qu’est-il arrivé? or most common way when we talk is to say 'Qu’est ce qu’il s’est passé?'.",

  media: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80",
  media2: "https://images.unsplash.com/photo-1552641156-93ea2a5f78e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80",
  description: "learn common vocabulary link to news",
  icone: "fas fa-newspaper"
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
