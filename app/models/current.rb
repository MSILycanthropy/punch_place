# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user, :school

  def user=(user)
    super
    self.school = user.school
  end
end
