class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :username, :password, :password_confirmation
  has_many :albums, dependent: :destroy
  has_many :pictures, through: :albums

  validates :username,
    presence:true,
    uniqueness:true

  validates :email,
    presence:true,
    uniqueness:true,
    format:{with: EMAIL_REGEX}

    
  validates :password,
    confirmation: true,
    presence:true, on: :create


  # Downcase all usernames by default
  def username=(value)
    write_attribute :username, value.downcase
  end

  # Remove white space and downcase it
  def email=(value)
    value = value.present? ? value.gsub(/\s*/, '').downcase : nil
    write_attribute :email, value
  end

  def num_albums
    return self.albums.count
  end

  def is_admin?
    return self.is_admin
  end
end
