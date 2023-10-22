# frozen_string_literal: true

class CreateSchools < ActiveRecord::Migration[7.2]
  def change
    create_table :schools do |t|
      t.string :name

      t.timestamps
    end
  end
end
