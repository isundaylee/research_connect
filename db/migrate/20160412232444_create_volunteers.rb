class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.integer :age
      t.text :languages
      t.string :gender
      t.string :race

      t.timestamps null: false
    end
  end
end
