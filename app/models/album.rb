class Album < ActiveRecord::Base
  attr_accessible :name

  has_many :pictures
  belongs_to :user

  validates :name,
    presence:true
end
