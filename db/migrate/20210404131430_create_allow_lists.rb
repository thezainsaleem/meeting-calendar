# frozen_string_literal: true

class CreateAllowLists < ActiveRecord::Migration[5.2]
  def change
    create_table :allow_lists, &:timestamps
  end
end
