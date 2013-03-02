# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  before_create :set_uid, :set_token

  has_many :watch_histories, dependent: :destroy
  has_many :watched_xvideos, through: :watch_histories, source: :xvideo

  has_many :favorite_videos, dependent: :destroy
  has_many :favorited_xvideos, through: :favorite_videos, source: :xvideo

  private

  def set_uid
    self.uid = SecureRandom.hex
  end

  def set_token
    self.token = SecureRandom.hex
  end
end
