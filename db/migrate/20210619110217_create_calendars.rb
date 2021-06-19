# frozen_string_literal: true

class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.references :mentor, null: false, index: true

      t.timestamps
    end
  end
end
