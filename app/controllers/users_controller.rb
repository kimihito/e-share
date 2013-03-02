class UsersController < ApplicationController
  before_filter :set_user, only: :show
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render nothing: true, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
    user=user_sign_in(params)
    if user
      redirect_to user
    else
      redirect_to :root
    end
  end

  private
  def set_user
    @user = User.where(id: params[:id]).first
  end
end
