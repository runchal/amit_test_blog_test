class Post < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  attr_accessible :body, :subtitle, :title, :user_id, :photo, :photo_cache

  belongs_to :user
  belongs_to :admin

  has_many :comments

  validates :body, presence: true

  validates :subtitle, presence: true

  validates :title, presence: true

  # validate :user_or_admin_exists

  # private

  # def user_or_admin_exists
  #   if !(user_id.blank? ^ admin_id.blank?)
  #     errors.add_to_base("Need either a user or admin ID")
  #   end
  # end

end
