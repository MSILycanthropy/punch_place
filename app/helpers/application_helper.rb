# frozen_string_literal: true

module ApplicationHelper
  def avatar(name)
    initial = name.first
    InitialAvatar.avatar_data_uri(initial)
  end
end
