class ApplicationController < ActionController::Base
  protect_from_forgery
  def user_sign_in(params)
    user=User.where(uid:params[:uid],token:params[:token]).first
    session['user_id']=user.id if user
  end
  def current_user
    return nil unless session['user_id']
    return @current_user if @current_user
    @current_user=User.find(session['user_id'])
    session['user_id']=nil unless @current_user
    @current_user
  end
  def user_signed_in?
    current_user.present?
  end
end
