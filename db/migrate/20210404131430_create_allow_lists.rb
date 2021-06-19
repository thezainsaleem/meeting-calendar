class CreateAllowLists < ActiveRecord::Migration[5.2]
  def change
    create_table :allow_lists do |t|

      t.timestamps
    end
  end
end
