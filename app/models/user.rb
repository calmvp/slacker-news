class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments
  
  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :name, :email
  validates_uniqueness_of :email
end
