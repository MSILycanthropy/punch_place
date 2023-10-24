# frozen_string_literal: true

class School < ApplicationRecord
  validates :name, presence: true

  has_many :school_students, dependent: :destroy
  has_many :students, through: :school_students
end
