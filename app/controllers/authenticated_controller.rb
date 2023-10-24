# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  layout 'authenticated'

  protect_from_forgery with: :exception

  before_action :require_login
  before_action :set_user

  private

  def set_user
    Current.user = current_user
  end

  def not_authenticated
    redirect_to login_path, alert: t(:please_login)
  end
end
