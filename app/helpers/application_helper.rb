# frozen_string_literal: true

module ApplicationHelper
  def tab_classes(condition)
    classes = 'tab'

    classes += ' tab-active' if condition

    classes
  end
end
