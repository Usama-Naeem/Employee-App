class Educations < ActiveRecord::Migration[6.1]
  def change
      create_table :educations do |t|
        t.string :degree_title
        t.date :start_year
        t.date :end_year
        t.integer :owner_id
  
        t.timestamps
      end
  end
end
