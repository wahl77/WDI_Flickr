class Album < ActiveRecord::Base
  attr_accessible :name

  has_many :pictures, dependent: :destroy
  belongs_to :user

  validates :name,
    presence:true
end
