# frozen_string_literal: true

class Student < ApplicationRecord
  validates :name, presence: true

  has_many :school_students, dependent: :destroy
  has_many :schools, through: :school_students
end
