class WatchHistory < ActiveRecord::Base
  belongs_to :xvideo
  belongs_to :user

  validates_presence_of :xvideo
  validates_presence_of :user
end
