# frozen_string_literal: true

class CreateJoinTableSchoolsStudents < ActiveRecord::Migration[7.2]
  def change
    create_join_table :schools, :students do |t|
      t.index %i[school_id student_id], unique: true
      t.index %i[student_id school_id], unique: true
    end
  end
end
