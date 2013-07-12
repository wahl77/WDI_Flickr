class Picture < ActiveRecord::Base
  attr_accessible :url

  belongs_to :album
  has_one :user, through: :album


  mount_uploader :url, ImageUploader

end
