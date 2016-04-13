
namespace :import do
  desc "Generate mock volunteers. "
  task volunteers: :environment do
    num = 100

    Volunteer.destroy_all

    num.times do
      name = Faker::Name.name
      gender = Volunteer::GENDERS.sample
      race = Volunteer::RACES.sample
      age = rand(10..90)
      num_lang = rand(1..3)
      langs = (1..num_lang).map { Volunteer::LANGUAGES.sample }.uniq.join(' ')

      Volunteer.create!(
        name: name, 
        age: age, 
        languages: langs, 
        gender: gender, 
        race: race
      )

      puts "#{name}, #{gender}, #{race}, age #{age}, speaks '#{langs}'"
    end
  end

end
