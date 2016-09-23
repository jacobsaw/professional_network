class Friendship < ActiveRecord::Base
  belongs_to :user
  has_many :friends, class_name: "User", foreign_key: "friend_id"
  belongs_to :friend, class_name: "User"
end
