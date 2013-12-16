class User < ActiveRecord::Base
  has_secure_password
  # attr_accessor :password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :format => {:with => email_regex}
  validates :password, :presence => true, :length => {:minimum => 4}
  validates :password_confirmation, :presence => true
  has_many :items
end

