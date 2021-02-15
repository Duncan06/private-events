class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(name: params[:name])

    if @user

      session[:current_user_id] = @user.id

      redirect_to '/welcome'

    else

      redirect_to '/login'

    end

  end

  def destroy

    @_current_user = session[:current_user_id] = nil
    redirect_to root_url, notice: "You have successfully logged out."

  end

  def login
  end

  def welcome
  end
end
