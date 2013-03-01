require 'open-uri'

class Xvideo < ActiveRecord::Base
  before_validation :set_title_and_thumb_url

  has_many :watch_histories, dependent: :destroy
  has_many :watched_users, through: :watch_histories, source: :user

  attr_accessible :url
  validates_presence_of :url, :thumb_url, :title
  validates_uniqueness_of :url

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
