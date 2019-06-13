require 'rake'

desc 'Add vocabulary'
namespace :test do
  task :vocabulary => :environment do
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
    puts Lesson.first
    # i = Lesson.first.id
    voc_array.each do |lesson_voc|
      lesson_voc.each do |voc_hash|
        voc_hash.each_pair do |key,value|
          # puts "*************",i,"******************"
          # Vocabulary.create(word: key, traduction: value, lesson_id: i)
        end
      end
      # i+=1
    end
  end

end
