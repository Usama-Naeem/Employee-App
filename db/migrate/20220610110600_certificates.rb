class Certificates < ActiveRecord::Migration[6.1]
  def change
    create_table :certificates do |t|
      t.string :title
      t.date :expiration_date
      t.integer :owner_id
    

      t.timestamps
    end
  end
end
