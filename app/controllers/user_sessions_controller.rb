# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(root_path, notice: t(:logged_in), status: :see_other)
    else
      flash.now[:alert] = t(:login_failed)
      render action: 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: t(:logged_out), status: :see_other)
  end
end
