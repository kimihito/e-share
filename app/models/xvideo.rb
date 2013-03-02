require 'open-uri'

class Xvideo < ActiveRecord::Base
  before_validation :set_title_and_thumb_url

  has_many :watch_histories, dependent: :destroy
  has_many :watched_users, through: :watch_histories, source: :user

  has_many :favorite_videos, dependent: :destroy
  has_many :favorited_users, through: :favorite_videos, source: :user

  attr_accessible :url
  validates_presence_of :url, :thumb_url, :title
  validates_uniqueness_of :url

  scope :recently_watched, -> page = 1 {
    recently_watched_xvideo_ids = WatchHistory.order('created_at ASC').select(:xvideo_id).uniq.pluck(:id)#.page(f*ck)
    where(id: recently_watched_xvideo_ids)
  }

  scope :recently_favorited, -> page = 1 {
    recently_favorited_xvideo_ids = FavoriteVideo.order('created_at ASC').select(:xvideo_id).uniq.pluck(:id)#.page(f*ck)
    where(id: recently_favorited_xvideo_ids)
  }

  def favorite_count
    FavoriteVideo.where(xvideo_id:id).count
  end

  def user_favorited?(user)
    user && FavoriteVideo.where(user_id:user.id,xvideo_id:id).present?
  end

  private

  def set_title_and_thumb_url
    begin
      body = open(self.url).read
      self.title = body.match(/<title>(.*) - XVIDEOS.*<\/title>/)[1]
      self.thumb_url = body.match(/<img src="([^\ ]*)" .*class="thumb"/)[1]
    rescue
      self.title = nil
      self.thumb_url = nil
    end
  end
end
