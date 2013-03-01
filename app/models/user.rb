class User < ActiveRecord::Base
  before_create :set_uid

  private

  def set_uid
    self.uid = SecureRandom.hex
  end
end
