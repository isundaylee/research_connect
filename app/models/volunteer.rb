class Volunteer < ActiveRecord::Base
  LANGUAGES = ['English', 'Chinese', 'French', 'Italian', 'Spanish', 'German', 'Latin', 'Greek']
  GENDERS = ['Male', 'Female']
  RACES = ['Native American', 'Asian', 'African American', 'Native Hawaiian', 'White']

  def to_hash
    {
      id: id, 
      name: name, 
      gender: gender, 
      race: race, 
      age: age, 
      language: languages
    }
  end
end
