# frozen_string_literal: true

class AddActiveToStudents < ActiveRecord::Migration[7.2]
  def change
    add_column :students, :active, :boolean, default: true, null: false
  end
end
