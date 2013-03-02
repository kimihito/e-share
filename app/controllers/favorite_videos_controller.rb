class FavoriteVideosController < ApplicationController
  before_filter :user_signed_in!#, only:[:create,:destroy]

  # POST /favorite_videos.json
  def create
    fav=current_user.favorite_videos.new
    fav.xvideo=Xvideo.find(params[:id])
    if fav.save
      render json:fav
    else
      render nothing:true,status: :unprocessable_entity
    end
  end

  # DELETE /favorite_videos/1.json
  def destroy
    @favorite_video = FavoriteVideo.find(params[:id])
    format.json { head :no_content }
  end
end
