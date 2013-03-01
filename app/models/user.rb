class User < ActiveRecord::Base
  before_create :set_uid

  has_many :watch_histories, dependent: :destroy
  has_many :watched_xvideos, through: :watch_histories, source: :xvideo

  private

  def set_uid
    self.uid = SecureRandom.hex
  end
end
