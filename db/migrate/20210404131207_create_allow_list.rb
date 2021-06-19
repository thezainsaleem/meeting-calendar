# frozen_string_literal: true

class CreateAllowList < ActiveRecord::Migration[5.2]
  def change
    create_table :allowlisted_jwts do |t|
      t.string :jti, null: false
      t.string :aud # , null: false
      # If you want to leverage the `aud` claim, add to it a `NOT NULL` constraint:
      # t.string :aud, null: false
      t.datetime :exp, null: false
      t.references :user, foreign_key: { on_delete: :cascade }, null: false
    end

    add_index :allowlisted_jwts, :jti, unique: true
  end
end
