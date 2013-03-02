class HomeController < ApplicationController
  def index
    @recently_watched = Xvideo.recently_watched
  end
end
