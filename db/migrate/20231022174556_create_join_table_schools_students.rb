# frozen_string_literal: true

class CreateJoinTableSchoolsStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :school_students do |t|
      t.references :school, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.timestamps

      t.index %i[school_id student_id], unique: true
      t.index %i[student_id school_id], unique: true
    end
  end
end
