# frozen_string_literal: true

class SchoolsStudent < ApplicationRecord
  belongs_to :school
  belongs_to :student
end
