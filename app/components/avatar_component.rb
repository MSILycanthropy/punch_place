# frozen_string_literal: true

class AvatarComponent < ApplicationComponent
  attr_reader :name, :width

  erb_template <<-ERB
    <div class="avatar">
      <div class="<%= width %> rounded-full">
        <img src="<%= avatar_uri(name) %>" alt="<%= name %>">
      </div>
    </div>
  ERB

  def initialize(name:, width: 'w-12')
    @name = name
    @width = width

    super
  end

  private

  def avatar_uri(name)
    initial = name.first.presence || '💩'
    InitialAvatar.avatar_data_uri(initial)
  end
end
