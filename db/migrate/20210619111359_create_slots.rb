class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.references :mentor, null: false, index: true
      t.references :user, null: false, index: true
      t.references :calendar, null: false, index: true

      t.datetime :start, null: false
      t.datetime :end, null: false

      t.text :reason

      t.timestamps
    end
  end
end
