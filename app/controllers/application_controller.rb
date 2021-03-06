class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_signed_in?,:current_user

  def user_signed_in!
    render nothing:true unless user_signed_in?
  end
  def user_sign_in(params)
    user=User.where(uid:params[:uid],token:params[:token]).first
    if user
      session['user_id']=user.id
      user
    end
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
