class Photo < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :title
  mount_uploader :image, ImageUploader
end