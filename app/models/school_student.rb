# frozen_string_literal: true

class SchoolStudent < ApplicationRecord
  belongs_to :school
  belongs_to :student
end
