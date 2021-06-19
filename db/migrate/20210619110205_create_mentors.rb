class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :name, null: false
      t.string :time_zone, null: false

      t.timestamps
    end
  end
end
