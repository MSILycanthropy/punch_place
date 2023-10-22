# frozen_string_literal: true

class School < ApplicationRecord
  validates :name, presence: true

  has_many :schools_students, dependent: :destroy
  has_many :students, through: :schools_students
end
