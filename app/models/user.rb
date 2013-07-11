class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :username, :password, :password_confirmation

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


  def username=(value)
    write_attribute :username, value.downcase
  end

  def email=(value)
    value = value.present? ? value.gsub(/\s*/, '').downcase : nil
    write_attribute :email, value
  end

end
