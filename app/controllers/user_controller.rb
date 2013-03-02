class UserController < ApplicationController
  def index
  end

  def login
    user_sign_in(params)
    redirect_to :user
  end
end
