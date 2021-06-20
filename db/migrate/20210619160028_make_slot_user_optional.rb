class MakeSlotUserOptional < ActiveRecord::Migration[5.2]
  def change
    change_column :slots, :user_id, :string, null: true
  end
end
