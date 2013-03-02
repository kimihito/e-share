class WatchHistoriesController < ApplicationController
  before_filter :set_user
  before_filter :set_watch_history, only: :destroy

  respond_to :json

  # POST /watch_histories
  # POST /watch_histories.json
  def create
    @watch_history = WatchHistory.new
    @watch_history.xvideo = Xvideo.where(url: params[:url]).first_or_create
    @watch_history.user = @user
    @watch_history.save

    #Send pusher data
    html = render_to_string partial:"/common/video",locals:{:xvideo => @watch_history.xvideo},formats:[:html],layout:false

    Pusher['post_videos'].trigger('new', html)

    respond_with(@watch_history)
  end

  # DELETE /watch_histories/1
  # DELETE /watch_histories/1.json
  def destroy
    @watch_history.destroy
    respond_with(@watch_history)
  end

  private

  def set_user
    @user = User.where(uid: params[:uid], token: params[:token]).first
    @user ||= User.create
  end

  def set_watch_history
    @watch_history  = WatchHistory.find(params[:id])
  end
end
