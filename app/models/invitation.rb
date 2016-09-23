class Invitation < ActiveRecord::Base
  belongs_to :user
  has_many :invitees, class_name: "User", foreign_key: "invitee_id"
  belongs_to :invitee, class_name: "User"
end
