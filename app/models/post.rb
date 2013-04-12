class Post < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  attr_accessible :body, :subtitle, :title, :user_id, :photo, :photo_cache

  belongs_to :user
  belongs_to :admin

  has_many :comments

  validates :body, presence: true

  validates :subtitle, presence: true

  validates :title, presence: true

  validates :user_id, presence: true
end
