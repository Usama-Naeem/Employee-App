class Experiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :employee_name
      t.date :start_date
      t.date :end_date
      t.integer :owner_id
  end
end
end
