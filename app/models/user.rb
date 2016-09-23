class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :invitations
  has_many :invitees, through: :invitations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  NAME_REGEX = /[\w\-\']+([\s]+[\w\-\']){1}/
  validates :name, :presence => true, length: { minimum:3 }, :format => {:with=>NAME_REGEX} 
  validates :description, :presence => true, length: { minimum:10 }
  validates :email, :presence => true, :uniqueness => {:case_sensitive=>false}, :format => {:with=>VALID_EMAIL_REGEX} 
end
