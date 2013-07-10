class Picture < ActiveRecord::Base
  attr_accessible :url

  belongs_to :album


  mount_uploader :url, ImageUploader

end
