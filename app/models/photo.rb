class Photo < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :title
end