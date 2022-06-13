class Skills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :title
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
