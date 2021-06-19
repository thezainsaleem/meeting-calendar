class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas do |t|
      t.references :mentor, null: false, index: true

      t.timestamps
    end
  end
end
