# frozen_string_literal: true

class Student < ApplicationRecord
  validates :name, presence: true

  has_many :schools_students, dependent: :destroy
  has_many :schools, through: :schools_students
end
